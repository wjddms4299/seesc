<%@page import="javax.sound.sampled.AudioFormat.Encoding"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<%


String savePath=request.getRealPath("/community/userFile/writeImg");
MultipartRequest mr=
	new MultipartRequest(request,savePath,2097152,"utf-8");
%>

<%
	int result=wdao.insertWrite(mr);
	String msg=result>0?"글 작성을 성공하셨습니다!":"글 작성을 실패하셨습니다!";

%>

<script>
window.alert('<%=msg%>');
location.href="community.jsp";
</script>
