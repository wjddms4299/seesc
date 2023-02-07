<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="/seesc/css/button.css">

<style>
ul,li{
	list-style: none;
}
article{
text-align: center;
}

#inputlist{
text-align:center;
}
ul{
text-align : left;}
.button {

}
</style>
</head>
<body>
<div class="body">
	<%@include file="/header.jsp"%>
	<section>
		<article>
		<div class = "back">
		<br><br>
			<h1 class ="h1">예약 확인</h1>
			<br>
			  <hr width="130px">
		
			<br><br>
				<p>예약확인 위해 예약시 입력한 비밀번호가 필요합니다.</p>
				<p>비밀번호를 잊으셨다면 아래 번호로 연락 바랍니다.</p><br>
				<span style ="font-weight : bold;color :#FF5675;">전화 02-1234-1234</span>
				</div>
				<br>
				<br>
				<div id="inputlist">

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
				<span class= "cbutton"><input type="submit" value="예약확인하기" id = "button"></span>
			</form>
	
		</div>
		</article>
			<br><br>
	</section>
	<%@include file="/footer.jsp"%>
</div>
</body>
</html>