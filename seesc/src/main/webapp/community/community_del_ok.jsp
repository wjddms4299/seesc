<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<%
	String pwd=request.getParameter("pwd");
	String idx_s=request.getParameter("idx");
	int idx=Integer.parseInt(idx_s);

	int result=wdao.delete(idx, pwd);
	
	String msg=result>0?"삭제에 성공하였습니다.":"삭제에 실패하였습니다.";
%>
<script>
window.alert('<%=msg%>');
location.href='community.jsp'
</script>




