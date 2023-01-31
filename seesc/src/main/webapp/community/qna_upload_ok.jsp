<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import = "com.oreilly.servlet.*"%>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope = "session"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");

String savepath = request.getRealPath("/community/userFile");
MultipartRequest mr = new MultipartRequest(request,savepath,2097152,"UTF-8");


int result = qnadao.writeQnAupload(mr);
String msg = result>0?"글쓰기 성공~": "실패 ㅠㅠㅠ";
%>

<script>
window.alert('<%=msg%>');
window.location.href = '/seesc/community/qna_list.jsp';
</script>