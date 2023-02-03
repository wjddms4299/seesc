<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="com.esc.coupon.*" %>
    <jsp:useBean id="coudao" class="com.esc.coupon.CouponDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
	<link rel = "stylesheet" type = "text/css" href = "/seesc/css/subLayout.css">
<body>
<%@include file="/header.jsp" %>
<section>
<h1>마이페이지</h1>
<article>
	<a href="mypage.jsp"><button class="tbutton"><span>예약내역</span></button></a>
	<a href="payment.jsp"><button class="tbutton"><span>결제내역</span></button></a>
	<a href="myinfo.jsp"><button class="tbutton"><span>내정보</span></button></a>
	<a href="mycoupon.jsp"><button class="rbutton"><span>쿠폰함</span></button></a>
	<a href="cafeorderinfo.jsp"><button class="tbutton"><span>카페주문내역</span></button></a>
	<table>
		<tr>
			<th>No</th>
			<th>쿠폰명</th>
			<th>할인금액</th>
			<th>발급일</th>
			<th>만료일</th>
			<th>사용여부</th>
		</tr>
		<%
		int user_idx=(int)session.getAttribute("user_idx");
		ArrayList<CouponDTO> arr=coudao.myCoupon(user_idx);
		if(arr==null||arr.size()==0){
			%>
			<tr>
				<td colspan="6">보유 쿠폰 내역이 없습니다.</td>
			</tr>
			<%
		}else{
			for(int i=0;i<arr.size();i++){
				%>
				<tr>
					<th><%=arr.get(i).getCoupon_idx() %></th>
					<th><%=arr.get(i).getCoupon_name() %></th>
					<th><%=arr.get(i).getCoupon_dc() %></th>
					<th><%=arr.get(i).getCoupon_start() %></th>
					<th><%=arr.get(i).getCoupon_end() %></th>
					<th><%String couponuse=arr.get(i).getCoupon_use()>0?"미사용":"사용완료"; %><%=couponuse %></th>
				</tr>
				<%
			}
		}
		%>
		
	</table>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>
