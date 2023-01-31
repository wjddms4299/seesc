<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
<%@page import = "com.esc.write.*" %>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>
<%
String write_idx_s = request.getParameter("write_idx");
if(write_idx_s==null || write_idx_s.equals("")){
	write_idx_s = "0";
}
int write_idx = Integer.parseInt(write_idx_s);
WriteDTO dto = qnadao.writeQnAContent(write_idx);
if (dto == null) {
	%>
	<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location.href = 'writeQnA_List.jsp';
</script>
	<%
return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<article>

</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>