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
		String mid = request.getParameter("mid");
		String aid = request.getParameter("aid");
		String mrtitle = request.getParameter("mrtitle");
		String mrcontent = request.getParameter("mrcontent");
		String mrip = request.getRemoteAddr();
		int mrgroup = Integer.parseInt(request.getParameter("mrgroup"));
		int mrstep = Integer.parseInt(request.getParameter("mrstep"));
		int mrindent = Integer.parseInt(request.getParameter("mrindent"));
		MedicalDao meDao = MedicalDao.getInstance();
		MedicalDto meDto = new MedicalDto(0, mid, aid, mrtitle, mrcontent, null, 0, mrgroup, mrstep, mrindent, mrip);
		int result = meDao.reply(meDto);
		if (result == MedicalDao.SUCCESS) {
			request.setAttribute("medicalResult", "답글쓰기 성공");
		}else {
			request.setAttribute("medicalResult", "답글쓰기 실패");
		}
	}
}
