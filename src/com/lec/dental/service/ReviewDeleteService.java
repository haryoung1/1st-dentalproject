package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.ReviewDao;

public class ReviewDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int rvno = Integer.parseInt(request.getParameter("rvno"));
		ReviewDao rDao = ReviewDao.getInstance();
		int result = rDao.deleteReview(rvno);
		if (result == ReviewDao.SUCCESS) {
			request.setAttribute("reviewResult", "글 삭제 성공");
		} else {
			request.setAttribute("reviewResult", "글 삭제 실패");
		}
	}

}
