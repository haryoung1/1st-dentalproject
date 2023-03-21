package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dental.dao.NoticeDao;
import com.lec.dental.dto.AdminDto;
import com.lec.dental.dto.NoticeDto;

public class NoticeWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		AdminDto admin = (AdminDto) session.getAttribute("admin");
		if (admin != null) {
			String aid = admin.getAid();
			String nbtitle = request.getParameter("nbtitle");
			String nbcontent = request.getParameter("nbcontent");
			String nbip = request.getRemoteAddr();
			NoticeDao noticeDao = NoticeDao.getInstance();
			NoticeDto noticeDto = new NoticeDto(0, aid, nbtitle, nbcontent, null, nbip, null);
			int result = noticeDao.writeNotice(noticeDto);
			if (result == NoticeDao.SUCCESS) {
				request.setAttribute("noticeWriteResult", "글쓰기 성공");
			} else {
				request.setAttribute("noticeWriteResult", "글쓰기 실패");
			}
		} else {
			request.setAttribute("noticeWriteResult", "관리자만 작성이 가능 합니다");
		}
	}

}
