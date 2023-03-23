package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dental.dao.MedicalDao;
import com.lec.dental.dto.AdminDto;
import com.lec.dental.dto.MedicalDto;
import com.lec.dental.dto.MemberDto;

public class MedicalReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		AdminDto admin = (AdminDto) session.getAttribute("admin");
		if (admin == null) {
			request.setAttribute("medicalResult", "로그인 후에만 답글쓰기 가능");
			return;
		}
		String aid = admin.getAid();
		String mrtitle = request.getParameter("mrtitle");
		String mrcontent = request.getParameter("mrcontent");
		String mrip = request.getRemoteAddr();
		int mrgroup = Integer.parseInt(request.getParameter("mrgroup"));
		int mrstep = Integer.parseInt(request.getParameter("mrstep"));
		int mrindent = Integer.parseInt(request.getParameter("mrindent"));
		MedicalDao meDao = MedicalDao.getInstance();
		MedicalDto meDto = new MedicalDto(0, null, aid, mrtitle, mrcontent, null, 0, mrgroup, mrstep, mrindent, mrip);
		int result = meDao.reply(meDto);
		if (result == MedicalDao.SUCCESS) {
			request.setAttribute("medicalResult", "답글쓰기 성공");
		} else {
			request.setAttribute("medicalResult", "답글쓰기 실패");
		}
	}

}
