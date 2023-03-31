package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.MemberDao;
import com.lec.dental.dto.MemberDto;

public class MListContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		MemberDao mDao = MemberDao.getInstance();
		MemberDto mDto = mDao.getMember(mid);
		request.setAttribute("mDto", mDto);
	}

}
