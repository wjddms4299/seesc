<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import = "com.oreilly.servlet.*"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope = "session"></jsp:useBean>
<%
String savepath = request.getRealPath("/community/userFile");
MultipartRequest mr = new MultipartRequest(request,savepath,2097152,"UTF-8");


int result = qnadao.writeQnAupload(mr);

if(result>0){
%>

<script>
window.alert('글작성을 완료하였습니다.');
window.location.href = '/seesc/community/qna_list.jsp';
</script>

<%}else{%>
	<script>
	window.alert('글을 작성에 실패하였습니다.');
	history.back();
	</script>

<%}%>