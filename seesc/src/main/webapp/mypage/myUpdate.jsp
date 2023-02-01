<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String user_pwd=request.getParameter("user_pwd");
    String user_pwd_ok=request.getParameter("user_pwd_ok");
    if(user_pwd!=user_pwd_ok){
    	%>
    	<script>
    	window.alert('비밀번호가 일치하지않습니다.');
    	location.href='/seesc/mypage/myinfo.jsp';
    	</script>
    	<%
    }
	String user_id=request.getParameter("user_id");
    String user_nic=request.getParameter("user_nic");
    String user_name=request.getParameter("user_name");
    String tel=request.getParameter("tel1")+request.getParameter("tel2")+request.getParameter("tel3");
    String user_email=request.getParameter("user_email");
    
 %>