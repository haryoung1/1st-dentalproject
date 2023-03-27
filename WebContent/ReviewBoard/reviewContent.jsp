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
	height: 450px;
	margin: 50px auto 0px;
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
</style>
<script>
	function func() {
		alert('test');
	}
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<table>
			<caption>${rvContent.rvno }번글상세보기</caption>
			<tr>
				<th>작성자</th>
				<td>${rvContent.mid }${rvContent.aid }</td>
			</tr>
			<tr>

				<th>제목</th>
				<td>${rvContent.rvtitle }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><pre>${rvContent.rvcontent }</pre></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${rvContent.rvhit }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><c:if test="${not empty rvContent.rvfilename }">
						<a href="${conPath }/ReviewBoardUp/${rvContent.rvfilename}"
							target="_blank">${rvContent.rvfilename}</a>
					</c:if> <c:if test="${empty rvContent.rvfilename }">
						첨부파일 없음
					</c:if></td>
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${member.mid eq rvContent.mid}">
						<input type="button" value="수정" class="btn"
							onclick="location='${conPath}/reviewModifyView.do?rvno=${rvContent.rvno}&pageNum=${param.pageNum }'">
					</c:if> 
					<c:if test="${member.mid eq rvContent.mid or not empty admin}">
						<input type="button" value="삭제" class="btn"
							onclick="location='${conPath}/reviewDelete.do?rvno=${rvContent.rvno}&pageNum=${param.pageNum }'">
					</c:if> 
						<input type="button" value="목록" class="btn"
							onclick="location='${conPath}/reviewList.do?pageNum=${param.pageNum }'">
			</tr>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>


