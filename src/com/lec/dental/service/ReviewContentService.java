package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dental.dao.ReviewDao;
import com.lec.dental.dto.AdminDto;
import com.lec.dental.dto.MemberDto;
import com.lec.dental.dto.ReviewDto;

public class ReviewContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int rvno = Integer.parseInt(request.getParameter("rvno"));
		ReviewDao reviewDao = ReviewDao.getInstance();
		ReviewDto dto = reviewDao.content(rvno);
		request.setAttribute("rvContent", dto);
		String reviewOk = "fail";
		// 비회원은 글을 못 보게 하기
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		if (member != null) {
			reviewOk = "success";
		}

		// admin
		AdminDto admin = (AdminDto) session.getAttribute("admin");
		if (admin != null) {
			reviewOk = "success";
		}
		request.setAttribute("reviewOk", reviewOk);
	}

}
