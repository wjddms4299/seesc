<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
<style>
#button{
position: fixed;
right: 78px;
bottom: 19px;
z-index: 2;
}
#topbutton{
position: fixed;
right: 85px;
bottom: 70px;
color :black;
z-index: 2;
}

#button:hover{
filter: saturate(1000%)
}
#topbutton:hover{
filter: saturate(1000%)
}
</style>
<script>
function login_open(){
	window.open('/seesc/member/login.jsp','login','width=370,height=450');
}


</script>
<%
    String sid=(String)session.getAttribute("sid");
%>
<div class="headerback">
<header>
<div class="header">
<a id="top"></a>

<!-- ------------------------------------------------------ -->
		<span id="mainlogo"> <a href = "/seesc/index.jsp"><img src="/seesc/img/logo_y.png" alt="로고" style ="width : 170px; height : 120px;"></a></span> 
		<%
		if(sid==null||sid==""){
			%>
			<span id="mainlogin"><a href="javascript:login_open();">로그인</a> <a href="javascript:login_open();"><img src="/seesc/img/login_no.png" alt="로그인"></a> </span>
			<%
		}else{
			%>
			<span id="mainlogin"><a href="/seesc/member/logout.jsp">로그아웃</a> <a href="/seesc/mypage/mypage.jsp"><img src="/seesc/img/login_main.png" alt="마이페이지"></a> </span>
			<%
		}
		
		%>

		<span>
			<div class="dropdown">
				<div class="dropbtn"><a href="/seesc/introduce/escape_introduce.jsp"> 소 개 </a></div>
				<div class="dropdown-content">
					<a href="/seesc/introduce/escape_introduce.jsp">방탈출 소개</a>
					<a href="/seesc/introduce/thema_introduce.jsp">테마 소개</a>
					<a href ="/seesc/introduce/map.jsp">오시는 길</a>
				</div>
			</div>
			<ul class="dropdown">
				<li class="dropbtn"><a href="/seesc/booking/bookingStep01.jsp"> 예 약 </a></li>
				<ul class="dropdown-content">
					<a href="/seesc/booking/bookingStep01.jsp">예약하기</a>
					<%if(sid==null||sid.equals("")){ %>
					<a href="/seesc/booking/b_bookingcheck.jsp">예약 확인</a>
					<%}else{%>
					<a href="/seesc/mypage/payment.jsp">예약 확인</a>
					<% }%>
				</ul>
			</ul>
			<ul class="dropdown">
				<li class="dropbtn"><a href="/seesc/community/community_eventcontent_list.jsp">커뮤니티</a></li>
				<ul class="dropdown-content">
					<a href="/seesc/community/community_eventcontent_list.jsp">이벤트</a>
					<a href="/seesc/community/qna_list.jsp">QnA</a>
					<a href="/seesc/community/community_freecontent.jsp">자유게시판</a>
				</ul>
			</ul>
			
			<ul class="dropdown">
				<li class="dropbtn"><a href="/seesc/hof/hof.jsp">명예의 전당</a></li>
				</ul>
			</ul>
		</span>
		

<!-- ---------------------------------------------- -->
<div id="button"><a href="https://open.kakao.com/o/gHOLLp2e"><img src ="/seesc/img/kakaoLogo.png" style = "width:50px;height:50px;" alt = "카카오톡문의" ></a></div>
<div id="topbutton"><a href="#top"><img src ="/seesc/img/toppoint.png" style = "width:30px;height:30px;" alt = "상단으로이동" ></a></div>

</div>
</header>
</div>
  <hr width="1100" style="background : yellow; height :1px;">