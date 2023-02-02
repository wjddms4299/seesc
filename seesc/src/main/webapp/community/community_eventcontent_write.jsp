<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.esc.write.*"%>
<%@page import ="com.esc.userinfo.*" %>
<jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO" scope = "session"></jsp:useBean>
<%
int user_idx = session.getAttribute("user_idx")==null||session.getAttribute("user_idx").equals("")?0:(int)session.getAttribute("user_idx");
int manager = session.getAttribute("manager")==null||session.getAttribute("manager").equals("")?0:(int)session.getAttribute("manager");
int write_notice = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
h2{
   text-align: center;
}
section{
	width:1200px;

}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<%
sid= (String) session.getAttribute("sid");
UserinfoDTO dto = userdao.userInfo(sid);
%>
<section>
	<article>
	<br>
		<h2>이벤트게시판 글쓰기</h2>
		<form name="community_eventcontent_write" action="community_eventcontent_write_ok.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="user_idx" value="<%=user_idx%>">
		<input type="hidden" name="write_notice" value="<%=write_notice%>">
							
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="write_writer"
								required="required" value="<%
								String value = user_idx==0?"":dto.getUser_nic();
								out.println(value);
								%>"
								<%
								String readonly =user_idx==0?"":"readonly";
								out.println(readonly);
								%>"
								></td>
				<th>비밀번호</th>
				<td><input type="password" placeholder="비밀번호입력" name="write_pwd" required="required"></td>
			</tr>
			<tr>
				<th align="left" colspan="2">파일첨부 : <input type="file" value="파일첨부"></th>
				<th>공개여부</th>
				<td><input type="radio" name="write_open" value="0" checked>비밀글
				<input type="radio" name="write_open" value="1">공개글</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" size="58" placeholder="제목입력" name="write_title" required="required"></td>
			</tr>
			<tr>
				<td colspan="4"><textarea rows="10" cols="70" placeholder="내용입력" name="write_content" required="required"></textarea></td>
			</tr>
			</table>
			
			<div align="center"><input type="submit" value=" 등록 ">
			<input type="button" value=" 취소 " onclick="location.href='community_eventcontent_list.jsp'"></div>
		</form>
		<br>
	</article>	
</section>
<%@include file="/footer.jsp" %>
</body>
</html>