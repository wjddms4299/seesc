<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="comdto" class = "com.esc.write.CommentDTO"></jsp:useBean>
<jsp:setProperty property="*" name="comdto"/>
<jsp:useBean id="qnadao" class = "com.esc.write.QnADAO"></jsp:useBean>
<%
int result = qnadao.comment_write(comdto);
String msg = result>0?"성공":"실패";
%>
<script>
window.alert('<%=msg%>');
location.href = 'qna_content.jsp?write_idx=<%=comdto.getWrite_idx()%>';
</script>