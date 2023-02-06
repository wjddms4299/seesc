<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
<style>
#map {
width : 1200px;
text-align: center;
}
.zoom :hover{
zoom : 1.05;

}
label{
font-weight: bold;
font-size : 18px;
color: #50BEBE;
}

</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<article  id = "map">
<br>
<br>
<h2>찾아오시는 길</h2>
<br>

<hr style ="width : 300px; color : D7F1FA ;" >

<a href = "https://map.naver.com/v5/search/%EC%9D%B4%EC%A0%A0%20%EC%95%84%EC%B9%B4%EB%8D%B0%EB%AF%B8/place/13574433?c=15,0,0,0,dh&placePath=%3Fentry%253Dbmp" target = "_blank" class="zoom">
<img src = "/seesc/img/map.png" style = "width : 600px; height :450px;" alt ='지도'></a>
<p style ="font-weight:bold;">[이미지를 누르면 네이버 지도가 열립니다.]</p><br><br>


<br>
<div id = "maptext">
<label>주소</label>
<p>서울 서대문구 신촌로 1004</p>
<br>
<br>
<label>주변지하철</label>
<p>지하철 2호선 신촌역 4번출구 도보 400m<p>
<p>지하철 2호선 이대역 4번출구 도보 400m</p>
<br>
<br>
<label>운영시간</label>
<p>연중무휴  10:00 ~ 20:00 <p>

<br>
<br>
<label>전화</label>
<p>02-1234-1234<p>
<br>
<br>

<p style = "text-align:center;font-weight : bold;color :red;">차공간이 별도로 마련되어 있지 않아 대중교통 이용을 권장드립니다.<br>
길을 헤매고 있으실 경우, 위 번호로 전화주시면 친절히 설명도와드리겠습니다<p>

</div>
<br>
<br>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>