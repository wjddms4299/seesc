<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
<style>
fieldset {
	width:500px;
	magin: 0px auto;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<article>
<form name = "community_eventcontent_open" action = "community_eventcontent_openPwd_ok.jsp" method ="post">
<input type = "hidden" name = "write_pwd" value = "<%=request.getParameter("write_pwd")%>">
<input type = "hidden" name = "write_idx" value = "<%=request.getParameter("write_idx")%>">

<fieldset align="center">
<h2>비밀글 입니다.
<br>비밀번호를 입력하세요!</h2>
<div>비밀번호 <input type = "password" name ="inputpwd" required><input type = "submit" value = " 확인 "></div>
</fieldset>
</form>
</article>
</section>


<%@include file="/footer.jsp" %>

</body>
</html>