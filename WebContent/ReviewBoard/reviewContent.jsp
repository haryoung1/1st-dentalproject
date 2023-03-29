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
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 300,
			minHeight : null,
			maxHeight : null,
			lang : 'ko-KR',
			onImageUpload : function(files, editor, welEditable) {
				sendFile(files[0], editor, welEditable);
			}
		});
	});
</script>
<style>
#wrap {
	height: 800px;
	margin: 0 auto;
}

#content_form table tr {
	height: 60px;
}

.btn {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background: white;
	color: black;
	margin: 0;
	padding: 0.5rem 1rem;
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
<script>
	function deleterv() {
		answer = confirm("삭제 하시겠습니까 ?");
		if (answer) {
			location.href = '${conPath}/reviewDelete.do?rvno=${rvContent.rvno}&pageNum=${param.pageNum }';
		} else {
			alert('삭제 취소');
		}
	}
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<div id="content_form">
			<table>
				<tr>
					<th>작성자</th>
					<td>${rvContent.mid }${rvContent.aid }</td>
					<th>조회수</th>
					<td>${rvContent.rvhit }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="5">${rvContent.rvtitle }</td>
				</tr>
<%-- 				<tr>
					<th>조회수</th>
					<td>${rvContent.rvhit }</td>
				</tr> --%>
				<tr>
					<th>내용</th>
					<td colspan="5">
						<textarea id="summernote">${rvContent.rvcontent}</textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="5">
						<c:if test="${not empty rvContent.rvfilename }">
							<a href="${conPath }/ReviewBoardUp/${rvContent.rvfilename}"
								target="_blank">${rvContent.rvfilename}</a>
						</c:if> 
						<c:if test="${empty rvContent.rvfilename }">
						첨부파일 없음
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<c:if test="${member.mid eq rvContent.mid}">
							<button class="btn"
								onclick="location='${conPath}/reviewModifyView.do?rvno=${rvContent.rvno}&pageNum=${param.pageNum }'">수정
							</button>
						</c:if> 
						<c:if test="${member.mid eq rvContent.mid or not empty admin}">
							<button class="btn" onclick="deleterv('${rvContent.rvno}')">삭제</button>
						</c:if>
						<button class="btn"
							onclick="location='${conPath}/reviewList.do?pageNum=${param.pageNum }'">목록
						</button>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>