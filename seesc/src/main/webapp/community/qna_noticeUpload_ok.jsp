<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import = "com.oreilly.servlet.*"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope = "session"></jsp:useBean>
<%
String savepath = request.getRealPath("/community/userFile");
MultipartRequest mr = new MultipartRequest(request,savepath,2097152,"UTF-8");


int result = qnadao.qna_noticeUpload(mr);
String msg = result>0?"공지글이 등록되었습니다.": "공지글 등록에 실패하였습니다.";
%>

<script>
window.alert('<%=msg%>');
window.location.href = '/seesc/community/qna_list.jsp';
</script>