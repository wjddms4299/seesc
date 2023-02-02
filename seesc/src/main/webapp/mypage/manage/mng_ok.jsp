<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.esc.userinfo.*" %>
    <jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO"></jsp:useBean>
<%
String idx_r=request.getParameter("idx");
int idx=Integer.parseInt(idx_r);
String manager_r=request.getParameter("manager");
int manager=Integer.parseInt(manager_r);
if(manager<1){
	manager=1;
}else{
	manager=0;
}
int result=userdao.managepower(manager, idx);
String msg=result>0?"권한수정완료!":"권한수정실패!";

%>
<script>
window.alert('<%=msg%>');
location.href='/seesc/mypage/manage/mng.jsp';
</script>