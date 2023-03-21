package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.NoticeDao;
import com.lec.dental.dto.NoticeDto;

public class NoticeModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		int nbno = Integer.parseInt(request.getParameter("nbno"));
		String nbtitle = request.getParameter("nbtitle");
		String nbcontent = request.getParameter("nbcontent");
		String nbip = request.getRemoteAddr();
		NoticeDao noticeDao = NoticeDao.getInstance();
		NoticeDto noticeDto = new NoticeDto(nbno, null, nbtitle, nbcontent, null, nbip, null);
		int result = noticeDao.modifyNotice(noticeDto);
		if (result == NoticeDao.SUCCESS) {
			request.setAttribute("noticeResult", "글 수정 성공");
		} else {
			request.setAttribute("noticeResult", "글 수정 실패");
		}
	}
}