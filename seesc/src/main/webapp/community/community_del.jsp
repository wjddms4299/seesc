<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String idx=request.getParameter("idx");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h3><%=idx %>번 게시물 삭제하기</h3>
		<form name="del" action="community_del_ok.jsp" method="post">
		<div>
		삭제를 하기 위해서는 게시글을 작성하실 때에 <br> 입력하신 비밀번호를 입력하셔야 합니다. <br>
		비밀번호:<input type="password" name="pwd"> 
		<input type="hidden" name="idx" value="<%=idx %>">
		</div>
		<div>
		<input type="submit" value="삭제하기">
		<input type="button" value="취소하기" onclick="location.href='community.jsp'">
		</div>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>