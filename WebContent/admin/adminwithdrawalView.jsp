<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 table {border: 1px solid gray;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
 	$(document).ready(function(){
 		
 	});
</script>  
</head>
<body>
<jsp:include page="../main/header.jsp" />
	<form action="${conPath }/adminwithdrawal.do" method="post">
		<table>
			<caption>관리자 계정 삭제</caption>
			<tr>
				<td>${admin.aname } 님</td>
			</tr>
			<tr>
				<td>아이디 : ${admin.aid }</td>
			</tr>
			<caption>계정삭제를 진행 하시겠습니까?</caption>
		</table>
		<div class="create">
			<input class="btn" type="submit" value="계정삭제"> 
			<input class="btn" type="button" value="이전" onclick="history.go(-1)">
		</div>
	</form>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>