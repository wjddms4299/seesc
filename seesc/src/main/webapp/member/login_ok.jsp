<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.userinfo.*"%>
<jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO"></jsp:useBean>
<%
String userid=request.getParameter("userid");
String userpwd=request.getParameter("userpwd");
String saveid=request.getParameter("saveid");
int result=userdao.loginCheck(userid, userpwd);

if(result==userdao.LOGIN_OK){
	int user_idx=userdao.userNum(userid);
	int manager=userdao.mngnum(userid);
	session.setAttribute("sid", userid);
	session.setAttribute("user_idx", user_idx);
	session.setAttribute("manager", manager);
	if(saveid==null){
		Cookie ck=new Cookie("saveid",userid);
		ck.setMaxAge(0);
		response.addCookie(ck);
	}else{
		Cookie ck=new Cookie("saveid",userid);
		ck.setMaxAge(60*60*24*30);
		response.addCookie(ck);
	}
	%>
	<script>
	window.alert('환영합니다!');
	opener.location.reload();
	window.self.close();
	</script>
	
	<% 
	}else if(result==userdao.NOT_ID||result==userdao.NOT_PWD){
	%>
	<script>
	window.alert('아이디 또는 비밀번호가 틀렸습니다.');
	location.href='/seesc/index.jsp';
	</script>
	<%
}else if(result==userdao.ERROR){
	out.println("오류");
}
	%>
%>