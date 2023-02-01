<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
<style>
#button{
position: fixed;
right: 78px;
bottom: 19px;
}
.w-btn {
    z-index: 1;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-outline {
    z-index: 1;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
.w-btn-brown {
    background-color: #ce6d39;
    color: #ffeee4;
}

.w-btn-brown-outline {
    border: 3px solid #ce6d39;
    color: #b8b8b8;
}

.w-btn-brown-outline:hover {
    background-color: #ce6d39;
    color: #ffeee4;
}
.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn-outline:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn:active {
    transform: scale(1.5);
}

.w-btn-outline:active {
    transform: scale(1.5);
}

#topbutton{
position: fixed;
right: 78px;
bottom: 70px;
}


</style>
<script>
function login_open(){
	window.open('/seesc/member/login.jsp','login','width=450,height=250');
}


</script>
<header>
<a id="top"></a>

<!-- ------------------------------------------------------ -->
		<span id="mainlogo"> <a href = "/seesc/index.jsp"><img
			src="/seesc/img/logo_w.png" alt="로고" style ="width :140px; height : 110px;"></a></span> <span
			id="mainlogin"><a href="javascript:login_open();">로그인</a> <a href="/seesc/mypage/mypage.jsp"><img
				src="/seesc/img/login_main.png" alt="마이페이지"></a> </span>


		<span id="mainmenu">
			<div class="dropdown">
				<div class="dropbtn"><a href="#">소개</a></div>
				<div class="dropdown-content">
					<a href="#">방탈출 소개</a>
					<a href="#">테마 소개</a>
					<a href ="/seesc/introduce/map.jsp">오시는 길</a>
				</div>
			</div>
			<ul class="dropdown">
				<li class="dropbtn"><a href="#">예약</a></li>
				<ul class="dropdown-content">
					<a href="/seesc/booking/bookingStep01.jsp">예약하기</a>
					<a href="/seesc/booking/b_bookingcheck.jsp">예약 확인</a>

				</ul>
			</ul>
			<ul class="dropdown">
				<li class="dropbtn"><a href="/seesc/community/community.jsp">커뮤니티</a></li>
				<ul class="dropdown-content">
					<a href="#">공지사항</a>
					<a href="/seesc/community/qna_list.jsp">QnA</a>
					<a href="#">팀구해요</a>
				</ul>
			</ul>
			
			<ul class="dropdown">
				<li class="dropbtn"><a href="/seesc/hof/hof.jsp">명예의 전당</a></li>
				</ul>
			</ul>
		</span>
		

<!-- ---------------------------------------------- -->
<a href="seesc/cafe/cafeOrder.jsp"><button id="button" type="button" class="w-btn w-btn-brown"><span>카페주문하기</span></button></a>
<a href="#top"><button id="topbutton" type="button"><span>▲</span></button></a>


</header>