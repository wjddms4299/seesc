<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<script>
function open_idCheck(){
	window.open('idCheck.jsp','idCheck','width=450,height=200')
}
function open_nicCheck(){
	window.open('nicCheck.jsp','nicCheck','width=450,height=200')
}
</script>
<style>
fieldset{
	width: 450px;
	margin: 0px auto;
}
fieldset table{
	margin: 0px auto;
}
th{
	text-align:left;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
	<section>
		<article>
			<h2 align="center"> 회 원 가 입 </h2>
		</article>
		<article>
			<fieldset>
				<form name="memberJoin" action="memberJoin_ok.jsp">
				<table align="center">
					<tr>
						<th>아이디</th>
					</tr>
					<tr>
						<td><input type="text" name="user_id" placeholder="아이디를 입력해주세요." readonly></td>
						<td><input type="button" name="idCheck" value="중복확인" onclick="open_idCheck()"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
					</tr>
					<tr>
						<td><input type="password" name="user_pwd" placeholder="비밀번호를 입력해주세요."></td>
					</tr>
					<tr>
						<th>이름</th>
					</tr>
					<tr>
						<td><input type="text" name="user_name" placeholder="이름을 입력해주세요."></td>
					</tr>
					<tr>
						<th>닉네임</th>
					</tr>
					<tr>
						<td><input type="text" name="user_nic" placeholder="닉네임을 입력해주세요." readonly></td>
						<td><input type="button" name="nicCheck" value="중복확인" onclick="open_nicCheck()"></td>
					</tr>
					<tr>
						<th>성별</th>
					</tr>
					<tr>
						<th>남자<input type="radio" name="user_se" value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							여자<input type="radio" name="user_se" value="0"></th>
					</tr>
					<tr>
						<th>이메일</th>
					</tr>
					<tr>
						<td><input type="text" name="user_email" placeholder="이메일을 입력해주세요."></td>
					</tr>
					<tr>
						<th>휴대전화</th>
					</tr>
					<tr>
						<td><input type="text" name="user_tel" placeholder="핸드폰 번호를 입력해주세요." maxlength="3">-<input type="text" name="user_tel" maxlength="4">-<input type="text" name="user_tel" maxlength="4"></td>
					</tr>
					<tr>
						<th>생년월일
					</tr>
					<tr>
						<td>
						<select name="year">
						<option value="">--선택--</option>
						<%
						for(int i=1950;i<=2020;i++){
							%>
						<option value="<%=i%>"><%=i %></option>
							<%
						}
						%>
						</select>
						<select name="month">
						<option value="">--선택--</option>
						<%
						for(int i=1;i<=12;i++){
					
	
							%>
						<option value="<%=i%>"><%=i %></option>
							<%
						}
						%>
						</select>
						<select name="day">
						<option value="">--선택--</option>
						<%
						for(int i=1;i<=31;i++){
							%>
						<option value="<%=i%>"><%=i %></option>
							<%
						}
						%>
						</select>
						</td>
					</tr>
					<tr>
					<td colspan="2" align="center"><div><input type="submit" value="가입하기"> </div></td>
					</tr>
				</table>
				</form>
			</fieldset>
		</article>
	</section>
<%@include file="../footer.jsp" %>
</body>
</html>