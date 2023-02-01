<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.esc.write.*" %>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
</head>
<style>
section{
	width:1200px;
}
article table{
	
	width: 600px;
	border-bottom: 1px solid dark;
	border-left: 1px solid dark;
	border-right:1px solid dark;
	text-align: center;
}

article table thead{
	border-bottom: 3px double dark;
	border-top: 3px double dark;
}
</style>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>자유게시판</h2>
			<div>
				<input type="button" value="커뮤니티" onclick="location.href='community.jsp'">
				<input type="button" value="자유 게시판" onclick="location.href='freenoticeboard.jsp'">
				<input type="button" value="이벤트">
				<input type="button" value="공지사항">
				<select name="sort">
					<option value="정렬순">정렬 순
					<option value="조회수 순">조회수 순
					<option value="작성일 순">작성일 순
					<!-- 기능 구현할곳 -->
				</select>
			</div>
			<table border="1">
			<%
			ArrayList<WriteDTO> arr=wdao.freeWrite();
			%>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
					for(int i=0;i<arr.size();i++){
						if(arr==null || arr.size()==0){
							%>
							<tr>
								<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
							</tr>
							<%
						}else{
							%>
							<tr>
								<td><%=arr.get(i).getWrite_idx() %></td>
							<% 
								if(arr.get(i).getWrite_open()==0){
							%>
								<td>비밀글입니다</td>
							<%							
								}else{
							%>
								<td><%=arr.get(i).getWrite_title() %></td>
							<% 		
								}
							%>
								<td><%=arr.get(i).getWrite_writer() %></td>	
								<td><%=arr.get(i).getWrite_wdate() %></td>
								<td><%=arr.get(i).getWrite_readnum() %></td>
							</tr>
							<%
						}
					}
					%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4"><!-- 페이징 들어갈 영역 --></td>
						<td><input type="button" value="글쓰기" onclick="location.href='freenoticeboard_write.jsp'"></td>	
					</tr>
				</tfoot>
			</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>