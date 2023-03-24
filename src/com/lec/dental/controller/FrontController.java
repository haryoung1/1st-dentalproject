package com.lec.dental.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dental.service.*;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);

	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		String viewPage = null;
		Service service = null;
		if (command.equals("/main.do")) { // 첫 실행화면
			viewPage = "main/main.jsp";
		}else if (command.equals("/intro.do")) { // 의료진소개
			viewPage = "main/intro.jsp";
		}else if (command.equals("/map.do")) { // 찾아오시는 길
			viewPage = "main/map.jsp";
		}
		/* * * * * * * * * * * * * * * * * * * * * * * * * * *  *
		 * * * * * * * * * * * member 관련요청 * * * * * * * *  *  *
		 * * * * * * * * * * * * * * * * * * * * * * * * * * *  */
			
		else if (command.equals("/midConfirm.do")) { // 아이디 중복체크
			service = new MidConfirmService();
			service.execute(request, response);
			viewPage = "member/midConfirm.jsp";
		}else if (command.equals("/memailConfirm.do")) { // 이메일 중복체크
			service = new MemailConfirmService();
			service.execute(request, response);
			viewPage = "member/mmailConfirm.jsp";
		}else if (command.equals("/joinView.do")) { // 회원가입 화면
			viewPage = "member/join.jsp";
		}else if(command.equals("/join.do")) { // 회원가입 db처리
			service = new JoinService();
			service.execute(request, response);
			viewPage = "loginView.do";
		}else if (command.equals("/loginView.do")) { // 로그인 화면
			viewPage = "member/login.jsp";
		}else if (command.equals("/login.do")) { // 로그인 db및 세션처리
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if (command.equals("/logout.do")) { // 로그아웃 및 세션 날리기
			service = new MLogoutService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if (command.equals("/modifyView.do")) { // 정보수정을 하기위한 view
			viewPage = "member/modify.jsp";
		}else if (command.equals("/modify.do")) { // DB 정보수정
			service = new MModifyService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(command.equals("/withdrawalView.do")) { // 회원탈퇴
			viewPage = "member/withdrawalView.jsp";
		}else if(command.equals("/withdrawal.do")) {
			service = new MWithdrawalService();
			service.execute(request, response);
			viewPage = "main/main.jsp";	
			
		/* * * * * * * * * * * * * * * * * * * * * * * * * * * *
		* * * * * * * * * * * 어드민 관련요청 * * * * * * * * * * * * 
		* * * * * * * * * * * * * * * * * * * * * * * * * * * */
			
		}else if (command.equals("/aidConfirm.do")) { // 아이디 중복체크
			service = new AidConfirmService();
			service.execute(request, response);
			viewPage = "admin/aidConfirm.jsp";
		}else if(command.equals("/adminjoinView.do")) { // 관리자 등록화면
			viewPage = "admin/adminjoin.jsp";	
		}else if(command.equals("/adminjoin.do")) {     // 관리자 등록 처리
			service = new AdminJoinService();
			service.execute(request, response);
			viewPage = "admin/adminLogin.jsp";		
		}else if(command.equals("/adminLoginView.do")) { // 관리자 로그인 화면
			viewPage ="admin/adminLogin.jsp";
		}else if(command.equals("/adminLogin.do")) {     // 관리자 로그인 처리
			service = new AdminLoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";	
		}else if(command.equals("/adminwithdrawalView.do")) { // 관리자 탈퇴
			viewPage = "admin/adminwithdrawalView.jsp";
		}else if(command.equals("/adminwithdrawal.do")) {
			service = new AWithdrawalService();
			service.execute(request, response);
			viewPage = "main/main.jsp";	
		}else if (command.equals("/memberList.do")) { // 회원목록
			service = new MemberListSerivce();
			service.execute(request, response);
			viewPage = "member/MemberList.jsp";	
		}

		/* * * * * * * * * * * * * * * * * * * * * * * * * * * *
		 * * * * * * * * * * * 공지사항 관련요청 * * * * * * * * * * *  
		 * * * * * * * * * * * * * * * * * * * * * * * * * * * */	
		
		else if (command.equals("/noticeList.do")) { // 공지사항 글 목록
			service = new NoticeListService();
			service.execute(request, response);
			viewPage = "NoticeBoard/NoticeList.jsp";
		}else if (command.equals("/noticeWriteView.do")) { // 공지사항 등록
			viewPage = "NoticeBoard/NoticeWrite.jsp";
		}else if (command.equals("/noticeWrite.do")) { // 공지글 db 저장
			service = new NoticeWriteService();
			service.execute(request, response);
			viewPage = "noticeList.do";
		}else if(command.equals("/noticeContent.do")) { // 공지글 상세보기
			service = new NoticeContentService();
			service.execute(request, response);
			viewPage = "NoticeBoard/NoticeContent.jsp";
		}else if(command.equals("/noticeModifyView.do")) { // 공지글 수정 화면
			service = new NoticeModifyViewService();
			service.execute(request, response);
			viewPage = "NoticeBoard/NoticeModify.jsp";
		}else if(command.equals("/noticeModify.do")) { // 공지글 수정 처리
			service = new NoticeModifyService();
			service.execute(request, response);
			viewPage = "noticeList.do";
		}else if (command.equals("/noticeDelete.do")) { // 공지글 삭제
			service = new NoticeDeleteService();
			service.execute(request, response);
			viewPage = "noticeList.do";
		}
		
		/* * * * * * * * * * * * * * * * * * * * * * * * * * * *
		 * * * * * * * * * * * 진료예약게시판 관련요청 * * * * * * * * * 
		 * * * * * * * * * * * * * * * * * * * * * * * * * * * */	
		
		else if (command.equals("/medicalList.do")) { // 진료예약 게시판 글 목록
			service = new MedicalListService();
			service.execute(request, response);
			viewPage = "MedicalBoard/MedicalList.jsp";
		}else if (command.equals("/medicalWriteView.do")) { // 진료예약 게시판 글 쓰기
			viewPage = "MedicalBoard/MedicalWrite.jsp";
		}else if (command.equals("/medicalWrite.do")) { // 진료예약 글 db 저장
			service = new MedicalWriteService();
			service.execute(request, response);
			viewPage = "medicalList.do";
		}else if(command.equals("/medicalContent.do")) { // 진료예약 글 상세보기
			service = new MedicalContentService();
			service.execute(request, response);
			viewPage = "MedicalBoard/MedicalContent.jsp";
		}else if(command.equals("/medicalModifyView.do")) { // 진료예약 글 수정하기
			service = new MedicalModifyViewService();
			service.execute(request, response);
			viewPage = "MedicalBoard/MedicalModify.jsp";
		}else if(command.equals("/medicalModify.do")) { // 수정 처리
			service = new MedicalModifyService();
			service.execute(request, response);
			viewPage = "medicalList.do";
		}else if (command.equals("/medicalDelete.do")) { // 글삭제
			service = new MedicalDeleteService();
			service.execute(request, response);
			viewPage = "medicalList.do";
			
		}else if (command.equals("/medicalReplyView.do")) { // 답변
			service = new MedicalReplyViewService();
			service.execute(request, response);
			viewPage = "MedicalBoard/medicalReply.jsp";
			
		}else if (command.equals("/medicalReply.do")) { // 답변처리
			service = new MedicalReplyService();
			service.execute(request, response);
			viewPage = "medicalList.do";
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	} // actuonDo
} // Controller
