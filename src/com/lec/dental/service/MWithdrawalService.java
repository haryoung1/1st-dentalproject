package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dental.dao.MemberDao;
import com.lec.dental.dto.MemberDto;

public class MWithdrawalService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mid = null;
		MemberDto sessionMember = (MemberDto) session.getAttribute("member");
		if (sessionMember != null) {
			mid = sessionMember.getMid();
		}
		MemberDao mDao = MemberDao.getInstance();
		// 회원탈퇴전 각 게시판에 남긴 글 삭제하기
		mDao.withdrawalMR(mid);
		mDao.withdrawalCB(mid);
		mDao.withdrawalRV(mid);
		int result = mDao.withdrawalMember(mid);
		session.invalidate();
		if (result == MemberDao.SUCCESS) {
			request.setAttribute("withdrawalResult", "회원 탈퇴가 완료 되었습니다.");
		} else {
			request.setAttribute("withdrawalResult", "로그인이 되어 있지 않습니다.");
		}

	}
}
