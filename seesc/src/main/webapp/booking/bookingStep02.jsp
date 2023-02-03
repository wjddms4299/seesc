<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.esc.thema.*"%>
<jsp:useBean id="thdao" class="com.esc.thema.ThemaDAO" scope="session"></jsp:useBean>
<%@ page import="com.esc.userinfo.*"%>
<jsp:useBean id="udao" class="com.esc.userinfo.UserinfoDAO" scope="session"></jsp:useBean>
<%@ page import="com.esc.coupon.*"%>
<jsp:useBean id="cpdao" class="com.esc.coupon.CouponDAO" scope="session"></jsp:useBean>
<%
String thema_idx_s=request.getParameter("thema_idx");
int thema_idx=Integer.parseInt(thema_idx_s);

String time_date=request.getParameter("time_date");

String time_ptime_s=request.getParameter("time_ptime");
int time_ptime=Integer.parseInt(time_ptime_s);

////////////////////////////////////////////////////////////////////////

Integer user_idx=(Integer)session.getAttribute("user_idx");

String user_name="";
String user_tel="";
if(user_idx!=null){
	UserinfoDTO udto=udao.bookingUserinfo(user_idx);
	user_name=udto.getUser_name();
	user_tel=udto.getUser_tel();
}
///////////////////////////////////////////////////////////////////////

ArrayList<CouponDTO> cpdto=cpdao.bookingCoupon(user_idx);
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
#a1-0{background:lightgray;}
.a1-1{margin:40px auto;}
.a2{font-size:17px;}
#a2-1{margin:0px auto;}
#d1{margin:40px 220px;}
#d2{margin:0px auto;}
</style>
<script>
var money;

