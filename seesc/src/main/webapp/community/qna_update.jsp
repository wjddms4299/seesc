<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.esc.write.*"%>

<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>
<%
String write_idx_s = request.getParameter("write_idx");
if (write_idx_s == null || write_idx_s.equals("")) {
	write_idx_s = "0";
}
int write_idx = Integer.parseInt(write_idx_s);

WriteDTO dto = qnadao.writeQnAContent(write_idx);

if (dto == null) {
%>
<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location.href = '/seesc/community/qna_list.jsp';
</script>

<%
return;
}

int open = dto.getWrite_open();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
.write_title {
	text-align: center;
	font-size: 25px;
	font-weight: bold;
}

.write_table {
	margin: 0px auto;
	width: 600px;
}
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<p class="write_title">QnA 글 수정하기</p>
			<table class="write_table">
				<form name="qna_update" action="qna_update_ok.jsp" method="post">
					<input type="hidden" name="write_idx" value="<%=write_idx%>">
					<input type="hidden" name="write_pwd"
						value="<%=dto.getWrite_pwd()%>">
				<tbody>

					<tr>
						<td colspan="2"><input type="text" name="write_title"
							value="<%=dto.getWrite_title()%>">
						<td colspan="2"><%=dto.getWrite_wdate()%></td>
					<tr>
						<td>작성자</td>
						<td colspan="3"><%=dto.getWrite_writer()%></td>
					</tr>
					<tr>
						<th>공개여부</th>

						<td><input type="radio" name="write_open" value="0"
							<%if (dto.getWrite_open() == 0) {
	out.print("checked");
}%>>비밀글
							<input type="radio" name="write_open" value="1"
							<%if (dto.getWrite_open() == 1) {
	out.print("checked");
}%>>공개글</td>
					</tr>
					<tr>
						<td>파일</td>
						<td colspan="3"><a href="<%=dto.getWrite_filename()%>"><%=dto.getWrite_filename()%></a></td>
					</tr>
					<tr>
						<td colspan="4"><textarea rows="10" cols="50"
								name="write_content"><%=dto.getWrite_content()%></textarea></td>
					</tr>


					<tr>
						<td>작성시 입력했던 비밀번호를 입력해주세요.</td>
						<td><input type="password" name="userinput_pwd"
							required="required"></td>
					</tr>
					<tr>
						<td colspan="4"><input type="submit" value="수정"> <input
							type="button" value="목록"
							onclick="location.href = 'qna_list.jsp';"></td>
					</tr>

				</tbody>
				</form>
			</table>

		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>