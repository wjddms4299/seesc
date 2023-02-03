<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@page import="java.util.*"%>
<%@page import="com.esc.booking.*"%>
<%@page import="com.esc.thema.*"%>
<jsp:useBean id="boodao" class="com.esc.booking.BookingDAO"
	scope="session"></jsp:useBean>
<jsp:useBean id="thdao" class="com.esc.thema.ThemaDAO" scope="session"></jsp:useBean>
<%

String booking_name = request.getParameter("booking_name")==null?"":request.getParameter("booking_name");
String booking_tel = request.getParameter("phone1")==null?"":request.getParameter("phone1") + request.getParameter("phone2") + request.getParameter("phone3");
String inputtel = request.getParameter("phone1") +"-"+ request.getParameter("phone2") +"-"+ request.getParameter("phone3");
String booking_pwd = request.getParameter("booking_pwd");

ArrayList<BookingDTO> arr = boodao.b_BookingCheck(booking_name, booking_tel, booking_pwd);
if (arr == null || arr.size() == 0) {
%>
<script>
	window.alert('잘못된 정보를 입력하였습니다. 다시 시도해주세요.');
	location.href = 'b_bookingcheck.jsp';
</script>
<%
return;
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
table{
text-align : center;
width : 800px;
}
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<h2>예약 내역 조회</h2>
			<form name>
			<table>
				<tr>
					<th>예약번호</th>
					<th>테마</th>
					<th>날짜</th>
					<th>인원</th>
					<th>결제금액</th>
					<th>결제수단</th>
					<th>결제상태</th>
					<th>예약 메시지</th>
					<th>비고</th>
				</tr>
				<%for(int i=0;i<arr.size();i++){
					%><tr><td><%=arr.get(i).getBooking_idx() %>
					<td><%= thdao.themaName(arr.get(i).getThema_idx())%></td>
					<td><%=arr.get(i).getTime_date() %></td>
					<td><%=arr.get(i).getBooking_num() %></td>
					<%StringBuffer returnMoney=new StringBuffer(String.valueOf(arr.get(i).getBooking_money()));
 					returnMoney.insert(returnMoney.length()-3,",");
 					%>
					<td><%=returnMoney%>원</td>
					<td><%=arr.get(i).getBooking_pay()==0?"무통장입금":"현장결제" %></td>
					<td><%=arr.get(i).getBooking_pay_ok()==0?"결제완료":"미결제"%></td>
					<td><%=arr.get(i).getBooking_msg()==null?"":arr.get(i).getBooking_msg() %>
					<td><input type="button" value="예약 취소" onclick = "location.href = 'bookingCancle.jsp?booking_idx=<%=arr.get(i).getBooking_idx()%>'">
				
					<%
				} %>

			</table>
			</form>
		</article>
	</section>
	<%@include file="/footer.jsp"%>

</body>
</html>