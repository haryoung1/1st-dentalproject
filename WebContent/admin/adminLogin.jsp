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
<link href="${conPath }/css/style.css" rel="stylesheet">
<style>
#content_form {
	height: 370px;
	margin: 130px auto 0px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="../main/header.jsp" />
	<c:if test="${not empty admin }">
		<script>
			alert('관리자모드로 접속 하셨습니다');
			location.href='${conPath }/main.do';
		</script>
	</c:if>
	<c:if test="${not empty member }">
		<script>
			alert('관리자 전용 모드 입니다.');
			history.back();
		</script>
	</c:if>
	<div id="content_form">
		<form action="${conPath }/adminLogin.do" method="post">
			<table>
				<caption>관리자 로그인</caption>
			<tr>
				<th>ID</th>
				<td>
					<input type="text" name="aid" required="required" autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="apw" required="required"></td>
			</tr>
			<tr>
				<th>관리자코드</th>
				<td><input type="password" name="acode" required="required"></td>
			</tr>
			<tr>
				<td colspan="2">
					<p>
						<input type="submit" value="로그인" class="btn">
						<input type="button" value="신규등록" class="btn" onclick="location='${conPath}/adminjoinView.do'">
					</p>
				</td>
			</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>