<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
    <%@page import="com.esc.userinfo.*" %>
    <jsp:useBean id="userdto" class="com.esc.userinfo.UserinfoDTO"></jsp:useBean>
    <jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO"></jsp:useBean>
    <jsp:useBean id="coudao" class="com.esc.coupon.CouponDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body{
background-color: #828282;
margin: 0px auto;
text-align: center;
}
table {
  width: 100%;
  border-collapse: collapse;
}

th, td {
  text-align: left;
  padding: 8px;
  text-align: center;
}

th {
  background-color: #f2f2f2;
}
</style>
<%
int manager=(int)session.getAttribute("manager");
int user_idx=(int)session.getAttribute("user_idx");
if(manager<1){
	%>
	<script>
	window.alert('잘못된 접근입니다.');
	location.href='/seesc/index.jsp';
	</script>
	<%
}
%>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/subLayout.css">
<body>
<h1>쿠폰관리페이지</h1>
<section>
	<a href="/seesc/index.jsp"><button class="tbutton"><span>홈</span></button></a>
	<a href="/seesc/mypage/manage/managepage.jsp"><button class="tbutton"><span>관리자페이지</span></button></a>
	<a href="boomange.jsp"><button class="tbutton"><span>예약내역관리</span></button></a>
	<a href="mng.jsp"><button class="tbutton"><span>관리권한부여</span></button></a>
	<a href="cancelmng.jsp"><button class="tbutton"><span>예약취소관리</span></button></a>
	<a href="coumng.jsp"><button class="rbutton"><span>쿠폰관리</span></button></a>
	<a href="/seesc/mypage/myinfo.jsp"><button class="tbutton"><span>내정보</span></button></a>
	<table>
		<tr>
			<th>회원번호</th>
			<th>회원아이디</th>
			<th>회원닉네임</th>
			<th>회원이름</th>
			<th>생성쿠폰금액</th>
		</tr>
		<%
		ArrayList<UserinfoDTO> arr=userdao.alluserinfo();
		if(arr==null||arr.size()==0){
			%>
			<tr>
				<td colspan="6">회원정보가 없습니다.</td>
			</tr>
			<%
		}
		for(int i=0;i<arr.size();i++){
			if(user_idx==arr.get(i).getUser_idx())continue;
			%>
			<tr>
				<td><%=arr.get(i).getUser_idx() %></td>
				<td><%=arr.get(i).getUser_id() %></td>
				<td><%=arr.get(i).getUser_nic() %></td>
				<td><%=arr.get(i).getUser_name() %></td>
				<td><a href="coumng_ok.jsp?idx=<%=arr.get(i).getUser_idx() %>&dc=1000"><button class="tbutton"><span>1000</span></button></a><a href="coumng_ok.jsp?idx=<%=arr.get(i).getUser_idx() %>&dc=2000"><button class="tbutton"><span>2000</span></button></a><a href="coumng_ok.jsp?idx=<%=arr.get(i).getUser_idx() %>&dc=3000"><button class="tbutton"><span>3000</span></button></a></td>
			</tr>
			<%
		}
		%>
		</table>
		</section>
</body>
</html>