package com.lec.dental.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.MemberDao;
import com.lec.dental.dto.MemberDto;

public class MemberListSerivce implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			if (request.getAttribute("pageNum") != null) {
				pageNum = (String) request.getAttribute("pageNum");
			} else {
				pageNum = "1";
			}
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 5, BLOCKSIZE = 2;
		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		MemberDao memberDao = MemberDao.getInstance();
		ArrayList<MemberDto> memberList = memberDao.getMemberlist(startRow, endRow);
		request.setAttribute("memberList", memberList);
		int totCnt = memberDao.getMemberCnt(); // 가입한 회원 수
		int pageCnt = (int) Math.ceil((double) totCnt / PAGESIZE); // 페이지 갯수
		int startPage = ((currentPage - 1) / BLOCKSIZE) * BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("totCnt", totCnt);
		request.setAttribute("pageNum", currentPage);
	}
}
