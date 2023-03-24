package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.MedicalDao;
import com.lec.dental.dto.MedicalDto;

public class MedicalReplyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int mrno = Integer.parseInt(request.getParameter("mrno")); // 원글의 글 번호
		MedicalDao meDao = MedicalDao.getInstance();
		MedicalDto originMedical = meDao.modifMedicalView(mrno);
		request.setAttribute("originMedical", originMedical); // 답변글을 달려는 글의 원글정보
	}

}
