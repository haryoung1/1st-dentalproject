package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.MedicalDao;
import com.lec.dental.dto.MedicalDto;

public class MedicalModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int mrno = Integer.parseInt(request.getParameter("mrno"));
		String mid = request.getParameter("mid");
		String aid = request.getParameter("aid");
		String mrtitle = request.getParameter("mrtitle");
		String mrcontent = request.getParameter("mrcontent");
		String mrip = request.getRemoteAddr();
		String mname = request.getParameter("mname");
		MedicalDao meDao = MedicalDao.getInstance();
		MedicalDto meDto = new MedicalDto(mrno, mid, aid, mrtitle, mrcontent, null, 0, 0, 0, 0, mrip);
		int result = meDao.modifyMedical(meDto);
		if (result == MedicalDao.SUCCESS) {
			request.setAttribute("medicalResult", "글 수정 성공");
		} else {
			request.setAttribute("medicalResult", "글 수정 실패");
		}
		request.setAttribute("pageNum", request.getParameter("pageNum"));
	}

}
