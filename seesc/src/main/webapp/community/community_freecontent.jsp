<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.write.*" %>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<%
	String idx_s=request.getParameter("idx");
	int idx=Integer.parseInt(idx_s);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h3{
 text-align: center;
}
</style>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h3>자유게시판 본문</h3>
		<form name="update2" action="community_freecontent_update.jsp" method="get">
		<table>
		<%
		WriteDTO dto=wdao.contentWrite(idx);
		%>
			<thead>
				<tr>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
				</tr>
				<tr>
					<th><%=dto.getWrite_title() %></th>
					<th><%=dto.getWrite_writer() %></th>
					<th><%=dto.getWrite_wdate() %></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4"><textarea cols="50" rows="20" readonly><%=dto.getWrite_content() %></textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="right">
					<input type="hidden" name="idx" value="<%=dto.getWrite_idx() %>">
						<input type="submit" value="수정하기">
						<input type="button" value="목록으로" onclick="location.href='community.jsp'">
						
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>