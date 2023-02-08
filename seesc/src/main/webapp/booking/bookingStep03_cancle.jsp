<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.esc.booking.*" %>
<jsp:useBean id="bdao" class="com.esc.booking.BookingDAO" scope="session"></jsp:useBean>
<jsp:useBean id="cpdao" class="com.esc.coupon.CouponDAO" scope="session"></jsp:useBean>
<%
String booking_idx_s=request.getParameter("booking_idx");
int booking_idx=Integer.parseInt(booking_idx_s);
BookingDTO dto=bdao.one_bookingList(booking_idx);

String booking_pay_ok_s=request.getParameter("booking_pay_ok");
int booking_pay_ok=Integer.parseInt(booking_pay_ok_s);

String bank=null;
String cacle_banknum_s=null;
String depositor=null;
if(booking_pay_ok==0){
	bank=request.getParameter("bank");
	cacle_banknum_s=request.getParameter("cacle_banknum");
	if(cacle_banknum_s==null || cacle_banknum_s.equals("")){
		%>
		<script>
		window.alert("계좌번호를 입력해주세요.");
		history.back();
		</script>
		<%
		return;
	}
	long cacle_banknum;
	try{
		cacle_banknum=Long.parseLong(cacle_banknum_s);
	}catch(NumberFormatException e){
		%>
		<script>
		window.alert("계좌번호는 '숫자'만 입력해주세요.");
		history.back();
		</script>
		<%
		return;
	}
	
	if(cacle_banknum_s.length()!=13){
		%>
		<script>
		window.alert("계좌번호는 '13개'의 숫자로 입력해주세요.");
		history.back();
		</script>
		<%
		return;
	}
	
	depositor=request.getParameter("depositor");
	if(depositor==null || depositor.equals("")){
		%>
		<script>
		window.alert("예금주명을 입력해주세요.");
		history.back();
		</script>
		<%
		return;
	}
}

String cancel_banknum=bank+"-"+cacle_banknum_s+"-"+depositor;

int coupon_idx=bdao.bookingCouponIdx(booking_idx);

if(coupon_idx!=0) {
	bdao.bookingCouponUse_R(coupon_idx);
}

int result=bdao.bookingDelete(booking_idx,dto,cancel_banknum);

if (result==1) {%>
	<script>
	window.alert('취소가 완료되었습니다.');
	window.opener.location.href='bookingStep01.jsp';
	window.self.close();
	
	</script>
<%}else {%>
	<script>
	window.alert('예약취소에 실패하였습니다. 고객센터로 연락바랍니다.');
	window.opener.location.href='bookingStep01.jsp';
	window.self.close();
	</script>
<%}%>
