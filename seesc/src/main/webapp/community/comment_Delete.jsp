<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="qnadto" class ="com.esc.write.WriteDTO" scope = "request"></jsp:useBean>
<jsp:setProperty property="*" name="qnadto"/>
    <jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>