<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%request.setCharacterEncoding("utf-8"); %>
<%@page import = "com.esc.booking.*" %>
<jsp:useBean id="boodao" class="com.esc.booking.BookingDAO"
	scope="session"></jsp:useBean>
	
<%
int manager = session.getAttribute("manager") == null || session.getAttribute("manager").equals("")? 0: (Integer) session.getAttribute("manager");
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

if(manager!=0){%>
	<script>
	location.href = 'bookingCancle_ok.jsp?booking_idx=<%=booking_idx%>';
	</script>
<%}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
 select{
     	 width: 100px;
        height: 40px;
        border: none;
        border-radius: 5px;
        background-color: lightgray;
        color: black;
        font-size: 16px;
        margin-left: 20px;
        text-align:center;
      }
input[type="text"]{
  width: 70px;
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 1px solid lightgray;
        margin-bottom: 20px;
}
      input[type="password"],
      input[type="tel"] {
        width: 180px;
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 1px solid lightgray;
        margin-bottom: 20px;
      }
      
     input[type="button"]{
        width: 50px;
        height: 40px;
        border: none;
        border-radius: 5px;
        background-color: #14148C;
        color: white;
        font-size: 16px;
        margin-left: 3px;
      }
      input[type="submit"]{
        width: 100px;
        height: 40px;
        border: none;
        border-radius: 5px;
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
        margin-left: 5px;
      }
      input[type="button"]:hover{
    background-color: #00008C;
	}
      
      input[type="submit"]:hover {
    background-color: #3e8e41;
	}
	section{
	margin:0px auto;
	text-align : center;
	}
      </style>

</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
		<br><br><br>
			<form name="bookingCancle" method="post" action="bookingCancle_ok.jsp">
				
					<%if(dto.getBooking_pay_ok()==0){ %>
					
				<div style = "font-size:18px;">
					<label style ="color:red;">결제가 완료</label>된 건입니다.<br><br>
					환불 받으실 <label style ="color:red;">계좌번호를</label> 입력해주세요.<br>
					환불은 3~5영업일 정도 소요되며,<br>
					계좌번호 오류시 시간 지연될 수 있으니 확인하여 입력해주시기 바랍니다.
					</div><br>
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
					<input type ="tel" name = "cacle_banknum" maxlength="13" pattern="[0-9]{13}" onclick="this.value=''" required placeholder="-를 제외하고 입력">
					<input type = "text" name = "depositor" required placeholder="예금주명">
					</div>
					<br>
					<hr width ="500px;"><br><br>
					<%} %>
					<div style = "font-size:18px;">
					  정말 <label style ="color:red;">취소</label>하시겠습니까?<br>
					  예약시 입력한 비밀번호를 한번더 입력해주세요.</div><br>
					  <br>
					<input type="hidden" name="booking_pwd"
						value="<%=dto.getBooking_pwd()%>"> <input
						type="hidden" name="booking_idx"
						value="<%=booking_idx%>">
					<div style = "font-size:18px; ">
						비밀번호 <input type="password" name="inputpwd"><input
							type="submit" value="예약취소">
							<input
							type="button" value="이전" onclick ="history.back();">
					</div>
				</form>
			<br><br><br>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>

