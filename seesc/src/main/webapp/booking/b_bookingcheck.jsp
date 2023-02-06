<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
article{
text-align: center;}
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
		<br><br>
			<h2>예약 정보 입력</h2>
		
			<br>
				<div>
				<span>예약취소를 위해서는 예약시 입력한 비밀번호가 필요합니다.</span> <br>
				<span>비밀번호를 잊으셨다면 아래 번호로 연락 바랍니다.</span><br>
				<span>전화 02-1234-1234</span>
				</div>
				<br>
				<br>
			<form name="b_bookingCheck" action = "b_bookingCheck_ok.jsp" method = "post">
				<ul>
					<li><label>예약자</label><input type="text" name="booking_name"
						required placeholder="예약자명"></li>
					<li><label>연락처</label>
					<select name = "phone1">
					<option value = "010">010
					<option value = "016">016
					<option value = "017">017
					<option value = "018">018
					<option value = "019">019
					</select>
					<input type="number" name="phone2" min ="0" max="9999" required>
					<input type="number" name="phone3" min ="0" max="9999" required></li>
					
					<li><label>비밀번호</label><input type="text" name="booking_pwd"
						required placeholder="예약시 입력한 비밀번호"></li>
				</ul>
				<span><input type="submit" value="조회"></span>
			</form>

		</article>
			<br><br>
	</section>
	<%@include file="/footer.jsp"%>

</body>
</html>