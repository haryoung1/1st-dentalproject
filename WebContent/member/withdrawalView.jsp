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
<link href="${conPath}/css/member/join.css" rel="stylesheet">
<style>
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<form action="${conPath }/withdrawal.do" method="post">
		<table>
			<caption>회원 탈퇴</caption>
			<tr>
				<td>${member.mname }님</td>
			</tr>
			<tr>
				<td>아이디 : ${member.mid }</td>
			</tr>

			<caption>회원탈퇴를 하시겠습니까 ?</caption>
		</table>
		<div class="create">
			<input class="but3" type="submit" value="회원탈퇴"> 
			<input class="but4" type="button" value="이전" onclick="history.go(-1)">
		</div>
	</form>
</body>
</html>