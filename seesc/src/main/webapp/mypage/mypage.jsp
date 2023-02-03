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
<%
    if(sid==null){
    	%>
    	<script>
    	window.alert('로그인 후 이용가능하십니다.');
    	location.href='/seesc/index.jsp';
    	</script>
    	<%
    	return;
    }
	int manager=(int)session.getAttribute("manager");
	if(manager>0){
		%>
		<script>
		location.href='/seesc/mypage/manage/managepage.jsp';
		</script>
		<%
	}
    %>
<section>
<h1>마이페이지</h1>
<article>
	<a href="mypage.jsp"><button class="rbutton"><span>예약내역</span></button></a>
	<a href="payment.jsp"><button class="tbutton"><span>결제내역</span></button></a>
	<a href="myinfo.jsp"><button class="tbutton"><span>내정보</span></button></a>
	<a href="mycoupon.jsp"><button class="tbutton"><span>쿠폰함</span></button></a>
	<table>
		<tr>
			<th>No</th>
			<th>예약날짜</th>
			<th>참여인원</th>
			<th>예약상태</th>
			<th>비고</th>
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
		String pay_ok=null;
		for(int i=0;i<arr.size();i++){
			%>
			<tr>
				<td><%=arr.get(i).getBooking_idx() %></td>
				<td><%=arr.get(i).getBooking_time() %></td>
				<td><%=arr.get(i).getBooking_num() %></td>
				<%
				if(arr.get(i).getBooking_pay_ok()>0){
					pay_ok="결제미완료";
				}else{
					pay_ok="결제완료";
				}
				%>
				<td><%=pay_ok %></td>
				<%
				if(pay_ok.equals("결제완료")){
					%><td><a href="/seesc/booking/bookingCancle.jsp?user_idx=<%=user_idx %>&booking_idx=<%=arr.get(i).getBooking_idx()%>"><button>취소</button></a><td><%
				}else{
					%><td><td><%
				}
				%>
				
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
