<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.write.*" %>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
%>
<% 
String savePath=request.getRealPath("/community/userFile/writeImg");

String write_idx=(String)session.getAttribute("write_idx");


MultipartRequest mr=
new MultipartRequest(request,savePath,2097152,"utf-8");

String pwd=mr.getParameter("write_pwd");
String idx_s=mr.getParameter("write_idx");
int idx=Integer.parseInt(idx_s);

boolean result=wdao.underright(idx, pwd);


if(result){
	%>
		<script>
	window.alert=('조회에 성공하였습니다.')
	location.href='under_open2.jsp?idx=<%=idx%>'
	</script>

	<%
}else{
	%>
	<script>
	window.alert=('비밀번호가 틀렸습니다.');
	location.href='community_freecontent.jsp?idx=<%=write_idx%>'
	</script>	
	 <%
}
%>
