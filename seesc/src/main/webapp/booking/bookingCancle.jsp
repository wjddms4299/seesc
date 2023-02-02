<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%request.setCharacterEncoding("utf-8"); %>
<%@page import = "com.esc.booking.*" %>
<jsp:useBean id="boodao" class="com.esc.booking.BookingDAO"
	scope="session"></jsp:useBean>
	
<%
String booking_idx_s = request.getParameter("booking_idx");
if(booking_idx_s==null||booking_idx_s.equals("")){
	booking_idx_s ="0";
}
int booking_idx = Integer.parseInt(booking_idx_s);
BookingDTO dto = boodao.one_bookingList(booking_idx);

if(dto==null){
	%>
	<script>
	window.alert ('잘못된 접근입니다.');
	location.href = 'b_bookingcheck.jsp?booking_idx=<%=booking_idx%>';
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
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<fieldset>
			<form name="bookingCancle" method="post" action="bookingCancle_ok.jsp">
				<h4>예약 취소</h4>
				<div>
				<span>예약취소를 위해서는 예약시 입력한 비밀번호가 필요합니다.</span> <br>
				<span>비밀번호를 잊으셨다면 업체로 연락 바랍니다.</span><br>
				<span>연락처 010-1111-1111</span>
		</div>
				
					<hr>
					<br>
				
					<%if(dto.getBooking_pay_ok()==0){ %>
					
				
					<label>환불 정보 입력</label>
					결제 내역이 있습니다. 환불은 3~5영업일 정도 소요됩니다.
					계좌번호 오류시 시간 지연될 수 있으니 확인하여 입력해주시기 바랍니다.
					<div><select name = "bank">
					<option value = "농협">농협
					<option value = "국민">국민
					<option value = "신한">신한
					<option value = "우리">우리
					<option value = "기업">기업
					<option value = "카카오">카카오
					<option value = "하나">하나
					<option value = "토스">토스
					</select>
					<input type ="number" name = "cacle_banknum" required placeholder="계좌번호">
					<input type = "text" name = "depositor" required placeholder="예금주명">
					</div>
					
					<%} %>
					<br><br><br><br><br><hr>
						<br><br>
					  정말 취소하시겠습니까?<br>
					  취소하려면 비밀번호를 입력해주세요.<br>
					  <br>
					<input type="hidden" name="booking_pwd"
						value="<%=dto.getBooking_pwd()%>"> <input
						type="hidden" name="booking_idx"
						value="<%=booking_idx%>">
					<div>
						비밀번호<input type="password" name="inputpwd"><input
							type="submit" value="확인">
					</div>
				</form>
			</fieldset>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>

