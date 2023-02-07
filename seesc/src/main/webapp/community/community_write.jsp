<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.write.*" %>
<jsp:useBean id="wdto" class="com.esc.write.WriteDTO"></jsp:useBean>
<jsp:useBean id="udto" class="com.esc.userinfo.UserinfoDTO"></jsp:useBean>

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
	text-align: left;	
}
#select{
	text-align:right;
}
</style>
<body>
<%@include file="/header.jsp" %>
<section>
	<h3> 자유게시판 글쓰기</h3>
	<article>
		<form name="community" action="community_write_ok.jsp" method="post" enctype="multipart/form-data">
					<input type="hidden" name="write_cate" value="free">
			<table>
					<tr>
						<th>작성자<input type="text" name="write_writer"></th>
						<th>비밀번호<input type="password" name="write_pwd"></th>
					</tr>
					<tr>
						<th colspan="2">제목<input type="text" name="write_title" size="60"></th>
					</tr>
					<tr>
						<th><input type="file" name="write_filename">
						<th><input type="checkbox" name="member" value="[멤버모집]" >멤버 모집</th>
					</tr>
					<tr>
						<th colspan="3"><textarea rows="20" cols="75" name="write_content"></textarea></th>
					</tr>
			</table>
				<div id="select">
					<input type="button" value="취소하기" onclick="location.href='community.jsp'">
					<input type="submit" value="글쓰기">
				</div>
		</form>
	</article>
	
</section>
<%@include file="/footer.jsp" %>
</body>
</html>