function changeMoney(){
	money=document.getElementByld('select_people');
}
</script>
</head>
<body>
<%@include file="/header.jsp"%>
<section>
<form name="bookingStep02" action="bookingStep02_ok.jsp">
<input type="hidden" name="thema_idx" value="<%=thema_idx%>">
<input type="hidden" name="time_date" value="<%=time_date%>">
<input type="hidden" name="time_ptime" value="<%=time_ptime%>">
 <article>
 <br><br>
 <h2 id="a1">예약하기</h2>
 <br>
 <h4 align="center">STEP01 날짜/테마 선택 &nbsp; <label id="a1-0">STEP02 정보입력</label> &nbsp; STEP03 예약확인</h4>
 <br><br>
 </article>
 <article>
 <table class="a1-1" border="1" cellspacing="0">
 	<tr height="40">
 		<%
 		ThemaDTO thdto=thdao.themaInfo(thema_idx); %>
 		<td width="300" align="center" class="a2"><b>테마 (Room)</b></td>
 		<td width="500">&nbsp;&nbsp;<%=thdto.getThema_name()%><input type="hidden" name="thema_name" value="<%=thdto.getThema_name()%>"></td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>예약일 (Date)</b></td>
 		<td>&nbsp;&nbsp;<%=time_date%></td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>예약시간</b></td>
 		<td>&nbsp;&nbsp;<%
 		switch(time_ptime){
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
 		<td>&nbsp;&nbsp;<%=thdto.getThema_time()%>분<input type="hidden" name="thema_time" value="<%=thdto.getThema_time()%>분"></td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>인원 (Player)</b></td>
 		<td>&nbsp;&nbsp;
 			<select name="booking_num">
 				<%
 				for(int i=thdto.getThema_people_min();i<=thdto.getThema_people_max();i++){
 					%>
 					<option value="<%=i%>명 (<%
 					StringBuffer booking_money_b=new StringBuffer(String.valueOf(i*thdto.getThema_price()));
 					booking_money_b.insert(booking_money_b.length()-3,",");
 					out.print(booking_money_b);%>원)"><%=i%>명 (<%=booking_money_b%>원)</option>
 					<%
 				}
 				%>
 			</select>
 		</td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>예약자</b></td>
 		<td>&nbsp;&nbsp;<input type="text" name="booking_name" value="<%=user_name%>"></td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>연락처</b></td>
 		<td>&nbsp;&nbsp;<input type="text" name="booking_tel" value="<%=user_tel%>"></td>
 	</tr>
 	<%if(user_idx!=null){%>
 	<tr height="40">
 		<td align="center" class="a2"><b>쿠폰 사용</b></td>
 		<td>&nbsp;&nbsp;
 			<select name="coupon_idx">
 				<option value="0">사용안함</option>
 				<%
 				if(cpdto!=null){
	 				for(int i=0;i<cpdto.size();i++){
	 					%>
	 					<option value="<%=cpdto.get(i).getCoupon_idx()%>"><%=cpdto.get(i).getCoupon_name()%>원 할인쿠폰</option>             <!-- cpdto.get(i).getCoupon_idx() -->
	 					<%
	 				}
 				}
 				%>
 			</select>
 		</td>
 	</tr>
 	<%}%>
 	<tr height="40">
 		<td align="center" class="a2"><b>참가요금</b></td>
 		<td>&nbsp;&nbsp;<b>44,000원</b></td>               <!-- cpdto.get(i).getCoupon_dc() -->
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2" ><b>결제방식</b></td>
 		<td>&nbsp;&nbsp;
 			<input type="radio" name="booking_pay" value="0">무통장입금&nbsp;&nbsp;&nbsp;&nbsp;
 			<input type="radio" name="booking_pay" value="1">현장결제
 		</td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>예약 비밀번호</b></td>
 		<td>&nbsp;&nbsp;<input type="text" name="booking_pwd"></td>
 	</tr>
 	<tr height="40">
 		<td align="center" class="a2"><b>전달메세지</b></td>
 		<td>&nbsp;&nbsp;<input type="text" name="booking_msg"></td>
 	</tr>
 </table>
 </article>
 <article>
 <div id="d1">
 ※ 123-456-777777 [신한은행] / 예금주: 홍길동 - 예약금: 2만원<br>
 ※ 예약금은 주말 및 공휴일에만 받습니다.<br>
 ※ 당일 취소시에는 선결제약 환불이 되지 않으니 주의바랍니다.<br>
 ※ 예약금만 선결제 하신 경우에는, 현장에서 선결제하신 예약금을 제외한 차액만 추가 결제하시면 됩니다.<br>
 ※ 음주시 이용제한이 될 수 있으니 양해부탁드립니다.<br>
 </div>
 <table class="a1-1" border="1" cellspacing="0" width="700" height="250">
 	<tr>
 		<td>
	 		&nbsp;개인정보 수집, 이용 및 제공 등에 관한 고지사항<br>
	 		&nbsp;개인정보 수집, 이용 및 제공 등에 관한 고지사항
	 		개인정보 수집, 이용 및 제공 등에 관한 고지사항
	 		개인정보 수집, 이용 및 제공 등에 관한 고지사항<br>
	 		&nbsp;개인정보 수집, 이용 및 제공 등에 관한 고지사항
	 		개인정보 수집, 이용 및 제공 등에 관한 고지사항
	 		개인정보 수집, 이용 및 제공 등에 관한 고지사항
	 		개인정보 수집, 이용 및 제공 등에 관한 고지사항
	 		개인정보 수집, 이용 및 제공 등에 관한 고지사항
	 		개인정보 수집, 이용 및 제공 등에 관한 고지사항
	 		개인정보 수집, 이용 및 제공 등에 관한 고지사항
	 		개인정보 수집, 이용 및 제공 등에 관한 고지사항
	 		개인정보 수집, 이용 및 제공 등에 관한 고지사항
	 		개인정보 수집, 이용 및 제공 등에 관한 고지사항
	 		개인정보 수집, 이용 및 제공 등에 관한 고지사항
	 		개인정보 수집, 이용 및 제공 등에 관한 고지사항
 		</td>
 	</tr>
 </table>
 <table id="d2">
 <tr>
 <td>
 이용약관 및 개인정보취급방침에 동의합니까?&nbsp;&nbsp;
 <input type="radio" name="booking_agree" value="0">동의함&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="radio" name="booking_agree" value="1">동의안함
 </td>
 </tr>
 </table>
 <br>
 <table id="a2-1">
 	<tr>
 		<td>
 			<a href="bookingStep01.jsp"><input type="button" value="취소"></a> <input type="submit" value="예약하기">
 		</td>
 	</tr>
 </table>
 <br>
 </article>
</form>
</section>
<hr width="1200">
<%@include file="/footer.jsp"%>
</body>
</html>