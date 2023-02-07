<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO" scope="session"></jsp:useBean>

<%

String write_idx=(String)session.getAttribute("write_idx");

String savePath=request.getRealPath("/community/userFile/writeImg");

MultipartRequest mr=
new MultipartRequest(request,savePath,2097152,"utf-8");

int result=wdao.underanswer(mr);

String msg=result>0?"답글작성성공!":"답글작성실패!";
%>
<script>
window.alert('<%=msg%>');
location.href='community_freecontent.jsp?idx=<%=write_idx%>';
</script>