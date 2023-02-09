<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body{
background-color: #323232;
}
article{
color: white;
}
input[type="text"] {
  width: 60%;
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
</style>
<body>
<article align="center">
	<form name="nicCheck" action="/seesc/member/nicCheck_ok.jsp">
	<h2>중복확인</h2>
	<label>닉네임:</label>
	<input type="text" name="nicname">
	<input type="submit" value="중복확인">
	</form>
</article>
</body>
</html>