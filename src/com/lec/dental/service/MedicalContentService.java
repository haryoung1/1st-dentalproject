package com.lec.dental.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dental.dao.MedicalDao;
import com.lec.dental.dto.AdminDto;
import com.lec.dental.dto.MedicalDto;
import com.lec.dental.dto.MemberDto;

public class MedicalContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int mrno = Integer.parseInt(request.getParameter("mrno"));
		MedicalDao medicalDao = MedicalDao.getInstance();
		MedicalDto dto = medicalDao.content(mrno);
		request.setAttribute("mrContent", dto);
		String contentOk = "fail";
//		1. dto.mid = member.mid
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		String mid = null;
		if(member!=null) {
			mid = member.getMid();
		}
		if(dto.getMid()!=null && dto.getMid().equals(mid)) {
			contentOk = "success";
		}
//		2. admin이 로그인하면
		AdminDto admin = (AdminDto)session.getAttribute("admin");
		if(admin!=null) {
			contentOk = "success";
		}
//		3. dto.mrgroup == member.mid가 쓴 글의 글 그룹과 같으면
		ArrayList<Integer> mrgroups = medicalDao.getMrgroups(mid);
		for(Integer mrgroup : mrgroups) {
			if(mrgroup.equals(dto.getMrgroup())) {
				contentOk = "success";
				break;
			}
		}
		request.setAttribute("contentOk", contentOk);
	}
}
