package com.lec.dental.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.dao.NoticeDao;
import com.lec.dental.dto.NoticeDto;

public class NoticeModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int nbno = Integer.parseInt(request.getParameter("nbno"));
		String aid = request.getParameter("aid");
		String nbtitle = request.getParameter("nbtitle");
		String nbcontent = request.getParameter("nbcontent");
		String nbip = request.getRemoteAddr();
		NoticeDao nDao = NoticeDao.getInstance();
		NoticeDto nDto = new NoticeDto(nbno, aid, nbtitle, nbcontent, null, nbip);
		int result = nDao.modifyNotice(nDto);
		if (result == NoticeDao.SUCCESS) {
			request.setAttribute("noticeResult", "글 수정 성공");
		} else {
			request.setAttribute("noticeResult", "글 수정 실패");
		}
		request.setAttribute("pageNum", request.getParameter("pageNum"));
	}
}