<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
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
<body>
<%@include file="/header.jsp" %>
<section>
<article class="article">
<br><br>
<h1 class ="h1">PWD 찾기</h1>
         <br>
           <hr width="130px">
           <br>
<form action="findPwd_ok.jsp">
	<div>
		<h2>이름</h2>
		<input type="text" name="user_name"> 
	</div>
	<div>
		<h2>ID</h2>
		<input type="text" name="user_id"> 
	</div>
	<div>
		<h2>생년월일</h2>
			<div>
			<select name="year">
			<option value="">--선택--</option>
			<%
			for(int i=1950;i<=2020;i++){
				%>
			<option value="<%=i%>"><%=i %></option>
				<%
			}
			%>
			</select>년 
			<select name="month">
			<option value="">--선택--</option>
			<%
			for(int i=1;i<=12;i++){
		
	
				%>
			<option value="<%=i%>"><%=i %></option>
				<%
			}
			%>
			</select>월
			<select name="day">
			<option value="">--선택--</option>
			<%
			for(int i=1;i<=31;i++){
				%>
			<option value="<%=i%>"><%=i %></option>
				<%
			}
			%>
			</select>일
			</div>
	</div>
	<div>
		<input type="submit" value="찾기">
	</div>
</form>
</article>
<br><br><br>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>