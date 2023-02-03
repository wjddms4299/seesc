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
<style>
*{
background-color: #3CFBFF;
margin: 0px auto;
text-align: center;
}

</style>
<body>
<section>
<article>
<h1>예약내역관리</h1>
	<a href="/seesc/mypage/manage/managepage.jsp"><button><span>관리자페이지</span></button></a>
	<a href="boomange.jsp"><button><span>예약내역관리</span></button></a>
	<a href="mng.jsp"><button><span>관리권한부여</span></button></a>
	<a href="/seesc/mypage/myinfo.jsp"><button><span>내정보</span></button></a>
<table>
	<tr>
		<th>예약번호</th>
		<th>테마번호</th>
		<th>예약자이름</th>
		<th>예약자전화번호</th>
		<th>예약접수시간</th>
		<th>예약날짜</th>
		<th>예약게임시간대</th>
		<th>결제수단</th>
		<th>결제여부</th>
		<th>메세지</th>
		<th>예약인원수</th>
		<th>금액</th>
	</tr>
	<%
	ArrayList<BookingDTO> arr=boodao.boomanage();
	
	if(arr==null||arr.size()==0){
		%>
		<tr>
			<td colspan="12">예약내역이 없습니다.</td>
		</tr>
		<%
	}
	else{
		for(int i=0;i<arr.size();i++){
			%>
			<tr>
				<th><%=arr.get(i).getBooking_idx() %></th>
				<th><%=arr.get(i).getThema_idx() %></th>
				<th><%=arr.get(i).getBooking_name() %></th>
				<th><%=arr.get(i).getBooking_tel() %></th>
				<th><%=arr.get(i).getBooking_time() %></th>
				<th><%=arr.get(i).getTime_date() %></th>
				<%
				String ptime=null;
				if(arr.get(i).getTime_ptime()==1){ptime="10:00";}
				else if(arr.get(i).getTime_ptime()==2){ptime="12:00";}
				else if(arr.get(i).getTime_ptime()==3){ptime="14:00";}
				else if(arr.get(i).getTime_ptime()==4){ptime="16:00";}
				else if(arr.get(i).getTime_ptime()==5){ptime="18:00";}
				else if(arr.get(i).getTime_ptime()==6){ptime="20:00";}
				%>
				<th><%=ptime %></th>
				<%
				String pay=null;
				if(arr.get(i).getBooking_pay()>0){
					pay="무통장";
				}else{
					pay="현장결제";
				}
				%>
				<th><%=pay %></th>
				<%
				String pay_ok=null;
				if(arr.get(i).getBooking_pay_ok()>0){
					pay_ok="결제미완료";
				}else{
					pay_ok="결제완료";
				}
				%>
				<th><%=pay_ok %></th>
				<%
				String msg=arr.get(i).getBooking_msg();
				if(arr.get(i).getBooking_msg()==null||arr.get(i).getBooking_msg().equals("")){
					msg="x";
				}
				%>
				<th><%=msg %></th>
				<th><%=arr.get(i).getBooking_num() %>명</th>
				<th><%=arr.get(i).getBooking_money() %>원</th>
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