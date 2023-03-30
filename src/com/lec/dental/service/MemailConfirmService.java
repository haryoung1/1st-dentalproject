package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.MemberDao;

public class MemailConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String memail = request.getParameter("memail");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.mEmailConfirm(memail);
		if (result == MemberDao.EXISTENT) {
			request.setAttribute("mailConfirmResult", "<p style=color:blue;>중복된 메일주소 입니다");
		} else {
			request.setAttribute("mailConfirmResult", "<p style=color:blue;>사용 가능한 메일주소 입니다");
		}
	}
}