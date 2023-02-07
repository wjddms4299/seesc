<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<%request.setCharacterEncoding("utf-8"); %>
<%

String write_idx=(String)session.getAttribute("write_idx");
String savePath=request.getRealPath("/community/userFile/writeImg");
MultipartRequest mr=
	new MultipartRequest(request,savePath,2097152,"utf-8");



int result=wdao.underWrite(mr);

String msg=result>0?"댓글 등록에 성공하셨습니다":"댓글 등록에 실패하셨습니다.";
%>
<script>
window.alert('<%=msg%>');
location.href='community_freecontent.jsp?idx=<%=write_idx%>';
</script>