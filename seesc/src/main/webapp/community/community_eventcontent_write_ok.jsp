<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import = "com.oreilly.servlet.*"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="imgdao" class="com.esc.write.ImgDAO" scope = "session"></jsp:useBean>
<%
String savepath = request.getRealPath("/community/img");
MultipartRequest mr = 
	new MultipartRequest(request,savepath,2097152,"UTF-8");
int result = imgdao.eventwriteupload(mr);
String msg = result>0?"글등록 성공": "글등록 실패";
%>

<script>
window.alert('<%=msg%>');
window.location.href = '/seesc/community/community_eventcontent_list.jsp';
</script>