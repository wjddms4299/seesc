<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
<body>
<%@include file="/header.jsp" %>
<section>
<article>
<div><span>PWD찾기</span></div>
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
</section>
<%@include file="/footer.jsp" %>
</body>
</html>