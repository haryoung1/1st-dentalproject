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
		<form action="${conPath }/reviewModify.do" method="post"
			enctype="multipart/form-data">
			> <input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="rvno" value="${review.rvno }">
			<table>
				<caption>${review.rvno }번글수정</caption>
				<tr>
					<th>제목</th>
					<td><input type="text" name="rvtitle"
						value="${review.rvtitle }" required="required"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="5" name="rvcontent">${review.rvcontent }</textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="rvfileName" class="btn">
						원첨부파일 : <c:if test="${not empty review.rvfilename }">
							<a href="${conPath }/ReviewBoardUp/${review.rvfilename}"
								target="_blank">${review.rvfilename}</a>
						</c:if> <c:if test="${empty review.rvfilename }">
							첨부파일 없음
						</c:if></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="저장" class="btn">
						<input type="reset" value="취소" class="btn"
						onclick="history.back()"> <input type="button" value="목록"
						class="btn"
						onclick="location='${conPath}/reviewList.do?pageNum=${param.pageNum }'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>