<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="qnadto" class ="com.esc.write.WriteDTO"></jsp:useBean>
<jsp:setProperty property="*" name="qnadto"/>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope = "session"></jsp:useBean>
<%
int result = qnadao.writeQnAupload(qnadto);
String msg = result>0?"글쓰기 성공~": "실패 ㅠㅠㅠ";
%>

<script>
window.alert('<%=msg%>');
window.location.href = '/seesc/community/qna_list.jsp';
</script>