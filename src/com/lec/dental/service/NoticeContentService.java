package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.NoticeDao;
import com.lec.dental.dto.NoticeDto;

public class NoticeContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int nbno = Integer.parseInt(request.getParameter("nbno"));
		NoticeDao noticeDao = NoticeDao.getInstance();
		NoticeDto dto = noticeDao.content(nbno);
		request.setAttribute("nContent", dto);

	}

}
