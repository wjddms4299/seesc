<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function join_open(){
	window.close();
	opener.location='/seesc/member/memberJoin.jsp';
	
}
</script>
<%
String saveid="";
Cookie cks[]=request.getCookies();
if(cks!=null){
	for(int i=0;i<cks.length;i++){
		if(cks[i].getName().equals("saveid")){
			saveid=cks[i].getValue();
		}
	}
}
%>
<body>
<form name="loginfm" action="login_ok.jsp">
	<fieldset>
		<legend>Login</legend>
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" placeholder="아이디" name="userid" value="<%=saveid%>" required></td>
			</tr>
			<tr>
				<th>PWD</th>
				<td><input type="password" placeholder="비밀번호" name="userpwd" required></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="saveid"value="on" <%=saveid.equals("")?"":"checked" %>>ID기억</td>
				<td><input type="submit" value="[login]" style="text-align: right;"></td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:join_open();">회원가입</a><td>
			</tr>
		</table>
	</fieldset>
</form>
</body>
</html>
