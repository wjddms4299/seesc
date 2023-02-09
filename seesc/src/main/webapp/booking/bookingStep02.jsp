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
Integer user_idx=(Integer)session.getAttribute("user_idx");

if(user_idx!=null){
	Integer manager=(Integer)session.getAttribute("manager");
	if(manager==1){
		%>
		<script>
		window.alert("관리자는 예약이 불가합니다.");
		location.href="bookingStep01.jsp";
		</script>
		<%
		return;
	}
}

////////////////////////////////////////////////////////////////////////

String thema_idx_s=request.getParameter("thema_idx");
int thema_idx=Integer.parseInt(thema_idx_s);

String time_date=request.getParameter("time_date");

String time_ptime_s=request.getParameter("time_ptime");
int time_ptime=Integer.parseInt(time_ptime_s);

////////////////////////////////////////////////////////////////////////

String user_name="";
String user_tel1="";
String user_tel2="";
String user_tel3="";
if(user_idx!=null){
	UserinfoDTO udto=udao.bookingUserinfo(user_idx);
	user_name=udto.getUser_name();
	String user_tel=udto.getUser_tel();
	user_tel1=user_tel.substring(0, 3);
	user_tel2=user_tel.substring(4, 8);
	user_tel3=user_tel.substring(9,user_tel.length());
}
///////////////////////////////////////////////////////////////////////

ArrayList<CouponDTO> cpdto=cpdao.bookingCoupon(user_idx);

///////////////////////////////////////////////////////////////////////

