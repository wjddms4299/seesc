<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#button{
position: fixed;
right: 78px;
bottom: 19px;
}
#topbutton{
position: fixed;
right: 78px;
bottom: 50px;
}
</style>
<script>
function login_open(){
	window.open('login.jsp','login','width=450,height=250');
}


</script>
<header>
<a id="top"></a>
<nav>
	<ul>
		<li><a href="/seesc/index.jsp"><img alt="0" src="/escape/logo.png"></a></li>
		<li>소개</li>
		<li>예약하기</li>
		<li>커뮤니티</li>
		<li><a href="/escape/write/hof.jsp">명예의전당</a></li>
		<li><a href="javascript:login_open();">로그인</a></li>
		<li><a href="/escape/mypage.jsp">프로필로고</a></li>
	</ul>
</nav>
<button id="button" type="button"><span>카페주문하기</span></button>
<a href="#top"><button id="topbutton" type="button"><span>▲</span></button></a>
<hr>
</header>