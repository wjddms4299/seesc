<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.write.*" %>
<%@ page import="com.esc.userinfo.*" %>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<jsp:useBean id="udao" class="com.esc.userinfo.UserinfoDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css" href="/seesc/css/mainLayout.css">
</head>
<body>
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

String write_idx=request.getParameter("write_idx");

%>
<%@include file="/header.jsp" %>
<section>
	<article>
			<h3>댓글 수정하기</h3>
		<form name="answer" action="under_answer_ok.jsp" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend><a id="red">답 글 달 기</a></legend>
				<table>
		<thead>
			<tr>
				<%
				if(sid_s==null || sid_s.equals("")){
					%>
					<th>작성자 :<input type="text" name="write_writer" class="writer"></th>
					<% 
				}else{
					%>
					<th>작성자 :<input type="text" name="write_writer" readonly  value="<%=nick %>" class="writer"></th>
					<%
				}
				%>
				<th>비밀번호 : <input type="password" name="write_pwd" class="writer"></th>
				<th colspan="2"><input type="checkbox" name="write_open" value="0">비밀 글</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3">댓글 : <input type="text" name="write_content" size="60" class="textarea"></td><!--  value="RE:)"--> 
				<td><input type="submit" value="댓글 등록하기" class="writedel">
					<input type="button" value="돌아가기" class="writedel" onclick="location.href='community_freecontent.jsp?idx=<%=write_idx%>'">
				</td>	
			</tr>
		</tbody>	
		</table>
		</fieldset>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>