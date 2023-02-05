<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@page import = "com.oreilly.servlet.*"%>
<jsp:useBean id="idao" class="com.esc.write.ImgDAO" scope = "session"></jsp:useBean>
<%

String savepath=request.getRealPath("/community/img");
MultipartRequest mr=new MultipartRequest(request,savepath,2097152,"UTF-8");


int result = idao.event_rewrite(mr);
if(result>0){
%>

<script>
window.alert('답글 작성완료.');
window.location.href = '/seesc/community/community_eventcontent_list.jsp';
</script>

<%}else{%>
	<script>
	window.alert('답글 작성실패.');
	history.back();
	</script>

<%}%>