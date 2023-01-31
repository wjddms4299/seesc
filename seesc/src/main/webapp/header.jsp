<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
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

<!-- ------------------------------------------------------ -->
		<span id="mainlogo"> <a href = "/seesc/index.jsp"><img
			src="/myweb3/mainTest/mainimg/logo_w.png" alt="로고" style ="width :140px; height : 110px;"></a></span> <span
			id="mainlogin"><a href="#">로그인</a> <a href="#"><img
				src="/myweb3/mainTest/mainimg/login_main.png" alt="마이페이지"></a> </span>


		<span id="mainmenu">
			<div class="dropdown">
				<div class="dropbtn"><a href="#">소개</a></div>
				<div class="dropdown-content">
					<a href="#">방탈출 소개</a>
					<a href="#">테마 소개</a>
					<a href="#">오시는 길</a>
				</div>
			</div>
			<ul class="dropdown">
				<li class="dropbtn"><a href="#">예약</a></li>
				<ul class="dropdown-content">
					<a href="#">예약하기</a>
					<a href="#">예약 확인</a>

				</ul>
			</ul>
			<ul class="dropdown">
				<li class="dropbtn"><a href="#">커뮤니티</a></li>
				<ul class="dropdown-content">
					<a href="#">공지사항</a>
					<a href="#">이벤트</a>
					<a href="#">질문과 답변</a>
					<a href="#">팀구해요</a>
				</ul>
			</ul>
			<ul class="dropdown">
				<li class="dropbtn"><a href="#">카페</a></li>
			</ul>
			</ul>
			<ul class="dropdown">
				<li class="dropbtn"><a href="#">명예의 전당</a></li>
			</ul>
		</span>
		<button id="button" type="button">
			<span>카페주문하기</span>

<!-- ---------------------------------------------- -->
<button id="button" type="button"><span>카페주문하기</span></button>
<a href="#top"><button id="topbutton" type="button"><span>▲</span></button></a>

</header>