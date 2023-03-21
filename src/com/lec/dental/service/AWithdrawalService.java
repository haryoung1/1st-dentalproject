package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dental.dao.AdminDao;
import com.lec.dental.dto.AdminDto;

public class AWithdrawalService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String aid = null;
		AdminDto sessionAdmin = (AdminDto) session.getAttribute("admin");
		if (sessionAdmin != null) {
			aid = sessionAdmin.getAid();
		}
		AdminDao aDao = AdminDao.getInstance();
		int result = aDao.withdrawalAdmin(aid);
		session.invalidate();
		if (result == AdminDao.SUCCESS) {
			request.setAttribute("AwithdrawalResult", "관리자 계정이 삭제 되었습니다.");
		}else {
			request.setAttribute("AwithdrawalResult", "로그인이 되어 있지 않습니다.");
		}
	}

}
