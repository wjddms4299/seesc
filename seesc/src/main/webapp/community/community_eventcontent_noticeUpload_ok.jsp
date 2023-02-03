<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="idao" class="com.esc.write.ImgDAO" scope="session"></jsp:useBean>
<%
String savepath=request.getRealPath("/community/img");
MultipartRequest mr=new MultipartRequest(request,savepath,2097152,"UTF-8");

int result=idao.event_noticeUpload(mr);
String msg=result>0?"등록되었습니다.":"등록 실패.";
%>
<script>
window.alert('<%=msg%>');
location.href='/seesc/community/community_eventcontent_list.jsp';
</script>
