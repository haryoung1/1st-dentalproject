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
<link href="${conPath}/css/member/login.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<c:if test="${not empty admin }">
		<script>
			alert('이미 관리자 모드로 접속 하셨습니다');
			location.href = '${conPath }/main.do';
		</script>
	</c:if>
	<c:if test="${not empty member }">
		<script>
			alert('관리자 전용 모드 입니다.');
			history.back();
		</script>
	</c:if>
	<div class="login-form">
		<form action="${conPath }/adminLogin.do" method="post">
			<h3>관리자 로그인</h3>
			<br>
			<p>
				<input type="text" name="aid" class="text-field" placeholder="아이디">
			</p>
			<p>
				<input type="password" name="apw" class="text-field" placeholder="비밀번호">
			</p>
			<p>
				<input type="password" name="acode" class="text-field" placeholder="코드">
			</p>
			<p>
				<input type="submit" value="로그인" class="submit-btn"> 
				<input type="button" value="신규등록" class="submit-btn" onclick="location='${conPath}/adminjoinView.do'">
			</p>
		</form>
	</div>
	<br>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>