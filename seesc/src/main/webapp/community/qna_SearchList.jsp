<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.esc.write.*"%>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
a {
	text-decoration: none;
}

ul {
	list-style: none;
}

.write_title {
	text-align: center;
	font-size: 25px;
	font-weight: bold;
}

.write_table {
	margin: 0px auto;
	width: 600px;
}
</style>

</head>
<%

String serchList= request.getParameter("listname");
String content = request.getParameter("search_Content");

int totalqna = qnadao.getTotal_SearchList(serchList, content);
if(totalqna == 0){
	totalqna = 1;
}
String writeList_s = request.getParameter("listSize");
if (writeList_s == null || writeList_s.equals("")) {
	writeList_s = "10";
}
int writeList = Integer.parseInt(writeList_s);

int pageList = 5;

String userpage_s = request.getParameter("userpage");
if(userpage_s==null||userpage_s.equals("")){
	userpage_s = "1";
}
int userpage = Integer.parseInt(userpage_s);

int totalpage = totalqna/writeList+1;
if(totalqna%writeList==0){
	totalpage --;
}
int pagegroup = userpage/pageList;
if(userpage%pageList == 0){
	pagegroup --;
}


%>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<p class="write_title">
				질문과 답변
			</p>
			<table class="write_table">
				<thead>
					<tr>
						<td align="left">검색결과 : <%=qnadao.getTotal_SearchList(serchList, content)%>개
			
						</td>
						<td colspan="3" align="left">검색 내용: <%=content %>			
						<input type = "button" value = "검색 취소" onclick = "location.href = 'qna_list.jsp'">
						</td>
						<td align="right"><select name="writeList"
							onChange="window.location.href=this.value">
								<option>리스트수</option>
								<option value="qna_SearchList.jsp?listSize=5&listname=<%=serchList%>&search_Content=<%=content%>">5개씩</option>
								<option value="qna_SearchList.jsp?listSize=10&listname=<%=serchList%>&search_Content=<%=content%>">10개씩</option>
								<option value="qna_SearchList.jsp?listSize=15&listname=<%=serchList%>&search_Content=<%=content%>">15개씩</option>
								<option value="qna_SearchList.jsp?listSize=30&listname=<%=serchList%>&search_Content=<%=content%>">30개씩</option>

						</select></td>

					</tr>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록자</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
					ArrayList<WriteDTO> arr = qnadao.writeQnA_ReList(userpage, writeList, serchList, content);
					if (arr == null || arr.size() == 0) {
					%>
					<tr>
						<td colspan="5">등록된 게시글이 없습니다.</td>
					</tr>
					<%
					} else {
					for (int i = 0; i < arr.size(); i++) {
					%>
					<tr>
						<td><%=arr.get(i).getWrite_idx()%></td>
						<td><%if(arr.get(i).getWrite_open()==0){ %>
						<form name = "rr" method = "post">
						<a
							href="qnaOpen_pwd.jsp?write_pwd=<%=arr.get(i).getWrite_pwd()%>&write_idx=<%=arr.get(i).getWrite_idx()%> "
							class="anono"><%=arr.get(i).getWrite_title()%>[비밀글]
							<%}else{%>
							<a
							href="qna_content.jsp?write_idx=<%=arr.get(i).getWrite_idx()%>"
							class="anono">
								<%=arr.get(i).getWrite_title()%>
							<%} %></a>
												</form>
						<td><%=arr.get(i).getWrite_writer()%></td>
						<td><%=arr.get(i).getWrite_wdate()%></td>
						<td><%=arr.get(i).getWrite_readnum()%></td>
					</tr>

					<%
					}
					}
					%>
				</tbody>
				<tfoot>
				<form name = "reList" action="qna_SearchList.jsp">
					<tr>
						<td colspan="4" align="center"><select name= "listname">
								<option value ="0">제목+내용</option>
								<option value="1">글제목</option>
								<option value="2">내용</option>
								<option value="3">작성자</option>
						</select> <input type="text" name="search_Content" placeholder="내용입력" required = "required"> <input
							type="submit" value="검색" ></td>
						<td><input type="button" value="글작성"
							onclick="location.href ='qna_upload.jsp'"></td>
					<tr>
					</form>
					<tr>
						<td colspan="5" align="center">
						<%if(pagegroup!=0){
							%><a href = "qna_SearchList.jsp?userpage=<%=1 %>&listSize=<%=writeList%>&listname=<%=serchList%>&search_Content=<%=content%>">&lt;&lt;</a>
							<a href = "qna_SearchList.jsp?userpage=<%=(pagegroup-1)*pageList+pageList%>&listSize=<%=writeList%>&listname=<%=serchList%>&search_Content=<%=content%>">이전</a>
							<%} 	
						
						
							for(int i=pagegroup*pageList+1;i<=pagegroup*pageList+pageList;i++){
								%>
								&nbsp;&nbsp;<a href ="qna_SearchList.jsp?userpage=<%=i%>&listSize=<%=writeList%>&listname=<%=serchList%>&search_Content=<%=content%>"><%=i%></a>&nbsp;&nbsp;
								
								<%
							if(i==totalpage)break;
							}
							
							if(pagegroup!=(totalpage/pageList-(totalpage%pageList==0?1:0))){
								%>
								<a href = "qna_SearchList.jsp?userpage=<%=(pagegroup+1)*pageList+1 %>&listSize=<%=writeList%>&listname=<%=serchList%>&search_Content=<%=content%>">다음</a>
								&nbsp;<a href = "qna_SearchList.jsp?userpage=<%=totalpage%>&listSize=<%=writeList%>&listname=<%=serchList%>&search_Content=<%=content%>">&gt;&gt;</a>
							<%}
							%>
				</tfoot>
			</table>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>