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
<body>
<%@include file="/header.jsp" %>
<section>
<article>
<form action="/seesc/member/findPwd_ok_ok.jsp">
<div><span>PWD변경하기</span></div>
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