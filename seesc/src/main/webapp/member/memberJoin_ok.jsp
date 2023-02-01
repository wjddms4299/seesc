<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.text.*"%>
<%@ page import="java.util.*" %>
<%
String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
String user_birth=year+month+day;
%>
<jsp:useBean id="udto" class="com.esc.userinfo.UserinfoDTO"></jsp:useBean>
<jsp:setProperty property="*" name="udto" />
<jsp:useBean id="udao" class="com.esc.userinfo.UserinfoDAO"></jsp:useBean>
<%
int result=udao.memberJoin(udto,user_birth);
String msg=result>0?"회원가입완료!":"회원가입실패!";
%>

<script>
window.alert('<%=msg%>');
location.href=('/seesc/index.jsp')
</script>
