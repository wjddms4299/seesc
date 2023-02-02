<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
</head>
<style>
h1{
text-align: center;
}
section {
  width: 100%;
  height: 100vh;
  display: flex;
  align-items: center;
}
</style>
<body>
<%@include file="header.jsp" %>
<h1>"숨겨진 단서를 찾아라!"</h1>
<h1>탄탄한 스토리! 재방문 많은 방탈출!</h1>
<section>
<div>
<h2>공지사항</h2>
<img src="/seesc/img/notice.png" width="550" height="600">
</div>
<div>
<h2>이벤트</h2>
<button><span>◀◀이전</span></button>
<button><span>다음▶▶</span></button>
<a><img src="/seesc/img/moningdc.png" width="550" height="600"></a>
<a><img></a>
</div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>