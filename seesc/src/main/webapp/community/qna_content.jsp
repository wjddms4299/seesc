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

int open = dto.getWrite_open() ;

if (dto == null) {
%>
<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location.href = '/seesc/community/qna_list.jsp';
</script>
<%
return;
}
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
	border: 1px solid;
}

</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<p class="write_title">QnA 본 문 보 기</p>
			<table class="write_table">
				<tbody>
					<tr>
						<td colspan="2"><%=dto.getWrite_title()%> <td colspan="2">
					<%=dto.getWrite_wdate()%></td><tr>
						<td>작성자</td>
						<td colspan="3"><%=dto.getWrite_writer()%></td>
					</tr>
					<tr>
						<td>파일</td>
						<td colspan="3"><a href="<%=dto.getWrite_filename()%>"><%=dto.getWrite_filename()%></a></td>
					</tr>
					<tr>
						<td colspan="4"><textarea rows="10" cols="50"
								name="write_content" readonly><%=dto.getWrite_content()%></textarea></td>
					</tr>
					<tr>
						<td colspan="4"><input type="button" value="삭제"><input
							type="button" value="수정"><input type="button" value="목록"
							onclick="location.href = 'qna_list.jsp';"></td>
					</tr>

				</tbody>
			</table>
			<table class="write_table">
				<tfoot>
					<tr>
						<td colspan="4">댓글</td>
					</tr>
					<tr>
						<td>댓글작성자</td>
						<td colspan="2">댓글 내용</td>
						<td><input type="button" value="삭제"></td>
					<tr>
						<td rowspan="2">댓글 쓰기</td>
						<td><input type="text" name="write_writer" placeholder="작성자">
							<input type="password" name="write_pwd" placeholder="비밀번호"></td>
						<td rowspan="2"><input type="button" value="등록"></td>
					</tr>
					<tr>
						<td colspan="4"><textarea rows="10" cols="50"
								name="write_content" placeholder="내용을 작성해주세요"></textarea>
					</tr>
				</tfoot>
			</table>

		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>