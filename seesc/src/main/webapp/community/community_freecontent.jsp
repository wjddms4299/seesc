<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.write.*" %>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO" scope="session"></jsp:useBean>
<jsp:useBean id="wdto" class="com.esc.write.WriteDTO" scope="session"></jsp:useBean>
<%
	String idx_s=request.getParameter("idx");	
	if(idx_s==null || idx_s.equals("")){
		idx_s="0";
	}
	int idx=Integer.parseInt(idx_s);	
	
	session.setAttribute("write_idx", idx_s);
	


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


<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h3>자유게시판 본문</h3>
		<form name="update2" action="community_freecontent_update.jsp" method="post" enctype="multipart/form-data">
		<table>
		
		<%
		
		WriteDTO dto=wdao.contentWrite(idx);
		int ref=dto.getWrite_ref();
		%>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
				</tr>
				<tr>
					<th><%=dto.getWrite_idx() %></th>
					<th><%=dto.getWrite_title() %></th>
					<th><%=dto.getWrite_writer() %></th>
					<th><%=dto.getWrite_wdate() %></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><img alt="등록 이미지" src="/seesc/community/writeImg<%=dto.getWrite_filename() %>"></td>
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
						<input type="button" value="댓글작성하기" onclick="location.href='community_under.jsp?ref=<%=dto.getWrite_ref() %>&lev=<%=dto.getWrite_lev() %>&step=<%=dto.getWrite_step() %>'">						
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
		<hr>
		<fieldset>
			<legend>댓글 보이는곳</legend>
			<table>
			<tbody>
			<%
			ArrayList<WriteDTO> arr2=wdao.underList(ref);
			%>
						<%
			if(arr2==null || arr2.size()==0){
				%>
				<tr>
					<td colspan="2">등록된 댓글이 없습니다.</td>
				</tr>
				<% 
			}else{
				for(int i=0;i<arr2.size();i++){
					%>
					<tr>
						<td>
					<%
						for(int z=0;z<arr2.get(i).getWrite_lev();z++){
							out.print("&nbsp;&nbsp;");
						}
						%>
						<%=arr2.get(i).getWrite_writer() %>
						
						<%=arr2.get(i).getWrite_content() %>
						</td>
						<td><input type="button" value="삭제하기" onclick="location.href='under_del.jsp?idx=<%=arr2.get(i).getWrite_idx()%>&write_idx=<%=(String)session.getAttribute("write_idx")%>'"></td>
						<td><input type="button" value="답글하기" onclick="location.href='under_answer.jsp?ref=<%=arr2.get(i).getWrite_ref() %>&lev=<%=arr2.get(i).getWrite_lev() %>&step=<%=arr2.get(i).getWrite_step()%>&write_idx=<%=dto.getWrite_idx() %>'"></td>
						
					</tr>
					<% 
				}
			}
			%>
				</tbody>
			</table>
		</fieldset>
		</article>
		</section>
<%@include file="/footer.jsp" %>
</body>
</html>