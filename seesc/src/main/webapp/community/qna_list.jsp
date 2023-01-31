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
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
<style>
a{
text-decoration: none;
}
ul{
list-style: none;
}
.write_title{
text-align : center;
font-size : 25px;
font-weight: bold;
}
.write_table{
margin :0px auto;
} 

</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
		<article>
			<p class="write_title">질문과 답변</p>
			<table class="write_table">
				<thead>
					<tr>
						<td colspan="4" align="left">전체글 : 0개</td>
						<td align="right"><select>
								<option value="5">5개씩</option>
								<option value="10">10개씩</option>
								<option value="50">50개씩</option>
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
					ArrayList<WriteDTO> arr = qnadao.writeQnAList();
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
						<td><a href = "qna_content.jsp?write_idx=<%=arr.get(i).getWrite_idx() %>" class ="anono"><%=arr.get(i).getWrite_title()%></a></td>
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
					<tr>
						<td colspan="4" align="center"><select>
								<option value="1">글제목</option>
								<option value="2">내용</option>
								<option value="3">작성자</option>
						</select> <input type="text" name="search" placeholder="내용입력"> <input
							type="button" value="검색"></td>
						<td><input type="submit" value="글작성"
							onclick="location.href ='qna_upload.jsp'"></td>
					<tr>
					<tr>
						<td colspan="5" align="center">&lt; &lt; &nbsp;&nbsp;페이징 들어갈
							자리&nbsp;&nbsp;&gt;&gt;
				</tfoot>
			</table>
		</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>