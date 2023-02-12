<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx=request.getParameter("idx");
	if(idx==null || idx.equals("")){
		idx="0";
	}
	

	String ref_s=request.getParameter("ref");
	int ref=Integer.parseInt(ref_s);
	String lev_s=request.getParameter("lev");
	int lev=Integer.parseInt(lev_s);
	String step_s=request.getParameter("step");
	int step=Integer.parseInt(step_s);
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
	<form name="underupdate" action="under_update2.jsp">
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