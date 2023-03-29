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
<link href="${conPath}/css/member/modify.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>
#content_form {
	height: 400px;
	margin: 20px auto 80px;
}
</style>
</head>
<script>
	$(function() {
		// macth함수 사용
		var patternMemail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/;
		$('input[name="memail"]').keyup(function() {
			let memail = $(this).val();
			if ((!memail) || (memail == '${member.memail}')) {
				$('#memailConfirmResult').html(' &nbsp; ');
			} else if (patternMemail.test(memail)) {
				$.ajax({
					url : '${conPath}/memailConfirm.do',
					type : 'get',
					data : 'memail=' + memail,
					dataType : 'html',
					success : function(data) {
						$('#memailConfirmResult').html(data);
					},
				});
			} else if (!patternMemail.test(memail)) {
				$('#memailConfirmResult').html('<b>메일 형식을 지켜 주세요</b>');
			}
		});

		$('form').submit(
				function() {
					// 현비밀번호확인과 사용불가한 중복된 메일일 경우 submit 제한
					var oldMpw = $('input[name="oldMpw"]').val();
					var memailConfirmResult = $('#memailConfirmResult').text()
							.trim();
					if (oldMpw != '${member.mpw}') {
						alert('현비밀번호를 확인하세요');
						$('input[name="oldMpw"]').focus();
						return false; // submit 제한
					} else if ((memailConfirmResult == '메일 형식을 지켜 주세요')
							|| (memailConfirmResult == '사용 불가한 중복된 메일')) {
						alert('메일을 확인하세요');
						$('input[name="memail"]').focus();
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
					yearSuffix : '년',
					showOtherMonths : true, // 현재 달이 아닌 달의 날짜도 회색으로 표시
					//minDate: '-100y',	 // 현재날짜로부터 100년이전까지 년을 표시한다.
					minDate : new Date(1950, 1 - 1, 1), // 1950년 1월1일을 최소 날짜로 세팅
					maxDate : 'y', // 현재 날짜 이전만 선택 가능
					yearRange : 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 
				});
	});
</script>
<style>
#content_form {
	height: 470px;
	margin: 30px auto 0px;
}

#content_form table tr {
	height: 10px;
}

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

.p1 {
	text-align: center;
}
</style>
<body>
	<c:if test="${empty member }">
		<script>
			location.href = '${conPath}/loginView.do?next=modifyView.do';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<div id="content_form">
			<form action="${conPath }/modify.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="dbMpw" value="${member.mpw }"> <input
					type="hidden" name="dbMphoto" value="${member.mphoto }">
				<table>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="mid" value="${member.mid }"
							readonly="readonly" size="3"></td>
						<td rowspan="4"><img
							src="${conPath }/memberPhotoUp/${member.mphoto}"
							alt="${member.mname }사진"></td>
					</tr>
					<tr>
						<th>현비밀번호</th>
						<td><input type="password" name="oldMpw" required="required"
							size="3"></td>
					</tr>
					<tr>
						<th>새비밀번호</th>
						<td><input type="password" name="mpw" size="3"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="mname" value="${member.mname }"
							required="required" size="3"></td>
					</tr>
					<tr>
						<th>메일</th>
						<td colspan="2"><input type="email" name="memail"
							value="${member.memail }">
							<div id="memailConfirmResult">&nbsp; &nbsp; &nbsp;</div></td>
					</tr>
					<tr>
						<th>사진</th>
						<td colspan="2"><input type="file" name="mphoto"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td colspan="2"><input type="date" name="mbirth"
							id="datepicker" value="${member.mbirth }"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="2"><input type="text" name="maddress"
							value="${member.maddress }"></td>
					</tr>
				</table>
				<br>
				<p class="p1">
					<button class="btn">정보수정</button>
					<button class="btn" onclick="history.back()">이전</button>
					<button class="btn"
						onclick="location.href='${conPath}/withdrawalView.do'">회원탈퇴</button>
				</p>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>