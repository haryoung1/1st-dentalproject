package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.MedicalDao;
import com.lec.dental.dto.MedicalDto;

public class MedicalModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int mrno = Integer.parseInt(request.getParameter("mrno"));
		MedicalDao meDao = MedicalDao.getInstance();
		MedicalDto meDto = meDao.modifMedicalView(mrno);
		request.setAttribute("mrContent", meDto);

	}

}
