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
    %>
<section>
<h1>마이페이지</h1>
<article>
	<a href="mypage.jsp"><button><span>예약내역</span></button></a>
	<a href="payment.jsp"><button><span>결제내역</span></button></a>
	<a href="myinfo.jsp"><button><span>내정보</span></button></a>
	<a href="mycoupon.jsp"><button><span>쿠폰함</span></button></a>
	<a href="cafeorderinfo.jsp"><button><span>카페주문내역</span></button></a>
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
		for(int i=0;i<arr.size();i++){
			%>
			<tr>
				<td><%=arr.get(i).getBooking_idx() %></td>
				<td><%=arr.get(i).getBooking_time() %></td>
				<td><%=arr.get(i).getBooking_num() %></td>
				<td><%=arr.get(i).getBooking_pay_ok() %></td>
				<td><a href="<% %>"><button>취소</button></a><td>
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
