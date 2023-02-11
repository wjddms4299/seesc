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
.listbutton{
		width: 70px;
        height: 25px;
        border: none;
        border-radius: 10px;
        background-color: #FFA300;
        color: black;
        font-size: 15px;
        font-weight: bold;
      }
.listbutton:hover {
    background-color: #FF870C;

}
b {
	color:red;
}
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
<br>
<h2><b>관리자만 접근가능합니다.</b></h2>
<br>
<div><input type = "button" value="뒤로가기" class="listbutton" onclick="location='community_eventcontent_list.jsp'"></div>
<br>
</fieldset>

</form>
</article>
</section>


<%@include file="/footer.jsp" %>

</body>
</html>