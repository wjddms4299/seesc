<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="qnadto" class ="com.esc.write.WriteDTO" scope = "request"></jsp:useBean>
<jsp:setProperty property="*" name="qnadto"/>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>

<%

String userinput_pwd = request.getParameter("userinput_pwd");
if(userinput_pwd.equals(qnadto.getWrite_pwd())){
	int result = qnadao.qna_update(qnadto);

		if(result<0){
			%>
		<script>
		window.alert('일시적인 오류로 게시물삭제에 오류가 생겼습니다. 잠시후에 다시 시도해주세요.');
		location.href = 'qna_content.jsp?write_idx=<%=qnadto.getWrite_idx()%>';
		</script>
		<% 	return;
		}else{
			%>
			<script>
			window.alert('수정을 완료하였습니다.');
			location.href = 'qna_list.jsp';
			</script>
			
			<%

		}
}else{
	%>
	<script>
	window.alert('비밀번호가 일치하지 않습니다.다시 입력해주세요.');
	location.href = 'qna_update.jsp?write_idx=<%=qnadto.getWrite_idx()%>';
	</script>
	
	<%
}
%>