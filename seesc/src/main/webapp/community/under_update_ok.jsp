<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.esc.write.*" %>
<%
	request.setCharacterEncoding("utf-8");

%>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO" scope="session"></jsp:useBean>
<%
	
	
	
	String savePath=request.getRealPath("/community/userFile/writeImg");
	MultipartRequest mr=
			new MultipartRequest(request,savePath,2097152,"utf-8");

	WriteDTO result=wdao.underselect(mr);
	
%>
<script>
<%
if(result==null){
%>
	window.alert('조회에 실패하셨습니다!');
	location.href='community_freecontent.jsp';
<%
}else{
%>	
	window.alert('조회에 성공하셨습니다!');
	location.href='community_freecontent.jsp';
<%
}
%>
</script>