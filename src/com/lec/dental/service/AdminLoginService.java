package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dental.dao.AdminDao;
import com.lec.dental.dto.AdminDto;

public class AdminLoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String aid = request.getParameter("aid");
		String apw = request.getParameter("apw");
		AdminDao aDao = AdminDao.getInstance();
		int result = aDao.loginCheck(aid, apw);
		if (result == AdminDao.SUCCESS) {
			HttpSession session = request.getSession();
			AdminDto admin = aDao.getAdmin(aid);
			session.setAttribute("admin", admin);
			request.setAttribute("adminLoginResult", "관리자계정으로 들어 오셨습니다.");
		}else {
			System.out.println("에러");
			request.setAttribute("adminloginErrorMsg", "아이디와 비번을 확인하세요");
		}

	}

}
