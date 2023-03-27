package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.ReviewDao;
import com.lec.dental.dto.ReviewDto;

public class ReviewModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int rvno = Integer.parseInt(request.getParameter("rvno"));
		ReviewDao rDao = ReviewDao.getInstance();
		ReviewDto rDto = rDao.modifyView_replyView(rvno);
		request.setAttribute("review", rDto);
	}

}
