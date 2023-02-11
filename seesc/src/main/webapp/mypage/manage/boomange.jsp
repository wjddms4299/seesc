<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="com.esc.booking.*" %>
    <jsp:useBean id="boodao" class="com.esc.booking.BookingDAO" scope="session"></jsp:useBean>
    <jsp:useBean id="thdao" class="com.esc.thema.ThemaDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body{
background-color: #828282;
margin: 0px auto;
text-align: center;
}
table {
  width: 100%;
  border-collapse: collapse;
}

th, td {
  text-align: left;
  padding: 8px;
  text-align: center;
}

th {
  background-color: #f2f2f2;
}
</style>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/subLayout.css">
<body>
<section>
<article>
<h1>예약내역관리</h1>
	<a href="/seesc/index.jsp"><button class="tbutton"><span>홈</span></button></a>
	<a href="/seesc/mypage/manage/managepage.jsp"><button class="tbutton"><span>관리자페이지</span></button></a>
	<a href="boomange.jsp"><button class="rbutton"><span>예약내역관리</span></button></a>
	<a href="mng.jsp"><button class="tbutton"><span>관리권한부여</span></button></a>
	<a href="cancelmng.jsp"><button class="tbutton"><span>예약취소관리</span></button></a>
	<a href="coumng.jsp"><button class="tbutton"><span>쿠폰관리</span></button></a>
	<a href="/seesc/mypage/myinfo.jsp"><button class="tbutton"><span>내정보</span></button></a>
<table>
	<tr>
		<th>예약번호</th>
		<th>테마이름</th>
		<th>예약자이름</th>
		<th>예약자전화번호</th>
		<th>예약접수시간</th>
		<th>예약날짜</th>
		<th>결제수단</th>
		<th>결제여부</th>
		<th>메세지</th>
		<th>예약인원수</th>
		<th>금액</th>
		<th>비고</th>
	</tr>
	<%
	ArrayList<BookingDTO> arr=boodao.boomanage();
	
	if(arr==null||arr.size()==0){
		%>
		<tr>
			<td colspan="11">예약내역이 없습니다.</td>
		</tr>
		<%
	}
	else{
		for(int i=0;i<arr.size();i++){
			%>
			<tr>
				<td><%=arr.get(i).getBooking_idx() %></td>
				<td><%= thdao.themaName(arr.get(i).getThema_idx())%></td>
				<td><%=arr.get(i).getBooking_name() %></td>
				<td><%=arr.get(i).getBooking_tel() %></td>
				<td><%=arr.get(i).getBooking_time() %></td>
				<td><%=arr.get(i).getTime_date() %></td>
				<%
				String pay=null;
				if(arr.get(i).getBooking_pay()>0){
					pay="현장결제";
				}else{
					pay="무통장";
				}
				%>
				<td><%=pay %></td>
				<%
				String pay_ok=null;
				if(arr.get(i).getBooking_pay_ok()>0){
					pay_ok="결제미완료";
				}else{
					pay_ok="결제완료";
				}
				%>
				<td><%=pay_ok %></td>
				<%
				String msg=arr.get(i).getBooking_msg();
				if(arr.get(i).getBooking_msg()==null||arr.get(i).getBooking_msg().equals("")){
					msg="x";
				}
				%>
				<td><%=msg %></td>
				<td><%=arr.get(i).getBooking_num() %>명</td>
				<td><%=arr.get(i).getBooking_money() %>원</td>
				<td><input type = "button" value = "취소" onclick ="javascript: var result =window.confirm('에약을 취소하시겠습니까?');if(result){location.href ='/seesc/booking/bookingCancle_ok.jsp?booking_idx=<%=arr.get(i).getBooking_idx() %>'}"></td>
			</tr>
			<%
		}
	}
	%>
</table>
</article>
</section>
</body>
</html>