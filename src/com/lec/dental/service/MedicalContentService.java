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
		MedicalDao  medicalDao = MedicalDao.getInstance();
		MedicalDto dto = medicalDao.content(mrno);
		request.setAttribute("mrContent", dto);
		// 
		String readOk = "fail";
		String mid = request.getParameter("mrContent.mid");
		String aid = request.getParameter("aid");
		// 1번 조건 만족하면 readOk = "success"
		HttpSession session = request.getSession();
		if (dto.getMid() == mid) {
			System.out.println("hi");
		} else {
			System.out.println("bye");
		}
		
		// 2번 조건 만족하면 readOk = "success"
		//ArrayList<Integer> mrgroups = medicalDao.getMrgroups(mid);
		
		// 3조건 만족하면 readOk = "success"
		
		request.setAttribute("readOk", readOk);
	}
}
