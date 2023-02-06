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
text-align: center;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<article  id = "map">
<h2>찾아오시는 길</h2>
<br>

<hr style ="width : 300px; color : D7F1FA">

<a href = "https://map.naver.com/v5/search/%EC%9D%B4%EC%A0%A0%20%EC%95%84%EC%B9%B4%EB%8D%B0%EB%AF%B8/place/13574433?c=15,0,0,0,dh&placePath=%3Fentry%253Dbmp" target = "_blank">
<img src = "/seesc/img/map.png" style = "width : 600px; height :450px;" alt ='지도'></a>
<h5>이미지를 누르면 네이버 지도가 열립니다.</h5><br><br>
<h3>주소 : 서울 서대문구 신촌로 1004</h3>
<h3>지하철 2호선 신촌역 4번출구 도보 400m</h3>
<h3>지하철 2호선 신촌역 4번출구 도보 400m</h3>

주차장이 협소한 관계로 대중교통을 이용하시거나
신촌,이대역 주변 주차장 이용 부탁드립니다.


</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>