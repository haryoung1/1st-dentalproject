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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>
#content_form {
	height: 450px;
	margin: 50px auto 0px;
}

.btn {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background: white;
	color: black;
	margin: 0;
	padding: 0.5rem 1rem;
	font-size: 1rem;
	font-weight: 400;
	font-weight: bold;
	text-align: center;
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
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<table>
			<caption>${nContent.nbno }번 글 상세보기</caption>
			<tr>
				<th>작성자</th>
				<td>${nContent.aid }님</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${nContent.nbtitle }</td>
			</tr>
			<tr>
				<th>본문</th>
				<td><pre style="white-space: pre-wrap;">${nContent.nbcontent }</pre></td>
			</tr>
			<tr>
				<td colspan="2"><c:if
						test="${empty member and not empty admin}">
						<input type="button" value="수정" class="btn"
							onclick="location='${conPath}/noticeModifyView.do?nbno=${nContent.nbno}&pageNum=${param.pageNum }'">
						<input type="button" value="목록" class="btn"
							onclick="location='${conPath}/noticeList.do?pageNum=${param.pageNum }'">
					</c:if> <c:if test="${empty member and not empty admin}">
						<input type="button" value="삭제" class="btn" id="btn1"
							onclick="location='${conPath}/noticeDelete.do?nbno=${nContent.nbno}&pageNum=${param.pageNum }'">
					</c:if> <c:if test="${empty admin}">
						<input type="button" value="목록" class="btn"
							onclick="location='${conPath}/noticeList.do?pageNum=${param.pageNum }'">
					</c:if>
			</tr>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>