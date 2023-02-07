<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h3>답글 작성하기</h3>
		<form name="answer" action="under_answer_ok.jsp" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>답 글 달 기</legend>
				<table>
		<thead>
			<tr>
				<th>작성자 : <input type="text" name="write_writer"></th>
				<th>비밀번호 : <input type="password" name="write_pwd"></th>
				<th><input type="checkbox" name="write_open" value="0">비밀 글</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3">댓글 : <input type="text" name="write_content" size="60" ></td>
				<td><input type="submit" value="댓글 등록하기">	
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