package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dental.dao.MedicalDao;
import com.lec.dental.dto.MedicalDto;

public class MedicalContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int mrno = Integer.parseInt(request.getParameter("mrno"));
		MedicalDao medicalDao = MedicalDao.getInstance();
		MedicalDto dto = medicalDao.content(mrno);
		request.setAttribute("mrContent", dto);
	}
}
