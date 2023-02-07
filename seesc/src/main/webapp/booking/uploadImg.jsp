<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<jsp:useBean id="thdao" class="com.esc.thema.ThemaDAO" scope="session"></jsp:useBean>
<%
String savepath=request.getRealPath("/thema_img");
MultipartRequest mr=new MultipartRequest(request,savepath,2097152,"utf-8");

int result=thdao.imgInsert(mr);
String msg=result>0?"이미지 업로드를 완료하였습니다.":"이미지 업로드에 실패하였습니다.담당 개발자에게 문의바랍니다.";
%>
<script>
window.alert('<%=msg%>');
opener.location.reload();
window.self.close();
</script>