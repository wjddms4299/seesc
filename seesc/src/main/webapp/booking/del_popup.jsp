<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="thdao" class="com.esc.thema.ThemaDAO" scope="session"></jsp:useBean>
<%
String thema_idx_s=request.getParameter("thema_idx");
int thema_idx=Integer.parseInt(thema_idx_s);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="themaDelete" action="bookingStep01_del.jsp">
<input type="hidden" name="thema_idx" value="<%=thema_idx%>">
	<h2 align="center">테마 삭제 확인</h2><br>
	<ul>
		<li><b>[<%=thdao.themaName(thema_idx)%>]</b> 테마를 삭제합니다.</li>
		<br>
		<li>테마 삭제 이후에는 다시 복구할 수 없습니다.</li>
	</ul>
	<br>
	<br>
	<div align="center">정말 삭제하시겠습니까? &nbsp; <input type="submit" value="확인"></div>
</form>
</body>
</html>