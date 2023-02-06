<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
section{width:1200px;margin:0px auto;}
#a1{margin:0px 100px;}
#a1-0{background:lightgray;}
#a1-1{margin:20px auto;}
#a1-2{color:red;}
#a1-3{color:blue;}
select{margin:0px 950px;}
#a2{width:500px;float:left;}
#a3{width:580px;float:left;}
.a2-0{margin:10px 150px;}
.a2-1{margin:10px 0px;}
#a2-2{font-size:22px;}
.a2-3{margin-bottom:7px;}
</style>
</head>
<body>
<%@include file="/header.jsp"%>
<section>
<article>
 <br><br>
 <h2 id="a1">테마 수정하기</h2>
 <br>
 <h3 class="a2-0">테마명</h3>
 <div class="a2-0">난이도:난이도&nbsp;&nbsp;
 					인원:최소인원~최대인원명&nbsp;&nbsp;
 					시간:시간분</div>
 <hr width="950">
</article>
<article id="a2">
 <img alt="방탈출 new" src="/seesc/thema_img/001.jpg" width="300" height="400" class="a2-0">
</article>
<article id="a3">
 <br><br><br><br>
 <label class="a2-1" id="a2-2">#해시태그1 #해시태그2 #해시태그3</label><br><br>
 <label class="a2-1"><div class="a2-3">설명1</div>
				<div class="a2-3">설명2</div>
				<%//if(설명3!=null){%><div class="a2-3">설명3</div></label><%//}%><br><br><br><br><br><br><br><br><br><br><br>
</article>
</section>
<hr width="1200">
<%@include file="/footer.jsp"%>
</body>
</html>