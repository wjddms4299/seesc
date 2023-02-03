<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.util.*" %>
     <%@page import="com.esc.booking.*" %>
    <jsp:useBean id="boodao" class="com.esc.booking.BookingDAO" scope="session"></jsp:useBean>
<%
String booking_idx_r=request.getParameter("booking_idx");
int booking_idx=Integer.parseInt(booking_idx_r);
int result=boodao.payUpdate(booking_idx);
String msg=result>0?"환불완료!":"환불실패!";
%>
<script>
window.alert('<%=msg%>');
location.href='cancelmng.jsp';
</script>