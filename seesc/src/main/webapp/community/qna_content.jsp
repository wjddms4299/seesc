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
	location.href = 'writeQnA_List.jsp';
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
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<h2>QnA 본 문 보 기</h2>
			<table>
				<tbody>
					<tr>
						<td><%=dto.getWrite_title()%>
						<td><%=dto.getWrite_wdate()%></td>
					<tr>
						<td>작성자</td>
						<td><%=dto.getWrite_writer()%></td>
					</tr>
					<tr>
						<td>파일</td>
						<td><a href="<%=dto.getWrite_filename()%>"><%=dto.getWrite_filename()%></a></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text"
							value="<%=dto.getWrite_content()%>" readonly></td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" value="삭제"><input
							type="button" value="수정"><input type="button" value="목록"></td>
					</tr>
				
				</tbody>
					<hr>
				<tfoot>
				<tr>
				<td colspan="4">댓글</td>
				</tr>
				<tr>
				<td>댓글작성자</td><td>댓글 내용</td><td><input type ="button" value = "삭제"></td>
				<tr rowspan = "2"><td>댓글 쓰기</td><td><input type = "text" name ="write_writer"><input type = "password" name="write_pwd"></td>
				</tr>
				<tr> 
				<input type = "text" name = "write_content"> 
			</table>

		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>