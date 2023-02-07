<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="com.oreilly.servlet.*"%>
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="wdto" class="com.esc.write.WriteDTO"></jsp:useBean>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO" ></jsp:useBean>
<jsp:setProperty property="*" name="wdto"/>

<%

String savePath=request.getRealPath("/seesc/community/writeImg");
MultipartRequest mr=
	new MultipartRequest(request,savePath,2097152,"utf-8");


	int result=wdao.insertWrite(mr);

	String msg=result>0?"글 작성을 성공하셨습니다!":"글 작성을 실패하셨습니다1";

%>

<script>
window.alert('<%=msg%>');
location.href="freenoticeboard.jsp";
</script>
