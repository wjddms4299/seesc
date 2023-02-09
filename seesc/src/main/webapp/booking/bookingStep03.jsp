<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdao" class="com.esc.booking.BookingDAO" scope="session"></jsp:useBean>
<jsp:useBean id="cpdao" class="com.esc.coupon.CouponDAO" scope="session"></jsp:useBean>
<%
String user_idx_s=request.getParameter("user_idx");
Integer user_idx=Integer.parseInt(user_idx_s);

String thema_idx=request.getParameter("thema_idx");
String time_date=request.getParameter("time_date");
String time_ptime=request.getParameter("time_ptime");

String booking_name=request.getParameter("booking_name");
String booking_tel=request.getParameter("booking_tel");
String booking_pay=request.getParameter("booking_pay");
String booking_pwd=request.getParameter("booking_pwd");

String thema_name=request.getParameter("thema_name");
String thema_time=request.getParameter("thema_time");
String booking_num=request.getParameter("booking_num");

String booking_idx_s=request.getParameter("booking_idx");
int booking_idx=Integer.parseInt(booking_idx_s);
String booking_pay_ok_s=request.getParameter("booking_pay_ok");
int booking_pay_ok=Integer.parseInt(booking_pay_ok_s);

String booking_money=request.getParameter("booking_money");

String booking_msg=bdao.bookingMsg(booking_idx);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
section{width:1200px;margin:0px auto;}
#a1{margin:0px 100px;}
#a1-1{margin:40px auto;}
.a2{font-size:17px;}
#a2-1{margin:0px auto;}
#d1{margin:40px 270px;}
</style>
<script>
function popup_open(){
	window.open('/seesc/booking/cancle_popup.jsp?booking_idx=<%=booking_idx%>&booking_pay_ok=<%=booking_pay_ok%>&thema_idx=<%=thema_idx%>&time_date=<%=time_date%>&time_ptime=<%=time_ptime%>','cancle_popup.jsp','width=550,height=300,top=100,left=300');
}
</script>
</head>
<body>
<%@include file="/header.jsp"%>
<section>
 <article>
 <br><br>
 <h2 id="a1">예약완료</h2>
 <br>
 <h4 align="center"><img src="/seesc/thema_img/Step01_2.png" alt="STEP 01" height="100"> &nbsp; <img src="/seesc/thema_img/Step02_2.png" alt="STEP 02" height="100"> &nbsp; <img src="/seesc/thema_img/Step03_1.png" alt="STEP 03" height="110"></h4>
 <br><br>
 </article>
 <article>
 <table id="a1-1" border="1" cellspacing="0">
 	<tr height="40">
 		<td width="300" align="center" class="a2"><b>테마 (Room)</b></td>
 		<td width="500">&nbsp;&nbsp;&nbsp;&nbsp;<%=thema_name%></td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>예약일 (Date)</b></td>
 		<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=time_date%></td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>예약시간</b></td>
 		<td>&nbsp;&nbsp;&nbsp;&nbsp;<%
 		int time_ptime_i=Integer.parseInt(time_ptime);
 		switch(time_ptime_i){
	 		case 1:out.print("10:00");break;
	 		case 2:out.print("12:00");break;
	 		case 3:out.print("14:00");break;
	 		case 4:out.print("16:00");break;
	 		case 5:out.print("18:00");break;
	 		case 6:out.print("20:00");
 		}%></td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>게임시간</b></td>
 		<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=thema_time%></td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>인원 (Player)</b></td>
 		<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=booking_num%></td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>예약자</b></td>
 		<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=booking_name%></td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>연락처</b></td>
 		<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=booking_tel%></td>
 	</tr>
 	<%
 	try{
	 	if(user_idx!=0){%>
	 	<tr height="40">
	 		<td align="center" class="a2"><b>쿠폰 사용</b></td>
	 		<td>&nbsp;&nbsp;&nbsp;&nbsp;<%
			String coupon_idx_s=request.getParameter("coupon_idx");
			int coupon_idx=Integer.parseInt(coupon_idx_s);
			
	 		int coupon_dc=0;
	 		if(coupon_idx!=0){
	 			coupon_dc=cpdao.bookingCouponDc(coupon_idx);
	 		}
	 		switch(coupon_dc){
		 		case 1000:out.print("할인금액 1,000원");break;
		 		case 2000:out.print("할인금액 2,000원");break;
		 		case 3000:out.print("할인금액 3,000원");break;
		 		default:out.print("사용안함");
	 		}%></td>
	 	</tr>
	 	<%
	 	}
 	}catch(Exception e){
 		%>
		<script>
		window.alert('잘못된 접근입니다.');
		location.href='/seesc/index.jsp';
		</script>
		<%
	}%>
 	<tr height="40">
 		<td align="center" class="a2"><b>참가요금</b></td>
 		<td>&nbsp;&nbsp;&nbsp;&nbsp;<b><%=booking_money%></b></td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>결제방식</b></td>
 		<td>&nbsp;&nbsp;&nbsp;&nbsp;<%
 		int booking_pay_i=Integer.parseInt(booking_pay);
 		switch(booking_pay_i){
	 		case 0:out.print("무통장입금");break;
	 		case 1:out.print("현장결제");
 		}%></td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>예약 비밀번호</b></td>
 		<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=booking_pwd%></td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>전달메세지</b></td>
 		<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=booking_msg%></td>
 	</tr>
 </table>
 </article>
 <article>
 <div id="d1">
 ※ 테마 예약 당일에는 취소가 불가능하며, 예약하신 시간 10분 전까지는 도착해주세요.<br>
 ※ 건물에 주차가 불가능합니다. 공영주차장을 이용해주세요!<br>
 ※ 코로나로 인한 방역을 실시하고 있습니다. 마스크를 꼭 착용해주세요!<br>
 </div>
 <table id="a2-1">
 	<tr>
 		<td>
 			<input type="button" value="예약 취소하기" onclick="popup_open();"> &nbsp; <a href="/seesc/booking/bookingStep01.jsp"><input type="button" value="돌아가기"></a>
 		</td>
 	</tr>
 </table>
 <br>
 </article>
</section>
<hr width="1200">
<%@include file="/footer.jsp"%>
</body>
</html>