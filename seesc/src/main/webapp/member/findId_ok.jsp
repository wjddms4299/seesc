<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO"></jsp:useBean>
<%
String user_name=request.getParameter("user_name");
String tel1=request.getParameter("tel1");
String tel2=request.getParameter("tel2");
String tel3=request.getParameter("tel3");
String tel=tel1+"-"+tel2+"-"+tel3;
String user_id=userdao.findId(user_name, tel);
String msg;
if(user_id==null||user_id==""){
	msg="등록된 회원정보가 없습니다.";
	%>
	<script>
		window.alert('<%=msg%>')
		location.href='/seesc/member/findId.jsp';
	</script>
	<%
	return;
}
%>
<script>
function login_open(){
	window.open('/seesc/member/login.jsp','login','width=390,height=580');
}


</script>
<style>
.article{
margin: 0px auto;
text-align: center;
}
.h1{font-size:30px;
color : #FFA500;
text-align:center;
}
.id{
border: 3px double #FFA500;
width:190px;
height: 40px;
font-size: 25px;
}
.login {
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
.pwdf {
    display: inline-block;
    width: 150px;
    padding: 10px;
    background-color: #a0a0a0;
    color: black;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 20px;
    text-decoration: none;
    text-align: center;
}
</style>
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
<body>
<%@include file="/header.jsp" %>
<section>
<article class="article">
<br><br>
         <h1 class ="h1">ID찾기</h1>
         <br>
           <hr width="130px">
           <br>
<div>
<h2><%=user_name %>님의 아이디</h2>
<div class="id"><%=user_id %></div>
<a href="javascript:login_open();"><button class="login"><span>로그인하러가기</span></button></a>
<a href="/seesc/member/findPwd.jsp"><button class="pwdf"><span>PWD찾기</span></button></a>
</div>
</article>
<br><br><br>
</section>
<%@include file="/footer.jsp" %>
</body>