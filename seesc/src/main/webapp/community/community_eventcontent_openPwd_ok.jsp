<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int write_idx = Integer.parseInt(request.getParameter("write_idx"));
String write_pwd = request.getParameter("write_pwd");
String ipwd = request.getParameter("ipwd");

if(write_pwd.equals(ipwd)){
%>
<script>
location.href = 'community_eventcontent_content.jsp?write_idx=<%=write_idx%>';
</script>
<%}
else{
%>
<script>
window.alert('비밀번호가 틀렸습니다!.');
location.href = 'community_eventcontent_list.jsp';
</script>
<%
}%>