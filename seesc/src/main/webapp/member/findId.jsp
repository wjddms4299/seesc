<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
span{
	font-size: 25px;
    font-weight: bold;
    margin-bottom: 20px;
    text-align: center;
}
form {
    width: 300px;
    background-color: #f2f2f2;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 2px 2px 10px #999;
    display: flex;
    flex-direction: column;
    align-items: center;
}
h2 {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 20px;
    text-align: left;
}
select,input[type="text"],
input[type="number"] {
    width: 70px;
    padding: 10px;
    margin-bottom: 20px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 14px;
}
input[type="submit"] {
    width: 170px;
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    font-size: 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 20px;
    text-align: center;
}

input[type="submit"]:hover {
    background-color: #3e8e41;
}
</style>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
<body>
<%@include file="/header.jsp" %>
<section>
<article>
<div><span>ID찾기</span></div>
<form action="findId_ok.jsp">
	<div>
		<h2>이름</h2>
		<input type="text" name="user_name"> 
	</div>
	<div>
		<h2>폰번호</h2>
		<select name="tel1">
			<option value = "010">010
			<option value = "016">016
			<option value = "017">017
			<option value = "018">018
			<option value = "019">019
		</select>
		-<input type="tel" name="tel2" maxlength="4" pattern="[0-9]{4}" onclick="this.value=''">-<input type="tel" name="tel3" maxlength="4" pattern="[0-9]{4}" onclick="this.value=''">
		<input type="submit" value="찾기">
	</div>
</form>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>