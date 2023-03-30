package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.AdminDao;

public class AidConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String aid = request.getParameter("aid");
		AdminDao aDao = AdminDao.getInstance();
		int result = aDao.aidConfirm(aid);
		if (result == AdminDao.EXISTENT) {
			request.setAttribute("aidConfirmResult", "<p style=color:blue;>중복된 ID 입니다");
		} else {
			request.setAttribute("aidConfirmResult", "<p style=color:blue;>사용가능한 ID 입니다");
		}
	}

}
