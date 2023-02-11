<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.write.*"%>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
</head>
<style>
h2{
	text-align: center;
}

table{

	width:800 px;
	text-align: center;
	border: 1px solid dark;
	background-color: white;
	font-size:18px;
	color: black;
}
.writedel{/*게시글삭제하기 버튼*/
		
        height: 30px;
        border: none;
        border-radius: 5px;
        background-color: #ff8200;	
        color: white;
        font-size: 16px;
      }
.writedel:hover {
    background-color: #FACC2E;
}
.red{
	color:red;
}
</style>
<%
	String write_idx=(String)session.getAttribute("write_idx");

	String idx_s=request.getParameter("idx");
	int idx=Integer.parseInt(idx_s);

%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
	<%
	WriteDTO dto=wdao.showopen(idx);
	%>
		<h2><a class="red">비밀 댓글</a> 확인하기</h2>
		<table>
			<tbody>
				<tr>
					<td>내용 : <%=dto.getWrite_content() %> <input type="button" value="목록으로" onclick="location.href='community_freecontent.jsp?idx=<%=write_idx%>'" class="writedel"> </td>
				</tr>
			</tbody>
		</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>