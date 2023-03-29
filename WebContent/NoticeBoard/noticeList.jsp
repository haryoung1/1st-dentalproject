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
#right {
	text-align: right;
	margin : 20px;
}

.btn {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color:#ffffff;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.btn:hover {
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color:#f6f6f6;
}
.btn:active {
	position:relative;
	top:1px;
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
						<td>
							<fmt:formatDate value="${notice.nbrdate }" pattern="yyyy-MM-dd(E)" />
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<br>
		<div class="paging">
			<!-- 페이징처리 -->
			<c:if test="${startPage > BLOCKSIZE }">
				[ <a href="${conPath }/noticeList.do?pageNum=${startPage-1}"> 이전 </a> ]
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
			  [ <a href="${conPath }/noticeList.do?pageNum=${endPage+1}"> 다음 </a> ]
			</c:if>
		</div>
		<div id="right">
		<c:if test="${not empty admin }">
				<button class="btn" onclick="location='${conPath}/noticeWriteView.do'">글등록</button>
		</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>