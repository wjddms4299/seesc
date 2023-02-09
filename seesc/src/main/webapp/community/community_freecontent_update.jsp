<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.write.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<%

	String savePath=request.getRealPath("/community/userFile/writeImg");
	MultipartRequest mr=
	new MultipartRequest(request,savePath,2097152,"utf-8");
	
	String idx_s=(String)session.getAttribute("write_idx");
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
	text-align: left;
}
.communitybutton{
        height: 30px;
        border: none;
        border-radius: 5px;
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
}
.communitybutton:hover{
	background-color: #3e8e41;
	

}
legend{
	font-size: 25px;
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
}
fieldset {
	margin: 2px auto;
}
table {
width: 800px;
margin: 0 auto;
text-align: center;
background-color: white;

}
      
 th {
font-size: 18px;
padding: 10px;
color :black;
text-align : center;
background-color: #4646CD;
        

      }
 td{
color : black;
text-align : center;
  background-color: white;
}
tfoot{

	text-align: center;
}  

.writedel{/*게시글삭제하기 버튼*/
		
        height: 30px;
        border: none;
        border-radius: 5px;
        background-color: #4646CD;
        color: white;
        font-size: 16px;
      }
.writedel:hover {
    background-color: #0000CD;
}
</style>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		
		<fieldset>
		<legend>수정하기</legend>
		<form name="writeupdate2" action="community_freecontent_update_ok.jsp" method="post" enctype="multipart/form-data">
		<table>
		<%
		WriteDTO dto=wdao.contentWrite(idx);
		%>
			<thead>
				<tr>
					<th>제목 : <input type="text" id="texttitle" name="title" value="<%=dto.getWrite_title()%>"></th>
				</tr>
				<tr>
					<th>파일 : <input type="file" id="filename" name="filename" value="<%=dto.getWrite_filename() %>">
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
						<input type="submit" value="수정하기"  class="writedel">
						<input type="reset" value="다시쓰기"  class="writedel">
						<input type="button" value="돌아가기" onclick="location.href='community.jsp'" class="writedel">
					</td>
				</tr>
			</tfoot>
		</table>
			<input type="hidden" name="idx" value="<%=idx %>">
		</form>
		</fieldset>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>