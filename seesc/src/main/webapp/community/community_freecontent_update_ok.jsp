<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<%
	String write_idx=(String)session.getAttribute("write_idx");
	String savePath=request.getRealPath("/community/userFile/writeImg");


	MultipartRequest mr=
	new MultipartRequest(request,savePath,2097152,"utf-8");

	String title=mr.getParameter("title");
	String content=mr.getParameter("content");
	
	if(title==null || title.equals("") || content==null || content.equals("")){
		%>
		<script>
	window.alert('빈칸을 입력해주세요');
	location.href='community_freecontent_update.jsp'
	</script>
		<% 
	}else{
		int result=wdao.updateWrite(mr);
		String msg=result>0?"수정에 성공하셨습니다":"수정에 실패하셨습니다.";
		%>
		<script>
		window.alert('<%=msg%>')
		location.href='community_freecontent.jsp?idx=<%=write_idx%>'
		</script>
		<%
	}
	
	
	

%>
