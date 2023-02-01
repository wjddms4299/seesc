<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="udao" class="com.esc.userinfo.UserinfoDAO"></jsp:useBean>
<%
String id=request.getParameter("id");
boolean result=udao.idCheck(id);
if(result){
	%>
<script>
window.alert('<%=id%>는 이미 가입되어있는 아이디 입니다.');
location.href=('idCheck.jsp');
</script>
	<%
}else{
	%>
	<script>
	window.alert('<%=id%>는 사용가능한 아이디 입니다.');
	opener.document.memberJoin.user_id.value='<%=id%>';
	window.self.close();
	</script>
	<%
}
%>