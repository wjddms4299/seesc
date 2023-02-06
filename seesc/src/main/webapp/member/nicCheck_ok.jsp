<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="udao" class="com.esc.userinfo.UserinfoDAO"></jsp:useBean>
<%
String nicname=request.getParameter("nicname");
boolean result=udao.nicCheck(nicname);
if(result){
	%>
<script>
window.alert('<%=nicname%>는 이미 가입되어있는 아이디 입니다.');
location.href=('/seesc/member/nicCheck.jsp');
</script>
	<%
}else{
	%>
	<script>
	window.alert('<%=nicname%>는 사용가능한 닉네임 입니다.');
	opener.document.memberJoin.user_nic.value='<%=nicname%>';
	window.self.close();
	</script>
	<%
}
%>