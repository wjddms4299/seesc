<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<%
	
	String savePath=request.getRealPath("/img");


	MultipartRequest mr=
	new MultipartRequest(request,savePath,2097152,"utf-8");


	int result=wdao.updateWrite(mr);
	
	String msg=result>0?"수정에 성공하셨습니다":"수정에 실패하셨습니다.";

%>
<script>
	window.alert('<%=msg%>');
	location.href='community.jsp';
</script>
