<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<%
	String idx_s=request.getParameter("idx");
	int idx=Integer.parseInt(idx_s);
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	int result=wdao.updateWrite(idx, title, content);
	
	String msg=result>0?"수정에 성공하셨습니다":"수정에 실패하셨습니다.";

%>
<script>
	window.alert('<%=msg%>');
	location.href='community.jsp';
</script>
