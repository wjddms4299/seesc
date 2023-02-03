<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>
<%
int comm_idx=0;

if(request.getParameter("comm_idx")==null||request.getParameter("comm_idx").equals("")){
	%>
	<script>
	window.alert('잘못된 접근입니다.');
	location.href = 'qna_list.jsp';
	</script> 
<%
}else{
	comm_idx = Integer.parseInt(request.getParameter("comm_idx"));
}

if(qnadao.comment_Delete(comm_idx)<0){
%>
<script>
window.alert('삭제가 되지 않습니다.');
location.href = 'qna_content.jsp?write_idx=<%=request.getParameter("write_idx")%>';
</script>
<%
}else{

%>
<script>
location.href = 'qna_content.jsp?write_idx=<%=request.getParameter("write_idx")%>';
</script>

<%}%>