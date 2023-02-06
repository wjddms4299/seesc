<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="boodao" class="com.esc.booking.BookingDAO"></jsp:useBean>
<jsp:useBean id="boodto" class="com.esc.booking.BookingDTO"></jsp:useBean>
<%
String user_idx_r=request.getParameter("user_idx");
String booking_idx_r=request.getParameter("booking_idx");
int user_idx=Integer.parseInt(user_idx_r);
int booking_idx=Integer.parseInt(booking_idx_r);
boodto=boodao.one_bookingList(booking_idx);
String cancel_banknum=null;
int result=boodao.bookingDelete(booking_idx, boodto, cancel_banknum);
String msg=result>0?"취소완료!":"취소실패!";
%>
<script>
	window.alert('<%=msg%>');
	location.href='mypage.jsp';
</script>