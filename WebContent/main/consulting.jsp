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
<link href="${conPath }/css/consultingList.css" rel="stylesheet">
<style>
#wrap td {
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
	function click1() {
		alert('신속히 답변 드리겠습니다.');
	};
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<form action="${conPath }/main.do" method="get">
			<h2>온라인상담</h2>
			<hr>
			<br> 어디가 궁금하신가요? 긴급문의를 보내주시면 최대한 신속하게 답변을 드리겠습니다.
			<table>
				<tr>
					<th>질문유형</th>
					<td>
						<select>
							<option>예약문의</option>
							<option>진료문의</option>
							<option>견적문의</option>
							<option>취소환불문의</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>문의제목</th>
					<td>
						<input type="text" size="40">
					</td>
				</tr>
				<tr>
					<th>답변수신방식</th>
					<td>
						<input type="radio" name="email" checked />이메일
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" size="40">
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						예) master@domain.com
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>
						<input type="text" size="40">
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						예) 000-0000-0000
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<input type="text" size="40">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="60"></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일1</th>
					<td>
						<input type="file">
					</td>
				</tr>
				<tr>
					<th>첨부파일2</th>
					<td>
						<input type="file">
					</td>
				</tr>
				<tr>
					<th>개인정보 수집 및 이용 동의</th>
					<td>
					<textarea rows="10" cols="60">■ 개인정보의 수집·이용 목적
서비스 제공 및 계약의 이행, 구매 및 대금결제, 물품배송 또는 청구지 발송, 회원관리 등을 위한 목적

■ 수집하려는 개인정보의 항목
이름, 주소, 연락처, 이메일 등

■ 개인정보의 보유 및 이용 기간
회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외없이 해당정보를 파기합니다. 
					</textarea>
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<input type="radio" name="check" value="y" />동의함
						<input type="radio" name="check" value="n" checked="checked" />동의안함
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<input type="button" value="등록" class="btn" onclick="location='${conPath}/main.do', click1()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>