<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
table {
	text-align:center;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<h1 align="center">Cafe Order</h1>
<section>
	<article>
		<table style=float:left;>
			<tr>
				<th colcpan="3" align="center">Coffee</th>
			</tr>
			<tr>
				<td>아메리카노</td>
				<td>3.0</td>
				<td><input type="button" value="-"><input type="text" size="1" placeholder="0" name="am"><input type="button" value="+" readonly></td>
			</tr>
			<tr>
				<td>카푸치노</td>
				<td>4.0</td>
				<td><input type="button" value="-"><input type="text" size="1" placeholder="0" name="ca"><input type="button" value="+" readonly></td>
			</tr>
			<tr>
				<td>말차라떼</td>
				<td>5.0</td>
				<td><input type="button" value="-"><input type="text" size="1" placeholder="0" name="ma"><input type="button" value="+" readonly></td>
			</tr>
			<tr>
				<td>카페모카</td>
				<td>4.5</td>
				<td><input type="button" value="-"><input type="text" size="1" placeholder="0" name="cfm"><input type="button" value="+" readonly></td>
			</tr>
			<tr>
				<td>에스프레소</td>
				<td>2.5</td>
				<td><input type="button" value="-"><input type="text" size="1" placeholder="0" name="af"><input type="button" value="+" readonly></td>
			</tr>
		</table>
		<table style=float:left;>
			<tr>
				<th colcpan="3" align="center">non-Coffee</th>
			</tr>
			<tr>
				<td>유자차</td>
				<td>4.0</td>
				<td><input type="button" value="-"><input type="text" size="1" placeholder="0" name="yj"><input type="button" value="+" readonly></td>
			</tr>
			<tr>
				<td>레몬차</td>
				<td>3.0</td>
				<td><input type="button" value="-"><input type="text" size="1" placeholder="0" name="rm"><input type="button" value="+" readonly></td>
			</tr>
			<tr>
				<td>얼그레이</td>
				<td>3.5</td>
				<td><input type="button" value="-"><input type="text" size="1" placeholder="0" name="ag"><input type="button" value="+" readonly></td>
			</tr>
			<tr>
				<td>복숭아아이스티</td>
				<td>3.0</td>
				<td><input type="button" value="-"><input type="text" size="1" placeholder="0" name="pi"><input type="button" value="+" readonly></td>
			</tr>
			<tr>
				<td>케모마일</td>
				<td>3.5</td>
				<td><input type="button" value="-"><input type="text" size="1" placeholder="0" name="cm"><input type="button" value="+" readonly></td>
			</tr>
		</table>
	</article>
</section>

</body>
</html>