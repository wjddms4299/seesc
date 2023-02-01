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
		<h3>수정하기</h3>
		<form name="writeupdate" action="community_eventcontent_update_ok.jsp" method="get">
		<table>
		<%
		WriteDTO dto=wdao.contentWrite(idx);
		%>
			<thead>
				<tr>
					<th>제목</th>
				</tr>
				<tr>
					<th><input type="text" name="title" value="<%=dto.getWrite_title()%>"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><textarea cols="50" rows="20" name="content" ></textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td>
						<input type="submit" value="수정하기">
						<input type="reset" value="다시쓰기">
						<input type="button" value="돌아가기" onclick="location.href='community_eventcontent.jsp'">
					</td>
				</tr>
			</tfoot>
		</table>
			<input type="hidden" name="idx" value="<%=idx %>">
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>