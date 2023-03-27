package com.lec.dental.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dental.dao.ReviewDao;
import com.lec.dental.dto.MemberDto;
import com.lec.dental.dto.ReviewDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 파일첨부 로직 + 파라미터들 받자
		String path = request.getRealPath("ReviewBoardUp");
		int maxSize = 1024 * 1024 * 10; // 최대업로드 사이즈는 10M
		MultipartRequest mRequest = null;
		String rvfilename = "";
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			rvfilename = mRequest.getFilesystemName(param);
			HttpSession session = request.getSession();
			MemberDto member = (MemberDto) session.getAttribute("member");
			if (member != null) {
				String mid = member.getMid();
				String rvtitle = mRequest.getParameter("rvtitle");
				String rvcontent = mRequest.getParameter("rvcontent");
				String rvip = request.getRemoteAddr();
				ReviewDao rDao = ReviewDao.getInstance();
				ReviewDto rDto = new ReviewDto(0, mid, null, rvtitle, rvcontent, rvfilename, null, 0, rvip);
				int result = rDao.writeReview(rDto);
				if (result == ReviewDao.SUCCESS) {
					request.setAttribute("reviewResult", "글쓰기 성공");
				} else {
					request.setAttribute("reviewResult", "글쓰기 실패");
				}

			} else {
				request.setAttribute("reviewResult", "글을 쓰고 싶으면 로그인 하세요");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
			request.setAttribute("reviewResult", "글쓰기 실패");
		}

		// 서버에 올라간 ReviewBoardUp 파일을 소스폴더에 filecopy
		if (rvfilename != null) {
			InputStream is = null;
			OutputStream os = null;
			try {
				File serverFile = new File(path + "/" + rvfilename);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:/project1/source/1stproject/dental/WebContent/ReviewBoardUp" + rvfilename);
				byte[] bs = new byte[(int) serverFile.length()];
				while (true) {
					int nByteCnt = is.read(bs);
					if (nByteCnt == -1)
						break;
					os.write(bs, 0, nByteCnt);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if (os != null)
						os.close();
					if (is != null)
						is.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			} // try
		} // 파일 복사 if
	}
}