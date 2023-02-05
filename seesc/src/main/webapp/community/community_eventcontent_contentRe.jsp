<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="comdto" class = "com.esc.write.CommentDTO"></jsp:useBean>
<jsp:setProperty property="*" name="comdto"/>
<jsp:useBean id="idao" class = "com.esc.write.ImgDAO"></jsp:useBean>
<%
int result = idao.comment_write(comdto);

%>
<script>
location.href = 'community_eventcontent_content.jsp?write_idx=<%=comdto.getWrite_idx()%>';
</script>