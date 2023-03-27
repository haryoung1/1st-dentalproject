package com.lec.dental.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.ReviewDao;
import com.lec.dental.dto.ReviewDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("ReviewBoardUp");
		int maxSize = 1024 * 1024 * 10; // 최대업로드 사이즈는 10M
		String rvfilename = "", dbFileName = null;
		try {
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "utf-8",
					new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			rvfilename = mRequest.getFilesystemName(param);
			dbFileName = mRequest.getParameter("dbFileName");
			if (rvfilename == null) {
				rvfilename = dbFileName;
			}
			// 글번호, 글제목, 글본문, 가져오기
			int rvno = Integer.parseInt(mRequest.getParameter("rvno"));
			String rvtitle = mRequest.getParameter("rvtitle");
			String rvcontent = mRequest.getParameter("rvcontent");
			String rvip = request.getRemoteAddr();
			ReviewDao rDao = ReviewDao.getInstance();
			ReviewDto rDto = new ReviewDto(rvno, null, null, rvtitle, rvcontent, rvfilename, null, 0, rvip);
			int result = rDao.modifyReview(rDto);
			if (result == rDao.SUCCESS) {
				request.setAttribute("reviewResult", "글 수정 성공");
			} else {
				request.setAttribute("reviewResult", "글 수정 실패");
			}
			// mRequest에서 넘어온 pageNum(mRequest를 사용하면 request의 파라미터들이 다 null이 됨)을 request에
			// set
			request.setAttribute("pageNum", mRequest.getParameter("pageNum"));
		} catch (IOException e) {
			System.out.println(e.getMessage());
			request.setAttribute("reviewResult", "글수정 실패");
		}
		// 서버에 올라간 ReviewBoardUp 파일을 소스폴더에 filecopy (파일 수정을 안 했거나, 예외가 떨어질 경우 복사 안 함)
		if (dbFileName != null && !rvfilename.equals(dbFileName)) {
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
