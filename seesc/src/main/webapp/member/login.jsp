<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

form {
    width: 300px;
    background-color: #f2f2f2;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 2px 2px 10px #999;
    display: flex;
    flex-direction: column;
    align-items: center;
}

h2 {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 20px;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 14px;
}

input[type="submit"] {
    width: 170px;
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    font-size: 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 20px;
    text-align: center;
}

input[type="submit"]:hover {
    background-color: #3e8e41;
}

a {
    display: inline-block;
    width: 150px;
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 20px;
    text-decoration: none;
    text-align: center;
}
.div{
margin: 0px auto;
text-align: center;
}
</style>
<script>
function join_open(){
	window.close();
	opener.location='/seesc/member/memberJoin.jsp';
	
}
function fid(){
	window.close();
	opener.location='/seesc/member/findId.jsp';
}
function fpwd(){
	window.close();
	opener.location='/seesc/member/findPwd.jsp';
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
			<div>
				<h2>ID</h2>
				<input type="text" placeholder="아이디" name="userid" value="<%=saveid%>" required>
			</div>
			<div>
				<h2>PWD</h2>
				<input type="password" placeholder="비밀번호" name="userpwd" required>
			</div>
			<div>
				<input type="checkbox" name="saveid"value="on" <%=saveid.equals("")?"":"checked" %>>ID기억
			</div>
			<div class="div">
				<input type="submit" value="login">
				<a href="javascript:join_open();">회원가입</a>
			</div>
			<div class="div">
				<a href="javascript:fid();">ID찾기</a>
				<a href="javascript:fpwd();">PWD찾기</a>
			</div>
</form>
</body>
</html>
