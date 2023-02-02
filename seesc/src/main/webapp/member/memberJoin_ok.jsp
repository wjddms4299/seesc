<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.text.*"%>
<%@ page import="java.util.*" %>
<%
String user_tel_r1=request.getParameter("user_tel1");
String user_tel_r2=request.getParameter("user_tel2");
String user_tel_r3=request.getParameter("user_tel3");
String user_tel=user_tel_r1+"-"+user_tel_r2+"-"+user_tel_r1;
String year=request.getParameter("year");
String month=request.getParameter("month");
int month_1=Integer.parseInt(month);
if(month_1<10){month="0"+month;}
String day=request.getParameter("day");
int day_1=Integer.parseInt(day);
if(day_1<10){day="0"+day;}
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
