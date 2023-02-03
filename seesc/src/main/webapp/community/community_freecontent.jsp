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
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
h3{
 text-align: center;
}
h4{
	text-align: center;
}
</style>
</head>

<%
int totalCnt=wdao.getTotalCnt();//DB로 부터 가져올 정보
int listSize=5;//사용자 마음
int pageSize=5;//사용자 마음

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);//핵심요소 사용자로부터 가져와야하는 정보

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h3>자유게시판 본문</h3>
		<form name="update2" action="community_freecontent_update.jsp" method="post" enctype="multipart/form-data">
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
					<td><img alt="등록 이미지" src="/seesc/img/<%=dto.getWrite_filename() %>"></td>
				</tr>
				<tr>
					<td colspan="4"><textarea cols="50" rows="20" readonly><%=dto.getWrite_content() %></textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="right">
						<input type="hidden" name="idx" value="<%=dto.getWrite_idx()%>">
						<input type="submit" value="수정하기">
						<input type="button" value="목록으로" onclick="location.href='community.jsp'">
						<input type="button" value="삭제하기" onclick="location.href='community_del.jsp?idx=<%=dto.getWrite_idx() %>'">
								
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
		<hr>
		<form name="underwrite" action="community+freecontent_ok2.jsp">
		<h4>댓글 달기</h4>
			<table>
		<thead>
			<tr>
				<th>작성자 : <input type="text" name="write_writer"></th>
				<th>비밀번호 : <input type="password" name="write_pwd"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">댓글 : <input type="text" name="write_content" size="60" ></td>
				<td><input type="submit" value="댓글 등록하기"></td>	
			</tr>
		</tbody>	
		</table>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>