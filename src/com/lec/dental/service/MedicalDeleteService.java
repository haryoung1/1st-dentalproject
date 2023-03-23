package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.MedicalDao;

public class MedicalDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int mrno = Integer.parseInt(request.getParameter("mrno"));
		MedicalDao meDao = MedicalDao.getInstance();
		int result = meDao.deleteMedical(mrno);
		if (result == MedicalDao.SUCCESS) {
			request.setAttribute("medicalResult", "글 삭제 성공");
		} else {
			request.setAttribute("medicalResult", "글 삭제 실패");
		}
	}

}
