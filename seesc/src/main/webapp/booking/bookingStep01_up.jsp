<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.thema.*"%>
<jsp:useBean id="thdao" class="com.esc.thema.ThemaDAO" scope="session"></jsp:useBean>
<%
String thema_idx_s=request.getParameter("thema_idx");
int thema_idx=Integer.parseInt(thema_idx_s);

ThemaDTO dto=thdao.themaInfo(thema_idx);
%>
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
<form name="bookingStep01_up" action="bookingStep01_up_ok.jsp">
<input type="hidden" name="thema_idx" value="<%=thema_idx%>">
<article>
 <br><br>
 <h2 id="a1">테마 수정하기</h2>
 <br>
 <h3 class="a2-0"><input type="text" name="thema_name" value="<%=dto.getThema_name()%>" size="25"></h3>
 <div class="a2-0">난이도:<input type="text" name="thema_level" value="<%=dto.getThema_level()%>" size="3">&nbsp;&nbsp;
 					인원:<input type="text" name="thema_people_min" value="<%=dto.getThema_people_min()%>" size="3">~<input type="text" name="thema_people_max" value="<%=dto.getThema_people_max()%>" size="3">명&nbsp;&nbsp;
 					시간:<input type="text" name="thema_time" value="<%=dto.getThema_time()%>" size="6">분&nbsp;&nbsp;
 					가격:<input type="text" name="thema_price" value="<%=dto.getThema_price()%>" size="9">원</div>
 <hr width="950">
</article>
<article id="a2">
 <img alt="방탈출 new" src="/seesc/thema_img/001.jpg" width="300" height="400" class="a2-0">
</article>
<article id="a3">
 <br><br><br><br>
 <label class="a2-1" id="a2-2">#<input type="text" name="thema_tag1" value="<%=dto.getThema_tag1()%>" size="9"> #<input type="text" name="thema_tag2" value="<%=dto.getThema_tag2()%>" size="9"> #<input type="text" name="thema_tag3" value="<%=dto.getThema_tag3()%>" size="9"></label><br><br>
 <label class="a2-1"><div class="a2-3"><input type="text" name="thema_intro1" value="<%=dto.getThema_intro1()%>" size="60"></div>
				<div class="a2-3"><input type="text" name="thema_intro2" value="<%=dto.getThema_intro2()%>" size="60"></div>
				<div class="a2-3"><%if(dto.getThema_intro3()==null){%><input type="text" name="thema_intro3" size="60"><%}else{%><input type="text" name="thema_intro3" value="<%=dto.getThema_intro3()%>" size="60"><%}%></div></label><br><br><br><br><br><br><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="수정하기"><br><br><br><br>
</article>
</form>
</section>
<hr width="1200">
<%@include file="/footer.jsp"%>
</body>
</html>