<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.write.*" %>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO" scope="session"></jsp:useBean>
<jsp:useBean id="wdto" class="com.esc.write.WriteDTO" scope="page"></jsp:useBean>


<%
String write_idx=request.getParameter("write_idx");
int idx=Integer.parseInt(write_idx);

WriteDTO dto=wdao.contentsel(idx);
int ref=dto.getWrite_ref();

int result=wdao.contentdel(ref);


String msg=result>0?"삭제에 성공하셨습니다.":"삭제에 실패하셨습니다.";
%>
<script>
window.alert('<%=msg%>');
location.href='community.jsp';
</script>
