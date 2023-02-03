<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.esc.userinfo.*" %>
    <jsp:useBean id="userdto" class="com.esc.userinfo.UserinfoDTO"></jsp:useBean>
    <jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO" scope = "session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
	<link rel = "stylesheet" type = "text/css" href = "/seesc/css/subLayout.css">
<body>
<%@include file="/header.jsp" %>
<section>
<h1>마이페이지</h1>
<article>
	<a href="mypage.jsp"><button class="tbutton"><span>예약내역</span></button></a>
	<a href="payment.jsp"><button class="tbutton"><span>결제내역</span></button></a>
	<a href="myinfo.jsp"><button class="rbutton"><span>내정보</span></button></a>
	<a href="mycoupon.jsp"><button class="tbutton"><span>쿠폰함</span></button></a>
	<%
	int user_idx=(int)session.getAttribute("user_idx");
	UserinfoDTO dto=userdao.userInfo(sid);
	%>
	<form name="myinfo" action="myUpdate.jsp">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" readonly value="<%=sid%>" name="user_id"></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" value="<%=dto.getUser_nic()%>" name="user_nic"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="user_pwd"><h4>영문,숫자조합 8자이상</h4></td>
			
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="user_pwd_ok"></td>
		</tr>
		<tr>
			<th>성별</th>
			<%if(dto.getUser_se()>0){
				%><td>남자</td><%
			}else{
				%><td>여자</td><%
			}
				%>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" value="<%=dto.getUser_name()%>" name="user_name"></td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<%
			String tel=dto.getUser_tel();
			String tel1=tel.substring(0, 3);
			String tel2=tel.substring(4, 8);
			String tel3=tel.substring(9, tel.length());
			%>
			<td><input type="text" value="<%=tel1%>" name="tel1">-<input type="text" value="<%=tel2%>" name="tel2">-<input type="text" value="<%=tel3%>" name="tel3"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" value="<%=dto.getUser_email()%>" name="user_email"></td>
		</tr>
	</table>
	<input type="submit" value="저장하기">
	</form>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>
