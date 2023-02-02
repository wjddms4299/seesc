<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
h2{
   text-align: center;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
	<br>
		<h2>이벤트게시판 글쓰기</h2>
		<form name="community_eventcontent_write" action="community_eventcontent_write_ok.jsp" method="post">
		<table align="center">
			<tr>
				<th>작성자</th>
				<td><input type="text" placeholder="작성자입력" name="write_writer"></td>
				<th>비밀번호</th>
				<td><input type="password" placeholder="비밀번호입력" name="write_pwd"></td>
			</tr>
			<tr>
				<th align="left" colspan="4">파일첨부 : <input type="button" value="파일첨부"></th>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" size="58" placeholder="제목입력" name="write_title"></td>
			</tr>
			<tr>
				<td colspan="4"><textarea rows="10" cols="70" placeholder="내용입력" name="write_content"></textarea></td>
			</tr>
			</table>
			
			<div align="center"><input type="submit" value=" 등록 ">
			<input type="button" value=" 취소 " onclick="location.href='community_eventcontent_list.jsp'"></div>
		</form>
	</article>	
</section>
<br>
<%@include file="/footer.jsp" %>
</body>
</html>