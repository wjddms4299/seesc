<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.esc.write.*"%>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css"/>
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
}

article table thead{
	border-bottom: 3px double dark;
	border-top: 3px double dark;
}
</style>
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
				<tr>
					<% 
					 ArrayList<WriteDTO> arr=wdao.member(listSize, cp);
					for(int i=0;i<arr.size();i++){
						if(arr==null || arr.size()==0){
							%>
							<td colspan="5">게시글이 존재하지 않습니다.</td>
							<%
						}else{
							%>
							<td><%=arr.get(i).getWrite_idx() %></td>
							<td><a href="community_freecontent.jsp?idx=<%=arr.get(i).getWrite_idx()%>"><%=arr.get(i).getWrite_title() %></a></td>
							<td><%=arr.get(i).getWrite_writer() %></td>
							<td><%=arr.get(i).getWrite_wdate() %></td>
							<td><%=arr.get(i).getWrite_readnum() %></td>
							<%
						}
					}
					%>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" align="center">
									<%
				if(userGroup!=0){
					%><a href="memberboard.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a><%
				}
				%>
				
				<%
				for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
					%>&nbsp;&nbsp;<a href="memberboard.jsp?cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;<% 
					if(i==totalPage)break;
				}
				%>
				<%
				if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
					%><a href="memberboard.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a> <%
				}
				
				%>
					<td>
				</tr>
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