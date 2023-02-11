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


	String writer=mr.getParameter("write_writer");
	String pwd=mr.getParameter("write_pwd");
	String title=mr.getParameter("write_title");

	if(writer==null || writer.equals("")|| pwd==null || title==null || pwd.equals("") || title.equals("")){
		%>
		<script>
		window.alert('빈칸을 입력해주세요.');
		location.href='community_write.jsp';
		</script>
		<% 
	}else{
		%>
	<script>
	<%
	int result=wdao.insertWrite(mr);
	String msg=result>0?"글 작성을 성공하셨습니다!":"글 작성을 실패하셨습니다!";
	%>
	window.alert('<%=msg%>');
	location.href="community.jsp";
	</script>	
		<% 
			
	}
%>


