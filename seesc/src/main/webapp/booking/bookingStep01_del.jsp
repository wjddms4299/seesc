<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.esc.booking.*" %>
<jsp:useBean id="thdao" class="com.esc.thema.ThemaDAO" scope="session"></jsp:useBean>
<%
String thema_idx_s=request.getParameter("thema_idx");
int thema_idx=Integer.parseInt(thema_idx_s);

int result=thdao.themaDelete(thema_idx);

if (result==1) {%>
	<script>
	window.alert('테마 삭제를 완료하였습니다.');
	window.opener.location.href='bookingStep01.jsp';
	window.self.close();
	
	</script>
<%}else {%>
	<script>
	window.alert('테마 삭제에 실패하였습니다.담당 개발자에게 문의바랍니다.');
	window.opener.location.href='bookingStep01.jsp';
	window.self.close();
	</script>
<%}%>