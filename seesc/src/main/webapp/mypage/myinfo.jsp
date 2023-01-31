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
			<th>아이디</th>
			<td><input type="text"><button><span>중복검사</span></button><h4>아이디를 확인해주세요.</h4></td>
			
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password"><h4>영문,숫자조합 8자이상</h4></td>
			
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password"></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><input type="radio">남자<input type="radio">여자</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text"></td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<td><input type="text">-<input type="text">-<input type="text"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text">@<input type="text"></td>
		</tr>
	</table>
	<button><span>저장하기</span></button>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>
