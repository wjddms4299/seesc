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
<body>
<%@include file="/header.jsp" %>
<section>
<article>
<div><span>ID찾기</span></div>
<div>
<h2><%=user_name %>님의 아이디</h2>
<div><%=user_id %></div>
<a href="#"><button><span>로그인하러가기</span></button></a>
<a href="/seesc/member/findPwd.jsp"><button><span>PWD찾기</span></button></a>
</div>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>