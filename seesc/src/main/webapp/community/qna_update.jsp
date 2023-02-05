<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.esc.write.*"%>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>
<%int user_idx = session.getAttribute("user_idx") == null || session.getAttribute("user_idx").equals("")? 0: (int) session.getAttribute("user_idx");
int manager = session.getAttribute("manager") == null || session.getAttribute("manager").equals("")? 0: (int) session.getAttribute("manager");
int write_idx= request.getParameter("write_idx")==null||request.getParameter("write_idx").equals("")?0:Integer.parseInt(request.getParameter("write_idx"));
String flag = request.getParameter("flag");
String userinput_pwd = request.getParameter("userinput_pwd");


WriteDTO dto = qnadao.writeQnAContent(write_idx);
if(dto==null||dto.equals("")){
	%><script>
		window.alert('바르지 않은 접근입니다.');
		history.back();
		</script><%
		return;
}
if(user_idx!=dto.getUser_idx()||user_idx==0){
	if (!userinput_pwd.equals(dto.getWrite_pwd())) {%>
	<script>
	window.alert('비밀번호가 일치하지 않습니다.');
	history.back();
	</script>
	<%return;
}
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
}
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<fieldset>
				<legend>게시물 수정하기</legend>
				<form name="qna_update" action="qna_update_ok.jsp" method="post">
					<input type="hidden" name="write_idx" value="<%=write_idx%>">
				<table>
					<tbody>
						<tr>
							<th>제목</th>
							<td><input type = "text" name = "write_title" value="<%=dto.getWrite_title()%>"></td>
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
							<td colspan="2"><textarea class="write_box" rows="10"
									cols="50" name="write_content"><%=dto.getWrite_content()%></textarea></td>
						</tr>
						<tr>
						<td><input type="submit" value="수정"> <input
							type="button" value="목록"
							onclick="location.href = 'qna_list.jsp';"></td>
					</tr>
					</tbody>
				</table>
				</form>
			</fieldset>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>