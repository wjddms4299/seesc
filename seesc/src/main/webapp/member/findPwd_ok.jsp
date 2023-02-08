<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String user_name=request.getParameter("user_name");
String user_id=request.getParameter("user_id");
String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
String monthr=month;
String dayr=day;
int month_1=Integer.parseInt(month);
if(month_1<10){month="0"+month;}
int day_1=Integer.parseInt(day);
if(day_1<10){day="0"+day;}
String user_birth=year+month+day;
int result=userdao.findPwd(user_name, user_id, user_birth);
String msg;
if(result==0){
	msg="등록된 회원정보가 없습니다.";
	%>
	<script>
		window.alert('<%=msg%>')
		location.href='/seesc/member/findPwd.jsp';
	</script>
	<%
	return;
}
%>
<style>
.article {
  width: 80%;
  margin: 0 auto;
  text-align: center;
  font-family: sans-serif;
}

.article div {
  margin: 20px 0;
  color: black;
}

.article div span {
  font-size: 2em;
  font-weight: bold;
  display: block;
  margin-bottom: 20px;
  color: white;
}

form {
  display: inline-block;
  background-color: #f2f2f2;
  padding: 20px;
  border-radius: 10px;
}

input[type="text"],input[type="password"] {
  width: 80%;
  height: 30px;
  font-size: 1em;
  padding: 5px;
  margin: 10px 0;
  border-radius: 5px;
  border: none;
  box-shadow: 2px 2px 5px #999;
}

input[type="submit"] {
  width: 40%;
  height: 40px;
  font-size: 1.2em;
  margin-top: 20px;
  border-radius: 20px;
  border: none;
  background-color: #0077ff;
  color: #fff;
  cursor: pointer;
}
input[type="submit"]:hover{
	background-color: #0057ff;
}

select {
  width: 20%;
  height: 40px;
  font-size: 1em;
  padding: 5px;
  margin: 10px 10px 10px 0;
  border-radius: 5px;
  border: none;
  box-shadow: 2px 2px 5px #999;
}
</style>
<body>
<%@include file="/header.jsp" %>
<section>
<article class="article">
<div><span>PWD변경하기</span></div>
<form action="/seesc/member/findPwd_ok_ok.jsp" method="post">
<input type="hidden" name="user_name" value="<%=user_name%>">
<input type="hidden" name="year" value="<%=year%>">
<input type="hidden" name="month" value="<%=monthr%>">
<input type="hidden" name="day" value="<%=dayr%>">
<div>
	<h2>ID</h2>
	<input type="text" readonly value="<%=user_id%>" name="user_id">
</div>
<div>
	<h2>PWD</h2>
	<input type="password" name="user_pwd">
</div>
<div>
	<h2>PWD check</h2>
	<input type="password" name="user_pwdch">
</div>
<div>
	<input type="submit" value="변경">
</div>
</form>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>