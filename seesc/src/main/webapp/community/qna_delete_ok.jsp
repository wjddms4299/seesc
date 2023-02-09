<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "com.esc.write.*" %>
    <jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>

<%
int manager = session.getAttribute("manager") == null || session.getAttribute("manager").equals("")? 0: (int) session.getAttribute("manager");
String userinput_pwd = request.getParameter("userinput_pwd");
String write_idx = request.getParameter("write_idx");
String write_pwd = request.getParameter("write_pwd");
String flag = request.getParameter("flag");


if(flag!=null && flag.equals("userDelete")){
		if(qnadao.refcount(Integer.parseInt(write_idx))>0 &&manager==0){%>
			<script>
			window.alert('답글이 있어 삭제할 수 없습니다. \n 관리자에게 문의하세요.');
			history.back();
			</script>
			
		<% return;}
		if(qnadao.qna_delete(Integer.parseInt(write_idx))>0){%>
			<script>
			window.alert('삭제 완료되었습니다.');
			location.href = 'qna_list.jsp';
			</script>
		<%}else{%>
			<script>
					window.alert('삭제 실패하였습니다. 이전화면으로 돌아갑니다.');
					history.back();
			</script>
		<%
		return;
		}
}


if(userinput_pwd!=null&&userinput_pwd.equals(write_pwd)){
	if(qnadao.refcount(Integer.parseInt(write_idx))>0&& manager==0){%>
	<script>
	window.alert('답글이 있어 삭제할 수 없습니다.\n 관리자에게 문의하세요.');
	history.back();
	</script>
	
<% return;}
	
	int result = qnadao.qna_delete(Integer.parseInt(write_idx));

		if(result<0){
			%>
		<script>
		window.alert('삭제 실패하였습니다.');
		history.back();
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
	history.back();
	</script>
	
	<%
}
%>