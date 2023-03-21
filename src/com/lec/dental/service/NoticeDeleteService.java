package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.NoticeDao;

public class NoticeDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int nbno = Integer.parseInt(request.getParameter("nbno"));
		NoticeDao nDao = NoticeDao.getInstance();
		int result = nDao.deleteNotice(nbno);
		if (result == nDao.SUCCESS) {
			request.setAttribute("noticeResult", "글 삭제 성공");
		} else {
			request.setAttribute("noticeResult", "글 삭제 성공");
		}
	}

}
