<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="wdto" class ="com.esc.write.WriteDTO" scope = "request"></jsp:useBean>
<jsp:setProperty property="*" name="wdto"/>
    <jsp:useBean id="idao" class="com.esc.write.ImgDAO" scope="session"></jsp:useBean>

<%
String userinput_pwd = request.getParameter("userinput_pwd");

if(userinput_pwd.equals(wdto.getWrite_pwd())){
	int result = idao.event_delete(wdto.getWrite_idx());

		if(result<0){
			%>
		<script>
		window.alert('잠시후에 다시 시도해주세요.');
		location.href = 'community_eventcontent_content.jsp?write_idx=<%=wdto.getWrite_idx()%>';
		</script>
		<% 	
		return;
		}else{
			%>
			<script>
			window.alert('삭제 완료.');
			location.href = 'community_eventcontent_list.jsp';
			</script>
			
			<%

		}
}else{
	%>
	<script>
	window.alert('비밀번호가 틀립니다.');
	location.href = 'community_eventcontent_content.jsp?write_idx=<%=wdto.getWrite_idx()%>';
	</script>
	
	<%
}
%>