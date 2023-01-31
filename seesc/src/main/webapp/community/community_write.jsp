<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.write.*" %>
<jsp:useBean id="wdto" class="com.esc.write.WriteDTO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table{
	margin:0px auto;
}
textarea{
	text-align: center;	
}
#select{
	text-align:right;
}
</style>
<body>
<%@include file="/header.jsp" %>
<section>
	<h3>글쓰기</h3>
	<article>
		<form name="community" action="community_write_ok.jsp" method="get">
			<table>
					<tr>
						<th>작성자<input type="text" name="write_writer"></th>
						<th>카테고리
						<select name="write_cate">	
							<option  value="자유게시판">자유게시판</option>
							<option  value="이벤트">이벤트</option>
						</select>
						</th>
						<th>비밀번호<input type="password" name="write_pwd"></th>
					</tr>
					<tr>
						<th>제목<input type="text" name="write_title" ></th>
						<th><input type="radio"  name="write_open" value="0">비밀글</th>
						<th><input type="radio" name="write_open" value="1">공개글</th>
					</tr>
					<tr>
						<th colspan="3"><textarea rows="20" cols="75" name="write_content"> </textarea></th>
					</tr>
			</table>
				<div id="select">
					<input type="button" value="취소하기" onclick="location.href='community.jsp'">
					<input type="submit" value="글쓰기" onclick="location.href='community_write.jsp'">
				</div>
		</form>
	</article>
	
</section>
<%@include file="/footer.jsp" %>
</body>
</html>