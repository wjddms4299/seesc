<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.userinfo.*" %>
<jsp:useBean id="udao" class="com.esc.userinfo.UserinfoDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
</head>
<body>
<%@include file="/header.jsp" %>
<%

String sid_s=(String)session.getAttribute("sid");
if(sid_s==null||sid_s.equals("")){
	sid_s="";
}

int user_idx=session.getAttribute("user_idx")==null || session.getAttribute("user_idx").equals("")?0:(Integer)session.getAttribute("user_idx");

int manager=session.getAttribute("manager")==null || session.getAttribute("manager").equals("")?0:(Integer)session.getAttribute("manager");

String nick="";
UserinfoDTO dto=udao.userInfo(sid_s);
if(dto==null){
	nick="";
}else{
	nick=dto.getUser_nic();
}



String ref_s=request.getParameter("ref");
int ref=Integer.parseInt(ref_s);
String lev_s=request.getParameter("lev");
int lev=Integer.parseInt(lev_s);
String step_s=request.getParameter("step");
int step=Integer.parseInt(step_s);
String content=request.getParameter("write_content");
%>

%>
<section>
	<article>
		<h3>답글 작성하기</h3>
		<form name="answer" action="under_answer_ok.jsp" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>답 글 달 기</legend>
				<table>
		<thead>
			<tr>
				<%
				if(sid_s==null || sid_s.equals("")){
					%>
					<th>작성자 :<input type="text" name="write_writer"></th>
					<% 
				}else{
					%>
					<th>작성자 :<input type="text" name="write_writer" readonly  value="<%=nick %>"></th>
					<%
				}
				%>
				<th>비밀번호 : <input type="password" name="write_pwd"></th>
				<th><input type="checkbox" name="write_open" value="0">비밀 글</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3">댓글 : <input type="text" name="write_content" size="60" value="RE:)<%=content %>" ></td>
				<td><input type="submit" value="댓글 등록하기">	
			</tr>
		</tbody>	
		</table>
		</fieldset>
		<input type="hidden" name="write_ref" value="<%=ref %>" >
		<input type="hidden" name="write_lev" value="<%=lev %>">
		<input type="hidden" name="write_step" value="<%=step %>">
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>