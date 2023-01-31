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
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
<style>
a{
text-decoration: none;
}
ul{
list-style: none;
}
.write_title{
text-align : center;
font-size : 25px;
font-weight: bold;
}
.write_table{
margin :0px auto;
} 

</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
		<article>
			<form name = "qna_upload" action ="qna_upload_ok.jsp" enctype="multipart/form-data">
				<h2 class="write_title">질문과 답변 글쓰기</h2>
				<feldset>
				<table class=" write_table ">
				<input type = "hidden" name = "user_idx" value ="<%=user_idx%>">
				<input type = "hidden" name = "write_notice" value = "<%=write_notice %>">;
					<tr>
						<th>작성자</th>
						<td><input type="text" name="write_writer"></td>
					</tr>
					<tr>
						<th>글제목</th>
						<td><input type="text" name="write_title"></td>
					</tr>
					<tr>
						<th>공개여부</th>
						<td><input type="radio" name="write_open" value="0" checked>비밀글
						<input type="radio" name="write_open" value="1">공개글</td>
					</tr>
					<tr>
						<th>파일첨부</th>
						<td><input type="file" name="write_filename"></td>
					</tr>
					<tr>
						<th>글내용</th>
						<td><textarea name="write_content" rows="10" cols="50"></textarea></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="write_pwd"></td>
					</tr>
					<tr>
						<td colspan = "2" align = "center"><input type="submit" value="등록"> <input
							type="reset" value="다시 작성"> <input type="button"
							value="목록" onclick="location.href ='/seesc/community/qna_list.jsp'"></td>
					</tr>
				</table>

			</form>
		</article>
	</section>
<%@include file="/footer.jsp" %>
</body>
</html>