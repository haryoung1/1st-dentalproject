package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.NoticeDao;
import com.lec.dental.dto.NoticeDto;

public class NoticeModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int nbno = Integer.parseInt(request.getParameter("nbno"));
		NoticeDao nDao = NoticeDao.getInstance();
		NoticeDto nDto = nDao.modifyNoticeView(nbno);
		request.setAttribute("nbContent", nDto);

	}

}
