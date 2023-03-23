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
<link href="${conPath }/css/noticeList.css" rel="stylesheet">
<style>
 
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	$('tr').click(function(){
		var mrno = $(this).children().eq(0).text();
	if(!isNaN(mrno)){
		location.href = '${conPath }/medicalContent.do?mrno='+mrno+'&pageNum=${pageNum}';
	}
	});
});
</script>  
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<table>
			<tr>
				<td><c:if test="${not empty member }">
						<a href="${conPath }/boardWriteView.do">글쓰기</a>
					</c:if> <c:if test="${empty member and empty admin }">
						<a href="${conPath }/loginView.do?next=boardWriteView.do">
							로그인을 하셔야 글쓰기가 가능 합니다. </a>
					</c:if></td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>글제목</th>
				<th>조회수</th>
				<th>날짜</th>
				<th>IP</th>
			</tr>
			<c:if test="${totCnt == 0 }">
				<tr>
					<td colspan="6">해당 페이지의 글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${totCnt != 0 }">
				<c:forEach items="${medicalList }" var="medical">
					<tr>
						<td>${medical.mrno }</td>
						<td>${medical.mname }${medical.aid }</td>
						<td class="left">
							<c:forEach var="i" begin="1" end="${medical.mrindent }">
								<c:if test="${i == medical.mrindent}">└─</c:if>
								<c:if test="${i != medical.mrindent }"> &nbsp; &nbsp; </c:if>
							</c:forEach>
							${medical.mrtitle }
						</td>
						<td>${medical.mrhit }</td>
						<td><fmt:formatDate value="${medical.mrrdate }" pattern="yy년MM월dd일(E)" /></td>
						<td>${medical.mrip }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<!-- 페이징처리 -->
		<div class="paging">
			<c:if test="${startPage > BLOCKSIZE }">
				[ <a href="${conPath }/medicalList.do?pageNum=${startPage-1}"> 이전
				</a> ]
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
			  [ <a href="${conPath }/medicalList.do?pageNum=${endPage+1}"> 다음 </a> ]
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>