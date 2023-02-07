<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="thdao" class="com.esc.thema.ThemaDAO" scope="session"></jsp:useBean>
<%
String booking_idx_s=request.getParameter("booking_idx");
int booking_idx=Integer.parseInt(booking_idx_s);
String booking_pay_ok_s=request.getParameter("booking_pay_ok");
int booking_pay_ok=Integer.parseInt(booking_pay_ok_s);
String thema_idx_s=request.getParameter("thema_idx");
int thema_idx=Integer.parseInt(thema_idx_s);
String time_date=request.getParameter("time_date");
String time_ptime_s=request.getParameter("time_ptime");
int time_ptime=Integer.parseInt(time_ptime_s);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="bookingCancle" action="bookingStep03_cancle.jsp">
<input type="hidden" name="booking_idx" value="<%=booking_idx%>">
<input type="hidden" name="booking_pay_ok" value="<%=booking_pay_ok%>">
	<%if(booking_pay_ok==0){%>
		<h2 align="center">환불 정보 입력</h2>
		<ul>
			<li>결제 내역이 있습니다. 환불은 3~5영업일 정도 소요됩니다.</li>
			<br>
			<li>계좌번호 오류시 시간 지연될 수 있으니 확인하여 입력해주시기 바랍니다.</li>
		</ul>
		<br>
		<div align="center"><select name = "bank">
			<option value = "농협">농협
			<option value = "국민">국민
			<option value = "신한">신한
			<option value = "우리">우리
			<option value = "기업">기업
			<option value = "카카오">카카오
			<option value = "하나">하나
			<option value = "토스">토스
		</select>
		&nbsp; <input type ="text" name = "cacle_banknum" placeholder="계좌번호">
		&nbsp; <input type = "text" name = "depositor" placeholder="예금주명"></div>
	<%}else{%>
		<h2 align="center">예약 취소 확인</h2><br>
		<ul>
			<li><b>[<%=time_date%>
			<%switch(time_ptime){
		 		case 1:out.print("10:00");break;
		 		case 2:out.print("12:00");break;
		 		case 3:out.print("14:00");break;
		 		case 4:out.print("16:00");break;
		 		case 5:out.print("18:00");break;
		 		case 6:out.print("20:00");
	 		}%>
	 		<%=thdao.themaName(thema_idx)%>]</b> 예약을 취소합니다.</li>
			<br>
			<li>예약 취소 이후에는 다시 예약이 불가할 수 있습니다.</li>
		</ul>
	<%}%>
	<br>
	<br>
	<div align="center">정말 취소하시겠습니까? &nbsp; <input type="submit" value="확인"></div>
</form>
</body>
</html>