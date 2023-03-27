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
<link href="${conPath }/css/noticeList.css" rel="stylesheet">
<style>
#content_form {
	height: 420px;
	margin: 80px auto 0px;
}

#content_form table tr {
	height: 60px;
}

button, .btn {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background: white;
	color: black;
	margin: 0;
	padding: 0.5rem 1rem;
	font-size: 1rem;
	font-weight: 400;
	font-weight: bol text-align: center;
	text-decoration: none;
	border-radius: 4px;
	border: 2px solid #444444;
	display: inline-block;
	width: auto;
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px
		rgba(0, 0, 0, 0.06);
	cursor: pointer;
	transition: 0.5s;
}
#review {
	padding: 0.5rem 1rem;
	text-align: center;
	font-size: 1rem;
	font-weight: 380;
	font-weight: bold;
	border-radius: 4px;
	border: 1px solid #444444;
	margin: 39px;
	padding : 10px;
	width: 100px;
}
</style>
</head>
<body>
	<c:if test="${empty member }">
		<script>
			location.href = '${conPath}/loginView.do?next=reviewWriteView.do';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<form action="${conPath }/reviewWrite.do" method="post" enctype="multipart/form-data">
			<div id="review">
				후기 게시판
			</div>
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="rvtitle" required="required">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="5" name="rvcontent"></textarea></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="rvfilename"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록하기" class="btn">
						<input type="reset" value="취소" class="btn"> 
						<input type="button" value="목록" class="btn" onclick="location.href='${conPath}/reviewList.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>