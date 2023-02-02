<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="com.esc.write.*" %>

<jsp:useBean id="wbao"	class="com.esc.write.WriteDAO" scope="session"></jsp:useBean>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
h2{
   text-align: center;
}
table{
   width:550px;
   border-top:3px double darkblue;
   border-bottom: 3px double darkblue;
   border-spacing: 0px;
   margin:0px auto;
}
table thead th{
   background-color: skyblue;
}
section div{
   text-align: right;
}
section div input{
   margin-right:80px;
}
section img{
   width:80px;
   height:80px;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>이벤트게시판 본문</h2>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>