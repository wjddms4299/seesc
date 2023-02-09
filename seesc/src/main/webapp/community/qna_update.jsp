<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.esc.write.*"%>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>
<%
int user_idx = session.getAttribute("user_idx") == null || session.getAttribute("user_idx").equals("")
		? 0
		: (int) session.getAttribute("user_idx");
int manager = session.getAttribute("manager") == null || session.getAttribute("manager").equals("")
		? 0
		: (int) session.getAttribute("manager");
int write_idx = request.getParameter("write_idx") == null || request.getParameter("write_idx").equals("")
		? 0
		: Integer.parseInt(request.getParameter("write_idx"));

String flag = request.getParameter("flag");

WriteDTO dto = qnadao.writeQnAContent(write_idx);
if (dto == null || dto.equals("")) {
%><script>
		window.alert('바르지 않은 접근입니다.');
		history.back();
	</script>
<%
return;
}
  
if (manager==0&&user_idx != dto.getUser_idx() || user_idx == 0) {
String userinput_pwd = request.getParameter("userinput_pwd");
	if (!userinput_pwd.equals(dto.getWrite_pwd())) {
%>
<script>
	window.alert('비밀번호가 일치하지 않습니다.');
	history.back();
</script>
<%
return;
}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="/seesc/css/write.css">
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<br>
			<br>
			<br>
			<h1 class="h1">게시물 수정하기</h1>
			<br>
			<hr width="130px">
			<br>
			<br>
			<form name="qna_update" action="qna_update_ok.jsp" method="post">
					<input type="hidden" name="write_idx" value="<%=write_idx%>">
			<table>
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" name="write_title"
							value="<%=dto.getWrite_title()%>" maxlength="50"
								required="required"placeholder="제목 50자이내로 작성"></td>
					</tr>
					<tr>
						<th>공개여부</th>
						<td><input type="radio" name="write_open" value="0" checked>비밀글
							<input type="radio" name="write_open" value="1">공개글</td>
					</tr>
					<tr>
						<th>작성시간</th>
						<td><%=dto.getWrite_wdate()%></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%=dto.getWrite_writer()%></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><a
							href="/seesc/community/userFile/<%=dto.getWrite_filename()%>"
							target="_blank"> <%
 out.println(dto.getWrite_filename() != null ? dto.getWrite_filename() + "</a>" : "</a>첨부된 파일 없음");
 %></a></td>
					</tr>
					<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="50" name="write_content" maxlength="3000"
									required="required" placeholder="내용 3000자 이내로 작성"><%=dto.getWrite_content()%></textarea></td>
					</tr>
				</tbody>
					<tfoot class = "tfoot">
						<tr><td colspan="2">&nbsp;</td></tr>
					<tr>
						<td colspan = "2" style = "text-align : center;"><input type="submit" value="수 정">
						<input type="reset" value="다시 작성"><input type="button" value="취소"
							onclick="history.back();"></td>
					</tr>
					
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					</tfoot>
			</table>
			</form>

		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>