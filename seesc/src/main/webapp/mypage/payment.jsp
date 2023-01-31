<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<h1>마이페이지</h1>
<article>
	<a href="mypage.jsp"><button><span>예약내역</span></button></a>
	<a href="payment.jsp"><button><span>결제내역</span></button></a>
	<a href="myinfo.jsp"><button><span>내정보</span></button></a>
	<a href="cafeorderinfo.jsp"><button><span>카페주문내역</span></button></a>
	<table>
		<tr>
			<th>No</th>
			<th>결제날자(계좌)</th>
			<th>결제금액</th>
			<th>결제수단</th>
			<th>결제상태</th>
		</tr>
		<tr>
			<td></td>
		</tr>
	</table>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>
