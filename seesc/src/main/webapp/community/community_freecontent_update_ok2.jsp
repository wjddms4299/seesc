<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
    <%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<%

	String write_idx=(String)session.getAttribute("write_idx");
	String savePath=request.getRealPath("/community/userFile/writeImg");


	MultipartRequest mr=
	new MultipartRequest(request,savePath,2097152,"utf-8");
	
	String idx_s=mr.getParameter("write_idx");
	int idx=Integer.parseInt(idx_s);
	
	String pwd=mr.getParameter("write_pwd");
	
	boolean result=wdao.idxcheck(idx, pwd);
	
	String msg=result==true?"비밀번호를 정확히 입력해주세요.":"조회에 성공하였습니다.";

	
	
if(result){
	%>
	<script>
	window.alert=('<%=msg%>');
	location.href='community_freecontent_update.jsp?idx=<%=write_idx%>';
	</script>
	<% 
}else{
	%>
	<script>
	window.alert=('<%=msg%>')
	location.href='community_freecontent.jsp?idx=<%=write_idx%>';
	</script>
	<%
}
%>
