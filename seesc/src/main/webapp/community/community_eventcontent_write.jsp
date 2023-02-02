<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.esc.write.*"%>
<%
String user_idx_s = (String) session.getAttribute("user_idx");

if (user_idx_s == null) {
	user_idx_s = "0";
}
int user_idx = Integer.parseInt(user_idx_s);

String manager_s = (String) session.getAttribute("manager");
if (manager_s == null) {
	manager_s = "0";
}
int write_notice = Integer.parseInt(manager_s);
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
<section>
	<article>
	<br>
		<h2>이벤트게시판 글쓰기</h2>
		<form name="community_eventcontent_write" action="community_eventcontent_write_ok.jsp" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" placeholder="작성자입력" name="write_writer" required="required"></td>
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