package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dental.dao.MedicalDao;
import com.lec.dental.dto.MedicalDto;
import com.lec.dental.dto.MemberDto;

public class MedicalWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		if (member != null) {
			String mid = member.getMid();
			String mrtitle = request.getParameter("mrtitle");
			String mrcontent = request.getParameter("mrcontent");
			String mrip = request.getRemoteAddr();
			MedicalDao medicalDao = MedicalDao.getInstance();
			MedicalDto medicalDto = new MedicalDto(0, mid, null, mrtitle, mrcontent, null, 0, 0, 0, 0, mrip);
			int result = medicalDao.writeMedical(medicalDto);
			if (result == MedicalDao.SUCCESS) {
				request.setAttribute("medicalWriteResult", "글등록 성공");
			} else {
				request.setAttribute("medicalWriteResult", "글등록 실패");
			}
			request.setAttribute("pageNum", request.getParameter("pageNum"));
		}

	}

}
