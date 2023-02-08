<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.article {
  width: 80%;
  margin: 0 auto;
  text-align: center;
  font-family: sans-serif;
}

.article div {
  margin: 20px 0;
  color: black;
}

.article div span {
  font-size: 2em;
  font-weight: bold;
  display: block;
  margin-bottom: 20px;
  color: white;
}

form {
  display: inline-block;
  background-color: #f2f2f2;
  padding: 20px;
  border-radius: 10px;
}

input[type="text"] {
  width: 80%;
  height: 30px;
  font-size: 1em;
  padding: 5px;
  margin: 10px 0;
  border-radius: 5px;
  border: none;
  box-shadow: 2px 2px 5px #999;
}
input[type="tel"]{
	width: 25%;
  height: 30px;
  font-size: 1em;
  padding: 5px;
  margin: 10px 0;
  border-radius: 5px;
  border: none;
  box-shadow: 2px 2px 5px #999;
}

input[type="submit"] {
  width: 40%;
  height: 40px;
  font-size: 1.2em;
  margin-top: 20px;
  border-radius: 20px;
  border: none;
  background-color: #0077ff;
  color: #fff;
  cursor: pointer;
}
input[type="submit"]:hover{
	background-color: #0057ff;
}

select {
  width: 20%;
  height: 40px;
  font-size: 1em;
  padding: 5px;
  margin: 10px 10px 10px 0;
  border-radius: 5px;
  border: none;
  box-shadow: 2px 2px 5px #999;
}
</style>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
<body>
<%@include file="/header.jsp" %>
<section>
<article class="article">
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
		-&nbsp;<input type="tel" name="tel2" maxlength="4" pattern="[0-9]{4}" onclick="this.value=''">-&nbsp;<input type="tel" name="tel3" maxlength="4" pattern="[0-9]{4}" onclick="this.value=''">
		<input type="submit" value="찾기">
	</div>
</form>
</article>
<br><br><br>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>