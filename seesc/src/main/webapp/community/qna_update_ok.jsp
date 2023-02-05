<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="qnadto" class ="com.esc.write.WriteDTO" scope = "request"></jsp:useBean>
<jsp:setProperty property="*" name="qnadto"/>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>

<%
	int result = qnadao.qna_update(qnadto);

		if(result<0){
			%>
		<script>
		window.alert('수정 실패 ');
		history.back();
		</script>
		<%
		}else{
			%>
			<script>
			window.alert('수정을 완료하였습니다.');
			location.href = 'qna_list.jsp';
			</script>
			
		<%} %>
