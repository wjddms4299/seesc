<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO" scope="session"></jsp:useBean>
<%

session.getAttribute("write_idx");
String savePath=request.getRealPath("/community/userFile/writeImg");

MultipartRequest mr=
new MultipartRequest(request,savePath,2097152,"utf-8");

	String idx_s=mr.getParameter("idx");
	int idx=Integer.parseInt(idx_s);
	String pwd=mr.getParameter("pwd");
	String ref_s=mr.getParameter("ref");
	int ref=Integer.parseInt(ref_s);
	String lev_s=mr.getParameter("lev");
	int lev=Integer.parseInt(lev_s);
	String step_s=mr.getParameter("step");
	int step=Integer.parseInt(step_s);
	
	
		int	result=wdao.underDel(idx, pwd);
	
	
	
	
	String msg=result>0?"삭제성공!":"삭제실패!";
%>
<script>
window.alert('<%=msg%>');
location.href='community_freecontent.jsp?idx=<%=session.getAttribute("write_idx")%>';
</script>