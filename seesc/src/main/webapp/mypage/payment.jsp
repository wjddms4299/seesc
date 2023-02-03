<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="com.esc.booking.*" %>
    <jsp:useBean id="boodao" class="com.esc.booking.BookingDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
	<link rel = "stylesheet" type = "text/css" href = "/seesc/css/subLayout.css">
<body>
<%@include file="/header.jsp" %>
<section>
<h1>마이페이지</h1>
<article>
	<a href="mypage.jsp"><button class="tbutton"><span>예약내역</span></button></a>
	<a href="payment.jsp"><button class="rbutton"><span>결제내역</span></button></a>
	<a href="myinfo.jsp"><button class="tbutton"><span>내정보</span></button></a>
	<a href="mycoupon.jsp"><button class="tbutton"><span>쿠폰함</span></button></a>
	<a href="cafeorderinfo.jsp"><button class="tbutton"><span>카페주문내역</span></button></a>
	<table>
		<tr>
			<th>No</th>
			<th>예약날짜</th>
			<th>결제금액</th>
			<th>결제수단</th>
			<th>결제상태</th>
		</tr>
		<%
	int user_idx=(int)session.getAttribute("user_idx");
	ArrayList<BookingDTO> arr=boodao.myBooking(user_idx);
	if(arr==null||arr.size()==0){
		%>
		<tr>
			<td colspan="5">예약정보가 없습니다.</td>
		</tr>
		<%
	}else{
		for(int i=0;i<arr.size();i++){
			%>
			<tr>
				<td><%=arr.get(i).getBooking_idx() %></td>
				<td><%=arr.get(i).getBooking_time() %></td>
				<td><%=arr.get(i).getBooking_money() %></td>
				<td><%String pay= arr.get(i).getBooking_pay()>0?"무통장":"현장결제";%><%=pay %></td>
				<td><%String pay_ok=arr.get(i).getBooking_pay_ok()>0?"결제미완료":"결제완료"; %><%=pay_ok %></td>
			</tr>
			<%
		}
	}
	%>
		<tr>
			<td></td>
		</tr>
	</table>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>
