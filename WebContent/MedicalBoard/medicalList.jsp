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
#wrap .left {
	text-align: left;
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('tr').click(function() {
			var mrno = $(this).children().eq(0).text();
		if (!isNaN(mrno)) {
			location.href = '${conPath }/medicalContent.do?mrno=' + mrno + '&pageNum=${pageNum}';
		}
	});
});
</script>
</head>
<body>
	<c:if test="${not empty medicalWriteResult}"> <!--  글쓰기 성공 -->
		<script>
			alert('${medicalWriteResult}')
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<br>
		<h2>진료예약&nbsp;게시판</h2>
		<hr>
		<br>
		<br>
		<table>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
			<c:if test="${totCnt == 0 }">
				<tr>
					<td colspan="5">해당 페이지의 글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${totCnt != 0 }">
				<c:forEach items="${medicalList }" var="medical">
					<tr>
						<td>${medical.mrno }</td>
						<td class="left"><c:forEach var="i" begin="1" end="${medical.mrindent }">
								<c:if test="${i == medical.mrindent}">└─</c:if>
								<c:if test="${i != medical.mrindent }"> &nbsp; &nbsp; </c:if>
							</c:forEach> ${medical.mrtitle }</td>
						<td>${medical.mid }${medical.aid }</td>
						<td>
							<fmt:formatDate value="${medical.mrrdate }" pattern="yyyy-MM-dd(E)" />
						</td>
						<td>${medical.mrhit }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<br>
		<div id="right"> <!-- 글등록 버튼 -->
			<c:if test="${not empty member }">
				<input type="button" class="btn" value="글쓰기"
					onclick="location='${conPath}/medicalWriteView.do'">
			</c:if>
			<c:if test="${empty member and empty admin }">
				<input type="button" class="btn" value="글쓰기"
					onclick="location='${conPath}/medicalWriteView.do'">
			</c:if>
		</div>
		<div class="paging"> <!-- 페이징처리 -->
			<c:if test="${startPage > BLOCKSIZE }">
				[ <a href="${conPath }/medicalList.do?pageNum=${startPage-1}">
					이전 </a> ]
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
					<b> [ ${i } ] </b>
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath }/medicalList.do?pageNum=${i}"> ${i } </a> ]
				</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCnt }">
			  [ <a href="${conPath }/medicalList.do?pageNum=${endPage+1}"> 다음
				</a> ]
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>