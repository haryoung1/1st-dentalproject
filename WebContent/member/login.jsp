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
</head>
<body>
	<c:if test="${not empty joinResult }">
		<script>
			alert('${joinResult}');
		</script>
	</c:if>
	<c:if test="${not empty joinErrorMsg }">
		<script>
			alert('${joinErrorMsg}');
			history.back();
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div class="login-form">
		<h3>회원로그인</h3>
		<br>
		<form action="${conPath }/login.do" method="post">
		<p>
			<input type="text" name="mid" value="${mid }" class="text-field" placeholder="아이디"> 
		</p>
		<p>
			<input type="password" name="mpw" class="text-field" placeholder="비밀번호">
		</p>
		<p>	
			<input type="submit" value="로그인" class="submit-btn"> 
			<input type="button" value="회원가입" class="submit-btn" onclick="location='${conPath}/joinView.do'">
		</p>
		<p class="links">
			 <a href="#">비밀번호를 잊어버리셨나요?</a>
		</p>
		</form>
	</div>
    <br>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>