ThemaDTO thdto=thdao.themaInfo(thema_idx);%>
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
#d1{margin:40px 250px;}
#d2{margin:0px auto;}
#dd{margin-bottom:10px;}
.ddd{margin-bottom:5px;}
</style>
<script>
function applyCoupon(o){
	document.getElementById('money').value=
		(document.getElementById('money').value.substring(0,document.getElementById('money').value.length-5)
		-o.substring(o.length-4,o.length-3))+',000원';
}
</script>
</head>
<body>
<%@include file="/header.jsp"%>
<section>
<form name="bookingStep02" action="bookingStep02_ok.jsp">
<input type="hidden" name="user_idx" value="<%=user_idx!=null?user_idx:""%>">
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
 			<select name="booking_num" id="booking_num" onchange="document.getElementById('money').value=this.options[this.selectedIndex].value.substring(4,this.options[this.selectedIndex].value.length-1);document.getElementById('coupon_idx').value='0'">
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
 		<td>&nbsp;&nbsp;<select name="booking_tel1">
 					<option value = "010">010
 					<option value = "016">016
 					<option value = "017">017
 					<option value = "018">018
 					<option value = "019">019
 				</select>
 					- <input type="text" name="booking_tel2" value="<%=user_tel2%>" placeholder="숫자 4자리만 입력해주세요.">
 					- <input type="text" name="booking_tel3" value="<%=user_tel3%>" placeholder="숫자 4자리만 입력해주세요.">
 		</td>
 	</tr>
 	<%if(user_idx!=null){%>
 	<tr height="40">
 		<td align="center" class="a2"><b>쿠폰 사용</b></td>
 		<td>&nbsp;&nbsp;
 			<select name="coupon_idx" id="coupon_idx" onchange="document.getElementById('money').value=booking_num.options[booking_num.selectedIndex].value.substring(4,booking_num.options[booking_num.selectedIndex].value.length-1);applyCoupon(this.options[this.selectedIndex].value)">
 				<option value="0">사용안함</option>
 				<%
 				if(cpdto!=null){
	 				for(int i=0;i<cpdto.size();i++){
	 					%>
	 					<option value="<%=cpdto.get(i).getCoupon_idx()+"/"+cpdto.get(i).getCoupon_dc()%>"><%
 							StringBuffer coupon_dc_b=new StringBuffer(String.valueOf(cpdto.get(i).getCoupon_dc()));
 							coupon_dc_b.insert(coupon_dc_b.length()-3,",");
 							out.print(coupon_dc_b);%>원 할인쿠폰 - <%=cpdto.get(i).getCoupon_name()%></option>
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
 		<td>&nbsp;&nbsp;<b><input type="text" id="money" name="booking_money"
 			value="<%
 				StringBuffer booking_money_b=new StringBuffer(String.valueOf(thdto.getThema_people_min()*thdto.getThema_price()));
 				booking_money_b.insert(booking_money_b.length()-3,",");
 				out.print(booking_money_b);%>원" readonly></b></td>
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
 <div id="dd"><font size="4" color="green"><b>※ 123-456-777777 [신한은행] / 예금주: 홍길동 - 입금계좌</b></font></div>
 <div class="ddd">※ 참가요금은 주말 및 공휴일에만 받습니다.</div>
 <div class="ddd">※ 당일 취소시에는 선결제약 환불이 되지 않으니 주의바랍니다.</div>
 <div class="ddd">※ 음주시 이용제한이 될 수 있으니 양해부탁드립니다.</div>
 </div>
 <div class="a1-1" style="border:1px solid black;width:850px;height:220px;overflow:auto;">
	&nbsp;&nbsp;개인정보 수집, 이용 및 제공 등에 관한 고지사항
	<br>
	&nbsp;이용자 본인은 아래의 개인정보가 사실임을 확인하며, 아래와 같이 개인정보를 수집 및 이용하는 것에 동의합니다.
	<br><br>
	&nbsp;&nbsp;[개인정보의 수집 및 이용목적]
	<br>
	&nbsp;- 비회원 예매서비스 제공
	<br>
	&nbsp;- 예약 정보를 확인 및 관리하고, 필요 시 예약 이행 여부 확인을 위해 예약자에게 연락을 취할 목적 등
	<br>
	&nbsp;&nbsp;[수집하는 개인정보의 항목]
	<br>
	&nbsp;- 필수입력사항 : 이용자의 식별을 위한 정보
	<br>
	&nbsp;- 입력정보 : 이름, 휴대폰번호, 이메일 주소
	<br>
	&nbsp;&nbsp;[개인정보의 보유 및 이용기간]
	<br>
	&nbsp;개인정보의 수집목적 또는 제공 받은 목적이 달성되면 즉시 파기합니다. 다만, 상법 등 관련 법령의 규정에 의하여 거래관련 관리 의무 관계의 확인 등을 이유로 대금결제및재화들 의공급에관한기록에 의거 5년간 보유합니다.
	<br>
	&nbsp;* 개인 정보 제공에 동의하지 않을 권리가 있으며 개인 정보 제공에 동의하지 않을 경우 비회원 서비스는 제공되지 않습니다.
	<br><br>
	&nbsp;&nbsp;[기술적/관리적 보호대책]
	<br>
	&nbsp;- 비밀의 화원은 서버 및 네트워크 관련 보안시스템을 갖추고 있습니다. 방화벽 등 해킹 등 외부침입에 대비하여 각 서버마다 침입차단시스템 및 취약점 분석시스템 등을 갖추어 ‘이용자’가 제공한 개인정보보호에 만전을 기하고 있습니다. 개인 정보 취급직원 최소화는 물론 각 직원별 개인정보 접근권한을 달리하고, 수시보안교육을 통해 본 방침의 준수를 강조하고 있습니다.
	<br>
	&nbsp;- 비밀의 화원은 “이용자” 개인의 실수나 기본적인 인터넷의 위험성 때문에 일어나는 일들에 대해 책임을 지지 않습니다.
	<br>
	&nbsp;- 그 외 내부 관리자의 실수나 기술관리 상의 사고로 인해 개인정보의 상실, 유출, 변조, 훼손이 유발될 경우 비밀의 화원은 즉각“이용자”에게 사실을 알리고 적절한 대책과 보상을 강구할 것입니다.
 </div>
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
 			<input type="submit" value="예약하기"> &nbsp; <a href="bookingStep01.jsp"><input type="button" value="취소"></a>
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