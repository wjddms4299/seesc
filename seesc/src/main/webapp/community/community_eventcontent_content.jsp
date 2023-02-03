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
if (dto == null) {
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
h3 {
	text-align: center;
	font-size: 30px;
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
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	
	<%sid= (String) session.getAttribute("sid");
	UserinfoDTO udto = udao.userInfo(sid); %>
	<section>
		<article>
			<h3>이벤트 본문보기</h3>
			<table>
				<tbody>
					<tr>
						<td>제목:</td>
						<td><%=dto.getWrite_title()%>
						<td>날짜:</td>
						<td><%=dto.getWrite_wdate()%></td>
					<tr>
						<td>작성자:</td>
						<td colspan="3"><%=dto.getWrite_writer()%></td>
					</tr>
					<tr>
						<td>파일이름:</td>
						<td colspan="3"><a href="<%=dto.getWrite_filename()%>"><%=dto.getWrite_filename()%></a></td>
					</tr>
					<tr>
						<td colspan="4"><textarea rows="10" cols="50"
								name="write_content" readonly><%=dto.getWrite_content()%></textarea></td>
					</tr>
				</tbody>
				<hr>
					<form name = "qna_delete" action = "community_eventcontant_delete_ok.jsp" method = "post">
					
					<input type = "hidden" name = "write_idx" value = "<%=write_idx%>">
					<input type = "hidden" name = "write_pwd" value = "<%=dto.getWrite_pwd() %>">
					</form>
					</table>
					
					
						비밀번호 <input type="password" name="userinput_pwd" required = "required">
					
					<div align="center">
						<br>
						<input type="submit" value=" 삭제 "> 
						<input type="button"value=" 수정 " onclick = "location.href = 'community_eventcontant_update.jsp?write_idx=<%=write_idx%>'">
						<input type="button" value=" 목록 "
							onclick="location.href = 'community_eventcontent_list.jsp';">
							<%if(dto.getWrite_notice()!=1){ %>
							<input type="button" value=" 답글 "
							onclick="location.href ='community_eventcontant_re.jsp?write_title=<%=dto.getWrite_title()%>&write_ref=<%=dto.getWrite_ref()%>&write_lev=<%=dto.getWrite_lev()%>&write_step=<%=dto.getWrite_step()%>'">
						
							<%} %>
						</div>

					<hr>
					</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>