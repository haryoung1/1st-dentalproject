package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.AdminDao;
import com.lec.dental.dto.AdminDto;

public class AdminJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String aid = request.getParameter("aid");
		String apw = request.getParameter("apw");
		String aname = request.getParameter("aname");
		String acode = request.getParameter("acode");
		if (acode.equals("143")) { // 관리자 등록 할때 사용하는 내부코드
			AdminDao aDao = AdminDao.getInstance();
			AdminDto admin = new AdminDto(aid, apw, aname, acode);
			int result = aDao.joinAdmin(admin);
			if (result == AdminDao.SUCCESS) {
				request.setAttribute("adminJoinResult", "관리자 등록을 성공했습니다.");
			} else {
				request.setAttribute("adminJoinResult", "등록 실패하였습니다. 다시 시도해주십시오.");
			}
		} else {
			request.setAttribute("adminCodeError", "관리자코드가 일치하지 않습니다.");
		}
	}

}
