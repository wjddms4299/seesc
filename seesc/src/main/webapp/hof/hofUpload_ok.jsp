<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.oreilly.servlet.*" %>
<jsp:useBean id="hofdao" class="com.esc.hof.HofDAO" scope="session"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String savepath=request.getRealPath("/write/hofimg");
MultipartRequest mr=new MultipartRequest(request,savepath,2097152,"utf-8");
int result=hofdao.addRecord(mr);
String msg=result>0?"기록 업로드 성공!":"기록 업로드 실패!";
%>
<script>
window.alert('<%=msg%>');
opener.location.reload();
window.self.close();
</script>