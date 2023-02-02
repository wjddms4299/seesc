<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
article div{
	float:left; 
}
table{
	margin:0px auto;
}
table img{
	width: 200px;
	height: 150px;
}
section{
	width:1200px;
}
</style>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<body>
<%@include file="/header.jsp" %>
<section>

	<article>
		<div><img alt="자물쇠 이미지" src="/seesc/thema_img/lock.png"></div>
		<h2>방 목록</h2>
		<table>
			<tr>
				<td><img alt="방탈출 1" src="/seesc/thema_img/001.jpg" ></td>
				<td>운명 : 대학생 철수와 직장인 유리의 만남은 결코 우연이 아니었다!!!<br>
				 그들의 운명적인 만남 이야기</td>
				<td><input type="button" value="예약하기"  onclick="location.href='/seesc/booking/bookingStep01.jsp'"></td>
			</tr>
			<tr>
				<td><img alt="방탈출 2" src="/seesc/thema_img/002.jpg" ></td>
				<td>할로윈 :할로윈의 밤 수많은 괴물들이 깨어나는 시간 <br>
					괴물들이 당신을 맞이할 것입니다.! </td>
				<td><input type="button" value="예약하기" onclick="location.href='/seesc/booking/bookingStep01.jsp'"></td>
			</tr>
			<tr>
				<td><img alt="방탈출 3" src="/seesc/thema_img/003.jpg" ></td>
				<td>새학기 선택지 : 중학생 철수는 순조로운 학창생활을 하고 있었는데 <br>
					갑자기 폭행 사건에 휘말려 가해자가 되고 마는데,<br>
					 철수를 도와 철수의 누명을 풀어주자!</td>
				<td><input type="button" value="예약하기" onclick="location.href='/seesc/booking/bookingStep01.jsp'"></td>
			</tr>
			<tr>
				<td><img alt="방탈출 4" src="/seesc/thema_img/004.jpg" ></td>
				<td>셜록홈즈 : 당신이 셜록홈즈가 되어<br>
					미스터리한 사건을 해결하자!!</td>
				<td><input type="button" value="예약하기" onclick="location.href='/seesc/booking/bookingStep01.jsp'"></td>
			</tr>
			<tr>
				<td><img alt="방탈출 5" src="/seesc/thema_img/005.jpg" ></td>
				<td>재판관이 되어보자 : 당신은 청소년 재판의 재판관이 되어<br>
					분별력 있는 판결로 재판을 끝내주세요!!</td>
				<td><input type="button" value="예약하기" onclick="location.href='/seesc/booking/bookingStep01.jsp'"></td>
			</tr>
			<tr>
				<td><img alt="방탈출 6" src="/seesc/thema_img/006.jpg" ></td>
				<td>그대를 향한 나의 마음: 사랑을 해본 적 없는 은지와 철수는 <br>
					서로 썸을 타고 있지만 서로에게 먼저 말을 건네기 어려운데<br>
					그들의 징검다리가 되어 사랑을 이어주자!</td>
				<td><input type="button" value="예약하기" onclick="location.href='/seesc/booking/bookingStep01.jsp'"></td>
			</tr>
			<tr>
				<td><img alt="방탈출 7" src="/seesc/thema_img/007.jpg"></td>
				<td>좀비를 피해 살아남아라 : 2023년 갑자기 좀비바이러스가 퍼진다<br>
				쉘터의 마지막 생존자가 된 당신 어떻게 살아남을 것인가!</td>
				<td><input type="button" value="예약하기" onclick="location.href='/seesc/booking/bookingStep01.jsp'"></td>
			</tr>
		</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>