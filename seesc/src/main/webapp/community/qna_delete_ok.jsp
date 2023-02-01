<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>

<%
int write_idx = Integer.parseInt(request.getParameter("write_idx"));
String write_pwd = request.getParameter("write_pwd");
String userinput_pwd = request.getParameter("userinput_pwd");

if(userinput_pwd.equals(write_pwd)){
	int result = qnadao.qna_delete(write_idx);

		if(result<0){
			%>
		<script>
		window.alert('일시적인 오류로 게시물삭제에 오류가 생겼습니다. 잠시후에 다시 시도해주세요.');
		location.href = 'qna_content.jsp?write_idx=<%=write_idx%>';
		</script>
		<% 	return;
		}else{
			%>
			<script>
			window.alert('삭제 완료하였습니다.');
			location.href = 'qna_list.jsp';
			</script>
			
			<%

		}
}else{
	%>
	<script>
	window.alert('비밀번호가 일치하지 않아 삭제할 수 없습니다.');
	location.href = 'qna_content.jsp?write_idx=<%=write_idx%>';
	</script>
	
	<%
}
%>