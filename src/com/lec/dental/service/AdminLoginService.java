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
		String acode = request.getParameter("acode");
		AdminDao aDao = AdminDao.getInstance();
		if (acode.equals("143")) {
			int result = aDao.loginCheck(aid, apw);
			if (result == AdminDao.LOGIN_SUCCESS) { // 로그인 성공
				HttpSession session = request.getSession();
				AdminDto admin = aDao.getAdmin(aid);
				session.setAttribute("admin", admin);
			} else { // 로그인 실패
				System.out.println("관리자 아디 or 비번 에러");
				request.setAttribute("adminloginErrorMsg", "아이디 또는 비밀번호를 확인하세요");
			}
		} else {
			System.out.println("관리자 코드 에러!! 코드는 143 이야 ");
			request.setAttribute("adminCodeError", "관리자코드가 일치하지 않습니다.");
		}
	}
}