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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(function() {
		$('#mid').keyup(
				function() {
					var mid = $(this).val();
					if (mid.length < 2) {
						$('#midConfirmResult').html(
								'<p style=color:blue;>아이디는 2글자 이상 입니다');
					} else {
						$.ajax({
							url : '${conPath}/midConfirm.do',
							type : 'get',
							data : 'mid=' + mid,
							dataType : 'html',
							success : function(data) {
								$('#midConfirmResult').html(data);
							},
						});
					}
				}); // key up event
		$('#mpw, #mpwChk').keyup(function() {
			var mpw = $('#mpw').val();
			var mpwChk = $('#mpwChk').val();
			if (mpw == mpwChk) {
				$('#pwChkResult').html('<p style=color:blue;>비밀번호가 일치 합니다');
			} else {
				$('#pwChkResult').html('<b>비밀번호가 일치 하지 않습니다</b>');
			}
		}); // key up event (비번 일치 확인용)
		var patternMemail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/;
		$('input[name="memail"]').keyup(function() {
			let memail = $(this).val();
			if (!memail.match(patternMemail)) {
				$('#mailConfirmResult').html('<b>메일 형식을 지켜 주세요</b>');
			} else {
				$.ajax({
					url : '${conPath}/memailConfirm.do',
					type : 'get',
					data : 'memail=' + memail,
					dataType : 'html',
					success : function(data) {
						$('#mailConfirmResult').html(data);
					},
				});
			}
		});
		// "사용 가능한 ID 입니다" (midConfirmResult), "비밀번호 일치(#mpwChkResult)" 가 출력되었을 경우만 submit
		$('form').submit(function() {
			var midConfirmResult = $('#midConfirmResult').text().trim();
			var pwChkResult = $('#pwChkResult').text().trim();
			var mailConfirmResult = $('#mailConfirmResult').text().trim();
			if (midConfirmResult != '사용가능한 ID 입니다') {
				alert('사용 가능한 id인지 확인하세요')
				return false; // submit 제한
			} else if (pwChkResult != '비밀번호가 일치 합니다') {
				alert('비밀번호를 확인하세요');
				$('input[name="mpw"]').focus();
				return false;
			} else if (mailConfirmResult != '사용 가능한 메일주소 입니다.') {
				alert('메일을 확인하세요');
				$('#memail').focus();
				return false;
			}

		});
	});
</script>
<script>
	$(function() {
		$("#datepicker").datepicker(
				{
					dateFormat : "yy-mm-dd",
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
					changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
					showMonthAfterYear : true,
					showOtherMonths : true, // 현재 달이 아닌 달의 날짜도 회색으로 표시
					yearSuffix : '년',
					// minDate: '-100y',	 // 현재날짜로부터 100년이전까지 년을 표시한다.
					minDate : new Date(1950, 1 - 1, 1), // 1950년 1월 1일을 최소날짜로 세팅
					maxDate : 'y', // 현재 날짜 이전만 선택가능
					yearRange : 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 
				});
	});
</script>
<style>
.btn {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background-color: #4A5164;
	color: white;
	margin: 0;
	padding: 0.5rem 1rem;
	font-weight: 350;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	border: 1px solid #444444;
	display: inline-block;
	width: 100px;
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px
		rgba(0, 0, 0, 0.06);
	cursor: pointer;
	transition: 0.5s;
}

.btn:hover {
	background-color: black;
}

.p1 {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<form action="${conPath }/join.do" method="post"
			enctype="multipart/form-data">
			<h3>회원가입</h3>
			<hr>
			<br>
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mid" required="required" id="mid">
						<div id="midConfirmResult">&nbsp; &nbsp; &nbsp;</div></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="mpw" required="required"
						id="mpw"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="pwChk" required="required"
						id="mpwChk">
						<div id="pwChkResult">&nbsp; &nbsp; &nbsp;</div></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mname" required="required">
					</td>
				</tr>
				<tr>
					<th>메일</th>
					<td><input type="email" name="memail" id="memail">
						<div id="mailConfirmResult">&nbsp; &nbsp; &nbsp;</div></td>
				</tr>
				<tr>
					<th>사진</th>
					<td><input type="file" name="mphoto"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="mbirth" id="datepicker"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="maddress"></td>
				</tr>
			</table>
			<br>
			<p class="p1">
				<button class="btn">회원등록</button>
			</p>
		</form>
	</div>
	<br>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>