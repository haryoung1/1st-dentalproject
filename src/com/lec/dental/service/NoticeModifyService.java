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
		int result = noticeDao.modifyNotice(nbno, nbtitle, nbcontent, nbip);
		if (result == NoticeDao.SUCCESS) {
			request.setAttribute("noticeResult", result);
		} else {
			request.setAttribute("noticeResult", result);
		}

	}

}