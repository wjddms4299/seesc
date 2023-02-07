<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx_s=request.getParameter("idx");
	if(idx_s==null || idx_s==""){
		idx_s="0";
	}
	int idx=Integer.parseInt(idx_s);
	
	
%>
<!DOCTYPE html>
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
		<h3>댓글 삭제하기</h3>
		<form name="writeDel" action="under_del_ok.jsp" method="post" enctype="multipart/form-data">
		<div>
		댓글을 삭제하기 위해서는 비밀번호가 필요합니다.<br>
		<input type="password" name="pwd">
		<input type="hidden" name="idx" value="<%=idx%>">
		<input type="submit" value="삭제하기">
 		</div>
 		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>