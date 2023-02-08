<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css"/>
<link rel="stylesheet" type="text/css" href="/seesc/css/subLayout.css">
<link rel="stylesheet" type="text/css" href="/seesc/css/button.css">
</head>
<%
	int user_idx=session.getAttribute("user_idx")==null || session.getAttribute("user_idx").equals("")?0:(Integer)session.getAttribute("user_idx");

	int manager=session.getAttribute("manager")==null || session.getAttribute("user_idx").equals("")?0:(Integer)session.getAttribute("manager");
	
%>

<%
if(manager==0 || user_idx==0){
	%>
	<script>
	window.alert('잘못된 접근입니다.');
	location.href='/seesc/index.jsp';
	</script>
	<%
}

%>
<style>
article{

	text-align: center;
}
</style>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<form name="content_del" action="content_del_ok.jsp">
		<%
		
		%>
			<h3>게시물 삭제하기(관리자 모드)</h3>
				<div>
				삭제를 하기 위해서는 게시글 번호를 입력하셔야 합니다<hr>
				
				게시물 번호:<input type="text" name="write_idx">
				<input type="submit" value=삭제하기>
				</div>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>