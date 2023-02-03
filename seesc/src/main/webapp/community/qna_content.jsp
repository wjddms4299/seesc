<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.esc.write.*"%>
<%@page import="com.esc.userinfo.*"%>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>
<jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO"
	scope="session"></jsp:useBean>
<%
int user_idx = session.getAttribute("user_idx") == null || session.getAttribute("user_idx").equals("")
		? 0
		: (int) session.getAttribute("user_idx");
int manager = session.getAttribute("manager") == null || session.getAttribute("manager").equals("")
		? 0
		: (int) session.getAttribute("manager");

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

article {
	margin: 0px auto;
	width: 600px;
}

ul, li {
	list-style: none;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<%@include file="/header.jsp"%>

	<%
	sid = (String) session.getAttribute("sid");
	UserinfoDTO udto = userdao.userInfo(sid);
	%>
	<section>
		<article>
			<p class="write_title">QnA 본 문 보 기</p>
			<table class="write_table">
				<tbody>
					<tr>
						<td colspan="2"><%=dto.getWrite_title()%>
						<td colspan="2"><%=dto.getWrite_wdate()%></td>
					<tr>
						<td>작성자</td>
						<td colspan="3"><%=dto.getWrite_writer()%></td>
					</tr>
					<tr>
						<td>첨부파일</td>
					<%if(dto.getWrite_filename()!=null){ %>
						<td colspan="3"><a href="/seesc/community/userFile/<%=dto.getWrite_filename()%>" target = "_blank"><%=dto.getWrite_filename()%></a></td>
					</tr>
					<tr><td><img src="/seesc/community/userFile/<%=dto.getWrite_filename()%>"></td>
					<%}else{
						%><td>첨부된 파일 없음</td>
					<%} %>
					</tr>
					<tr>
						<td colspan="4"><textarea rows="10" cols="50"
								name="write_content" readonly><%=dto.getWrite_content()%></textarea></td>
					</tr>
				</tbody>
								</table>
		<%if (dto.getWrite_notice() != 1) {%>
				<hr>
				<form name="qna_delete" action="qna_delete_ok.jsp" method="post">
					<ul>
						<li><input type="hidden" name="write_idx"
							value="<%=write_idx%>"> <input type="hidden"
							name="write_pwd" value="<%=dto.getWrite_pwd()%>">

			글을 삭제할 경우 비밀번호를 입력해주세요.
			</li>
			<li><input type="password" name="userinput_pwd"
				required="required"></li>
			</ul>

			<div>

				<input type="submit" value="삭제"> <input type="button"
					value="수정"
					onclick="location.href = 'qna_update.jsp?write_idx=<%=write_idx%>'">
				<input type="button" value="목록"
					onclick="location.href = 'qna_list.jsp';">
				
				<input type="button" value="답글"
					onclick="location.href =
							'qna_repWrite.jsp?write_title=<%=dto.getWrite_title()%>&write_ref=<%=dto.getWrite_ref()%>&write_lev=<%=dto.getWrite_lev()%>&write_step=<%=dto.getWrite_step()%>'">

				<%
				}
				%>
			</div>
			
			</form>
			<hr>
		</article>
		<article>
			<ul>
				<li><label>댓글</label></li>
				<li><label>댓글작성자 댓글내용 <a href="#">&#10060;</a></label></li>

				<hr>
				<form name = "comment" action = "comment_ok.jsp" method = "post">
				<li><label>댓글 쓰기</label> <input type="text" name="comm_writer"
					placeholder="작성자"> <input type="password" name="comm_pwd"
					placeholder="비밀번호"></li>
				<li><textarea rows="10" cols="50" name="comm_content"
						placeholder="내용을 작성해주세요"></textarea> <input type="submit"
					value="등록" ></li>
				</form>
			</ul>

		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>