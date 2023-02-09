<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO" scope = "session"></jsp:useBean>
<%
int user_idx=(int)session.getAttribute("user_idx");
int result=userdao.joinOut(user_idx);
String msg=result>0?"탈퇴완료":"탈퇴실패";
if(result>0){
	session.invalidate();
}
%>
<script>
	window.alert('<%=msg%>');
	location.href='/seesc/index.jsp';
</script>