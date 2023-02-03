<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdao" class="com.esc.booking.BookingDAO" scope="session"></jsp:useBean>
<%
Integer user_idx=(Integer)session.getAttribute("user_idx");

String booking_name=request.getParameter("booking_name");
if(booking_name==null || booking_name==""){
	%>
	<script>
	window.alert("예약자 성함을 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

String booking_tel1=request.getParameter("booking_tel1");
String booking_tel2_s=request.getParameter("booking_tel2");
String booking_tel3_s=request.getParameter("booking_tel3");
if(booking_tel1==null || booking_tel2_s==null || booking_tel3_s==null || booking_tel1=="" || booking_tel2_s=="" || booking_tel3_s==""){
	%>
	<script>
	window.alert("연락처를 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

try{
	int booking_tel2=Integer.parseInt(booking_tel2_s);
	int booking_tel3=Integer.parseInt(booking_tel3_s);
}catch(NumberFormatException e){
	%>
	<script>
	window.alert("연락처는 '숫자'만 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

if(booking_tel2_s.length()!=4 || booking_tel3_s.length()!=4){
	%>
	<script>
	window.alert("연락처는 각각 '4개'의 숫자만 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

String booking_pay_s=request.getParameter("booking_pay");
if(booking_pay_s==null){
	%>
	<script>
	window.alert("결제방식을 선택해주세요.");
	history.back();
	</script>
	<%
	return;
}

String booking_pwd=request.getParameter("booking_pwd");
if(booking_pwd==null || booking_pwd==""){
	%>
	<script>
	window.alert("예약 비밀번호를 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

String booking_agree=request.getParameter("booking_agree");
if(booking_agree==null || booking_agree.equals("1")){
	%>
	<script>
	window.alert("이용약관 및 개인정보취급방침에 동의해주세요.");
	history.back();
	</script>
	<%
	return;
}

String thema_idx_s=request.getParameter("thema_idx");
int thema_idx=Integer.parseInt(thema_idx_s);
String time_date_t=request.getParameter("time_date");
StringBuffer time_date_b=new StringBuffer(request.getParameter("time_date"));
time_date_b.delete(time_date_b.length()-4,time_date_b.length());
String time_date=time_date_b.toString();
String time_ptime_s=request.getParameter("time_ptime");
int time_ptime=Integer.parseInt(time_ptime_s);
String thema_name=request.getParameter("thema_name");
String thema_time=request.getParameter("thema_time");
String booking_num_t=request.getParameter("booking_num");
String booking_num_s=booking_num_t.substring(0,1);
int booking_num=Integer.parseInt(booking_num_s);
String booking_msg=request.getParameter("booking_msg");

String booking_tel=booking_tel1+"-"+booking_tel2_s+"-"+booking_tel3_s;

int coupon_idx=0;
if(user_idx!=null){
	String coupon_idx_s=request.getParameter("coupon_idx");
	coupon_idx=Integer.parseInt(coupon_idx_s);
}

int booking_pay=Integer.parseInt(booking_pay_s);
int booking_pay_ok=0;
switch(booking_pay){
	case 0:booking_pay_ok=0;break;
	case 1:booking_pay_ok=1;
}

if(user_idx==null){		
	user_idx=0;
}
int result=bdao.booking(thema_idx,coupon_idx,user_idx,booking_name,booking_tel,booking_pwd,
			time_date,time_ptime,booking_pay,booking_pay_ok,booking_msg,booking_num);

if(result==1){%>
	<script>
	location.href="bookingStep03.jsp?booking_name=<%=booking_name%>&booking_tel=<%=booking_tel%>&booking_pay=<%=booking_pay%>&booking_pwd=<%=booking_pwd%>&thema_idx=<%=thema_idx%>&time_date=<%=time_date_t%>&time_ptime=<%=time_ptime%>&thema_name=<%=thema_name%>&thema_time=<%=thema_time%>&booking_num=<%=booking_num_t%>&booking_msg=<%=booking_msg%>&coupon_idx=<%=coupon_idx%>";
	</script>
<%}else{%>
	<script>
	window.alert('예약하기에 실패하였습니다.');
	location.href="bookingStep01.jsp";
	</script>
<%}%>