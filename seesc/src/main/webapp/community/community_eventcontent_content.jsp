<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.esc.write.*"%>
<%@page import ="com.esc.userinfo.*" %>
<jsp:useBean id="idao" class="com.esc.write.ImgDAO" scope="session"></jsp:useBean>
<jsp:useBean id="udao" class="com.esc.userinfo.UserinfoDAO" scope = "session"></jsp:useBean>
<%
int user_idx = session.getAttribute("user_idx")==null||session.getAttribute("user_idx").equals("")?0:(int)session.getAttribute("user_idx");
int manager = session.getAttribute("manager")==null||session.getAttribute("manager").equals("")?0:(int)session.getAttribute("manager");
String write_idx_s = request.getParameter("write_idx");
if (write_idx_s == null || write_idx_s.equals("")) {
	write_idx_s = "0";
}
int write_idx=Integer.parseInt(write_idx_s);
WriteDTO dto = idao.writeEventContent(write_idx);
if (dto == null || dto.equals("")) {
%>
<script>
	window.alert('삭제된 게시글 입니다.');
	location.href='/seesc/community/community_eventcontent_list.jsp';
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
h2 {
	text-align: center;
	font-size: 30px;
}
section img{
   width:250px;
   height:250px;
}
table {
	width: 660px;
	margin: 0px auto;
}
article{
	width: 660px;
	margin: 0px auto;
}
ul {
	list-style: none;
}
li {
	liste-style: none;
}
th {
	float:left;
}
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	
	<%sid= (String) session.getAttribute("sid");
	UserinfoDTO udto = udao.userInfo(sid); %>
	<section>
		<article>
			<h2>이벤트 본문보기</h2>
			<table>
				<tbody>
					<tr>
						<th>제목:</th>
						<td><%=dto.getWrite_title()%>
						<th>날짜:</th>
						<td><%=dto.getWrite_wdate()%></td>
					<tr>
						<th>작성자:</th>
						<td><%=dto.getWrite_writer()%></td>
						<th>조회수:</th>
						<td><%=dto.getWrite_readnum() %></td>
					</tr>
					<tr>
						<th>파일이름:</th>
						<%
						if (dto.getWrite_filename() != null) {
						%>
						<td colspan="3"><a href="/seesc/community/img/<%=dto.getWrite_filename()%>"
							target="_blank"><%=dto.getWrite_filename()%></a></td>
					</tr>
					<tr>
						<td colspan="4" align="center">
						<img src="/seesc/community/img/<%=dto.getWrite_filename()%>"></td>
						<%
						} else {
						%><td colspan="4">파일 없음</td>
						<%
						}
						%>
					</tr>
					<tr>
						<td colspan="4"><textarea rows="10" cols="90"
								name="write_content" readonly><%=dto.getWrite_content()%></textarea></td>
					</tr>
					</tbody>
			  		 </table>
			  		<%
					if (dto.getWrite_notice()==1 && manager!=1) {%>
						<tr>
						<td colspan="4">
							<input type="button" value="목록으로 돌아가기" onclick="location.href = 'community_eventcontent_list.jsp'">
						</td>
					</tr>
					<% }else if(manager==1 || user_idx == dto.getUser_idx()&&user_idx!=0){%>
					<tr>
					<td colspan="4">
						<form name ="com" action = "community_eventcontent_re.jsp" method = "post">
						<input type = "hidden" name = "write_title" value = "<%=dto.getWrite_title()%>">
						<input type = "hidden" name = "write_lev" value = "<%=dto.getWrite_lev()%>">
						<input type = "hidden" name = "write_step" value = "<%=dto.getWrite_step()%>">
						<input type="button" value="삭제" onclick ="location.href ='community_eventcontent_delete_ok.jsp?flag=uDelete&write_idx=<%=write_idx%>'">
						<input type="button" value="수정" onclick="location.href = 'community_eventcontent_update.jsp?flag=uUpdate&write_idx=<%=write_idx%>'">
						<input type="button" value="목록" onclick="location.href = 'community_eventcontent_list.jsp'">
						<input type = "submit" value = "답글">
						</form>
					</td>
				</tr>
					<%}else {%>
					<tr>
						<td td colspan="4">
							<form name="wdu" method="post">
							<input type = "hidden" name = "write_title" value = "<%=dto.getWrite_title()%>">
							<input type = "hidden" name = "write_lev" value = "<%=dto.getWrite_lev()%>">
							<input type = "hidden" name = "write_step" value = "<%=dto.getWrite_step()%>">
							<input type="hidden" name="write_idx" value="<%=write_idx%>">
							<input type="hidden" name="write_pwd" value="<%=dto.getWrite_pwd()%>"> 
							글을 삭제 또는 수정을 원하시면 비밀번호를 입력해주세요.<br>
							<input type="password" name="userinput_pwd" required>
							<input type="submit" value="삭제" onclick="javascript:qna_wdu.action='qna_delete_ok.jsp';">
							<input type="submit" value="수정" onclick="javascript:qna_wdu.action='qna_update.jsp';">
							<input type="button" value="목록" onclick="location.href = 'qna_list.jsp'">
							<input type="submit" value="답글"onclick="javascript:qna_wdu.action='qna_repWrite.jsp';">
							</form>
						</td>
					</tr>
				<%} %>
			</tbody>
			</table>
		</fieldset>
		</article>
					
					
					
		
				
					<div align="center">
						<br>
						<input type="submit" value=" 삭제 "> 
						<input type="button"value=" 수정 " onclick = "location.href = 'community_eventcontent_update.jsp?write_idx=<%=write_idx%>'">
						<input type="button" value=" 목록 "
							onclick="location.href = 'community_eventcontent_list.jsp';">
							<input type="button" value=" 댓글 " onclick="location.href ='community_eventcontant_re.jsp?write_title=<%=dto.getWrite_title()%>&write_ref=<%=dto.getWrite_ref()%>&write_lev=<%=dto.getWrite_lev()%>&write_step=<%=dto.getWrite_step()%>'">
							<%
							}
							%>
						</div>
					</form>
					<hr>
					</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>