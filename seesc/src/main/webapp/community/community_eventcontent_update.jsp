<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.esc.write.*"%>

<jsp:useBean id="idao" class="com.esc.write.ImgDAO" scope="session"></jsp:useBean>
<%
String write_idx_s = request.getParameter("write_idx");
if (write_idx_s == null || write_idx_s.equals("")) {
	write_idx_s = "0";
}
int write_idx = Integer.parseInt(write_idx_s);

WriteDTO dto = idao.writeEventContent(write_idx);

if (dto == null) {
%>
<script>
	window.alert('없는 게시글 입니다.');
	location.href='/seesc/community/community_eventcontent_list.jsp';
</script>

<%
return;
}

int open=dto.getWrite_open();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
h2 {
	text-align: center;
	font-size: 30px;
}

table {
	width: 660px;
	margin: 0px auto;
}
th {
	text-align:left;
}
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<h2>이벤트글 수정하기</h2>
			<table>
				<form name="community_eventcontent_update.jsp" action="community_eventcontent_update_ok.jsp" method="post">
					<input type="hidden" name="write_idx" value="<%=write_idx%>">
					<input type="hidden" name="write_pwd"
						value="<%=dto.getWrite_pwd()%>">
				<tbody>
					<tr>
						<th>제목:</th>
						<td><input type="text" name="write_title"
							value="<%=dto.getWrite_title()%>">
						<th>날짜:</th>
						<td><%=dto.getWrite_wdate()%></td>
					<tr>
						<th>작성자:</th>
						<td colspan="3"><%=dto.getWrite_writer()%></td>
					</tr>
					<tr>
						<th>공개여부:</th>
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
						<th>파일:</th>
						<td colspan="3"><a href="<%=dto.getWrite_filename()%>"><%=dto.getWrite_filename()%></a></td>
					</tr>
					<tr>
						<td colspan="4"><textarea rows="10" cols="90"
								name="write_content"><%=dto.getWrite_content()%></textarea></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="userinput_pwd"
							required="required"></td>
						<td colspan="2"><input type="submit" value="수정"> 
						<input type="button" value="목록" onclick="location.href = 'community_eventcontent_list.jsp';"></td>
					</tr>
				</tbody>
				</form>
			</table>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>