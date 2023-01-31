<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int idx = Integer.parseInt(request.getParameter("write_idx"));
String write_pwd = request.getParameter("write_pwd");
String inputpwd = request.getParameter("inputpwd");

if(write_pwd.equals(inputpwd)){
%>
	<script>
	location.href = 'qna_content.jsp?write_idx=<%=idx%>';
	</script>
<%}
	else{
		%>
		<script>
		window.alert('비밀번호가 일치하지 않습니다.');
		location.href = 'qna_list.jsp';
		</script>
<%
}
	
%>