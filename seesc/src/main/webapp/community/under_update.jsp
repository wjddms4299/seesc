<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx=request.getParameter("idx");
	if(idx==null || idx.equals("")){
		idx="0";
	}
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
	<form name="under" action="under_update_ok.jsp" method="post" enctype="multipart/form-data">
		댓글을 수정하기 위해서는 비밀번호를 입력해주세요<br>
		<input type="password" name="write_pwd">
		<input type="submit" value="수정하기">
		<input type="hidden" value=<%=idx %> name="write_idx">
	</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>