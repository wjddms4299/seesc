<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">

<style>
ul,li{
	list-style: none;
}
article{
text-align: center;
}

input[type="text"]{
   width: 270px;
    padding: 10px;
    margin-bottom: 15px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 14px;
}
input[type="password"]{
   width: 240px;
    padding: 10px;
    margin-bottom: 15px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 14px;
}
input[type="tel"],select{
    width: 80px;
    padding: 10px;
    margin-bottom: 15px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 14px;
}
 input[type="submit"] {
        width: 100%;
        height: 40px;
        border: none;
        border-radius: 5px;
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
        margin-top: 20px;
  }
input[type="submit"]:hover {
 background-color: #3e8e41;
}
th{
font-size: 18px;}

</style>
</head>
<body>
<div>
	<%@include file="/header.jsp"%>
	<section>
		<article>

		<br><br>
			<h1 class ="h1">예약 확인</h1>
			<br>
			  <hr width="130px">
		
			<br><br><br>
			<div style = "font-size:18px;">
				예약 확인을 위해 <label style ="color:red;">예약시 입력한 비밀번호</label>가 필요합니다.<br>
				<label style ="color:red;">비밀번호를 잊으셨다면 </label>아래 번호로 연락 바랍니다.<br><br>
			전화 	02-1234-1234</label>
				</div><br>
				<hr width ="400px;"><br>
				<br>
				

				<form name="b_bookingCheck" action = "b_bookingCheck_ok.jsp" method = "post">
					<table >
					<tr>
			
					<th> 예약자  </th><td><input type="text" name="booking_name"
						required placeholder="예약자명"></td>
					</tr>
					<tr>
					<th> 연락처 </th>
					<td>
					<select name = "phone1">
					<option value = "010">010
					<option value = "016">016
					<option value = "017">017
					<option value = "018">018
					<option value = "019">019
					</select>
					<input type="tel" name="phone2" pattern="[0-9]{4}" onclick="this.value=''"required>
					<input type="tel" name="phone3" pattern="[0-9]{4}" onclick="this.value=''"required></li>
					</td></tr>
					<tr>
					<th> 비밀번호 </th>
					<td><input type="text" name="booking_pwd"
						required placeholder="예약시 입력한 비밀번호"></td>
						</tr>
						<tr>
						<td colspan = "2" align = "center"><input type="submit" value="예약 확인하기"></td>
						</tr>
					</table>
				<br><br>
			
			</form>
		</article>
			<br><br><br><br>
	</section>
	<%@include file="/footer.jsp"%>
</div>
</body>
</html>