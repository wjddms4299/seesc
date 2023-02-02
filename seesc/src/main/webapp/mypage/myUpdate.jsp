<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.esc.userinfo.*"%>
<jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO"></jsp:useBean>
    <%
    String user_pwd=request.getParameter("user_pwd");
    String user_pwd_ok=request.getParameter("user_pwd_ok");
    if(!user_pwd.equals(user_pwd_ok)){
    	%>
    	<script>
    	window.alert('비밀번호가 일치하지않습니다.');
    	location.href='/seesc/mypage/myinfo.jsp';
    	</script>
    	<%
    return;
    }
	String user_id=request.getParameter("user_id");
    String user_nic=request.getParameter("user_nic");
    String user_name=request.getParameter("user_name");
    String tel=request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
    String user_email=request.getParameter("user_email");
    int result=userdao.userUpdate(user_id, user_nic, user_name, tel, user_email, user_pwd);
    String msg=result>0?"정보수정완료!":"정보수정실패!";
    
 %>
 <script>
 window.alert('<%=msg%>');
 location.href='/seesc/index.jsp';
 </script>