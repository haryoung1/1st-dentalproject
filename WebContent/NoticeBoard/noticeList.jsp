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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	text-align: right;
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

#right {
	text-align: right;
	margin: 28px;
	padding: 0.5rem 1rem;
}
</style>
<script>
	$(document).ready(function() {
		$('tr').click(function() {
			var nbno = $(this).children().eq(0).text();
		if (!isNaN(nbno)) {
			location.href = '${conPath }/noticeContent.do?nbno=' + nbno + '&pageNum=${pageNum}';
		}
	});
});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<c:if test="${not empty noticeWriteResult}"> <!--  글쓰기 성공  -->
		<script>
			alert('${noticeWriteResult}')
		</script>
	</c:if>
	<div id="wrap">
		<br>
		<h2>공지사항</h2>
		<hr>
		<br>
		<br>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:if test="${totCnt eq 0 }">
				<tr>
					<td colspan="4">해당 페이지의 글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${totCnt != 0 }">
				<c:forEach items="${noticeList}" var="notice">
					<tr>
						<td>${notice.nbno }</td>
						<td>${notice.nbtitle }</td>
						<td>${notice.aid }</td>
						<td><fmt:formatDate value="${notice.nbrdate }"
								pattern="yyyy-MM-dd(E)" /></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div id="right">
			<c:if test="${not empty admin }">
				<input type="button" class="btn" value="글등록" onclick="location='${conPath}/noticeWriteView.do'">
			</c:if>
		</div>
		<br>
		<div class="paging"> <!-- 페이징처리 -->
			<c:if test="${startPage > BLOCKSIZE }">
				[ <a href="${conPath }/noticeList.do?pageNum=${startPage-1}"> 이전
				</a> ]
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i eq pageNum }">
					<b> [ ${i } ] </b>
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath }/noticeList.do?pageNum=${i}"> ${i } </a> ]
				</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCnt }">
			  [ <a href="${conPath }/noticeList.do?pageNum=${endPage+1}"> 다음
				</a> ]
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>