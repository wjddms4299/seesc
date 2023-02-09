<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

int write_idx = request.getParameter("write_idx")==null||request.getParameter("write_idx").equals("")?0:Integer.parseInt(request.getParameter("write_idx"));

if(request.getParameter("write_pwd")!=null&&!request.getParameter("write_pwd").equals("")&&request.getParameter("inputpwd")!=null&&!request.getParameter("inputpwd").equals("")){
	String write_pwd = request.getParameter("write_pwd");
	String inputpwd = request.getParameter("inputpwd");
	
	if(write_pwd.equals(inputpwd)){
		
%>
	<script>
	location.href = 'qna_content.jsp?write_idx=<%=write_idx%>';
	</script>
<%}else{
		%>
		<script>
		window.alert('비밀번호가 일치하지 않습니다.');
		location.href = 'qna_list.jsp';
		</script>
<%
	}
	
}else{%>
	<script>
	window.alert('비밀번호를 입력하지 않았거나 잘못된 접근입니다.');
	history.back();
	</script>
<%
}
%>