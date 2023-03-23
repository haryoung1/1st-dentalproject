package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dental.dao.MedicalDao;
import com.lec.dental.dto.MedicalDto;

public class MedicalWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MedicalDto medical = (MedicalDto) session.getAttribute("medical");
		if (medical != null) {
			String aid = medical.getAid();
			String mid = medical.getMid();
			String mrtitle = request.getParameter("mrtitle");
			String mrcontent = request.getParameter("mrcontent");
			String mrip = request.getRemoteAddr();
			MedicalDao medicalDao = MedicalDao.getInstance();
			MedicalDto medicalDto = new MedicalDto(0, mid, aid, mrtitle, mrcontent, null, 0, 0, 0, 0, mrip, null, null);
			int result = medicalDao.writeMedical(medicalDto);
			if (result == MedicalDao.SUCCESS) {
				request.setAttribute("medicalWriteResult", "글쓰기 성공");
			}else {
				request.setAttribute("medicalWriteResult", "글쓰기 실패");
			}
		}

	}

}
