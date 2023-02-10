<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<%@page import="com.esc.booking.*"%>
<jsp:useBean id="boodao" class="com.esc.booking.BookingDAO"
	scope="session"></jsp:useBean>
<%
String cancel_banknum = request.getParameter("bank") + "-" + request.getParameter("cacle_banknum") + "-"
		+ request.getParameter("depositor");

String booking_idx_s = request.getParameter("booking_idx");
if (booking_idx_s == null || booking_idx_s.equals("")) {
	booking_idx_s = "0";
}
int booking_idx = Integer.parseInt(booking_idx_s);

String inputpwd = request.getParameter("inputpwd");
String booking_pwd = request.getParameter("booking_pwd");

BookingDTO dto = new BookingDTO();

dto = boodao.one_bookingList(booking_idx);

if (inputpwd.equals(booking_pwd)) {
	int result = boodao.bookingDelete(booking_idx, dto, cancel_banknum);

			if (result < 0) {
		%>
		<script>
				window.alert('예약취소에 실패하였습니다.');
				history.back();
				</script>
		<%
				return;
			} else {
				if(dto.getUser_idx()==0){
				%>
				<script>
			window.alert('예약 취소되었습니다.');
			location.href = '/seesc/booking/b_bookingcheck.jsp';
			</script>

			<%
}else{
		%>
		<script>
					window.alert('예약 취소되었습니다.');
					location.href = '/seesc/mypage/mypage.jsp';
					</script>

		<%
		}
		}
}else {
%>
<script>
	window.alert('비밀번호가 일치하지 않습니다.');
	history.back();

</script>

<%
}
%>