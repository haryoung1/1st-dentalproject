<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/header.css" rel="stylesheet">
<style>
</style>
</head>
<body>
	<header>
		<c:if test="${empty member and empty admin}">
			<%-- 로그인 전 화면 --%>
			<div class="gnb">
				<ul>
					<li><a href="${conPath }/joinView.do">회원가입</a></li>
					<li><a href="${conPath }/loginView.do">로그인</a></li>
				</ul>
			</div>
			<div class="logo" onclick="location.href='${conPath}/main.do'">
				<img src="image/로고.png">
			</div>
		</c:if>

		<c:if test="${not empty member and empty admin}">
			<%-- 멤버 로그인 화면--%>
			<div class="gnb">
				<ul>
					<li><a href="${conPath }/logout.do">로그아웃</a></li>
					<li><a href="${conPath }/modifyView.do">정보수정</a></li>
					<li><a>${member.mname }님 &nbsp; ▶</a></li>
				</ul>
			</div>
			<div class="logo" onclick="location.href='${conPath}/main.do'">
				<img src="image/로고.png">
			</div>
		</c:if>

		<c:if test="${empty member and not empty admin}">
			<%-- 관리자 모드 로그인 화면--%>
			<div class="gnb">
				<ul>
					<li><a href="${conPath }/boardList.do">회원목록</a></li>
					<li><a href="${conPath }/logout.do">로그아웃</a></li>
					<li><a>${admin.aname }님 &nbsp; ▶</a></li>
				</ul>
			</div>
			<div class="logo" onclick="location.href='${conPath}/main.do'">
				<img src="image/로고.png">
			</div>
		</c:if>
		<div class="submenu">
			<ul>
				<li><img src="image/공지사항.png"> <a
					href="${conPath }/noticeList.do">공지사항</a></li>
				<li><img src="image/의료진소개.png"> <a
					href="${conPath }/intro.do">의료진소개</a></li>
				<li><img src="image/상담.png"> <a href="#">온라인상담</a></li>
				<li><img src="image/진료예약.png"> <a href="#">진료예약</a></li>
				<li><img src="image/공지사항.png"> <a href="#">후기게시판</a> <br>
				</li>
			</ul>
		</div>
	</header>
</body>
</html>