<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css"/>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>커뮤니티</h2>
		<div>
		<input type="button" value="자유게시판" onclick="location.href='community.jsp'">
		<input type="button" value="멤버모집" onclick="location.href='memberboard.jsp'">
		<select>
			<option value="0">정렬순</option>
			<option value="1">조회수 순</option> 
			<option value="2">작성일 순</option>
		</select>
		</div>
		<table>
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
			<!-- 멤버모집 게시글만 보여주는창 -->
			
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5"><input type="button" value="글쓰기" onclick="location.href='community_write.jsp'"></td>
				</tr>
			</tfoot>
		</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>