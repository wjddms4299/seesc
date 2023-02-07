<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO"></jsp:useBean>
<%
String user_name=request.getParameter("user_name");
String user_id=request.getParameter("user_id");
String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
String user_birth=year+month+day;
String user_pwd=request.getParameter("user_pwd");
String user_pwdch=request.getParameter("user_pwdch");
String msg;
if(!user_pwd.equals(user_pwdch)){
	msg="비밀번호가 일치하지않습니다.";
	%>
	<script>
	window.alert('<%=msg%>');
	location.href='/seesc/member/findPwd_ok.jsp?user_name=<%=user_name%>&user_id=<%=user_id%>&year=<%=year%>&month=<%=month%>&day=<%=day%>';
	</script>
	<%
	return;
}


int count=userdao.pwdUpdate(user_pwd, user_id);
msg=count>0?"PWD변경완료!":"변경실패!";
%>

<script>
window.alert('<%=msg%>');
location.href='/seesc/index.jsp';
</script>
}
