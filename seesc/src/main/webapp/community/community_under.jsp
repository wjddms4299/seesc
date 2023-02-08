<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
</head>
<style>
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
</style>
<%
String ref_s=request.getParameter("ref");
int ref=Integer.parseInt(ref_s);
String lev_s=request.getParameter("lev");
int lev=Integer.parseInt(lev_s);
String step_s=request.getParameter("step");
int step=Integer.parseInt(step_s);
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<form name="underwrite" action="community_under_ok.jsp" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>댓 글 달 기</legend>
				<table>
		<thead>
			<tr>
				<th>작성자 : <input type="text" name="write_writer"></th>
				<th>비밀번호 : <input type="password" name="write_pwd"></th>
				<th><input type="checkbox" name="write_open" value="0">비밀 글</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3">댓글 : <input type="text" name="write_content" size="60" ></td>
				<td><input type="submit" class="communitybutton communitybutton:hover " value="댓글 등록하기">	
			</tr>
		</tbody>	
		</table>
		</fieldset>
		<input type="hidden" name="write_ref" value="<%=ref %>" >
		<input type="hidden" name="write_lev" value="<%=lev %>">
		<input type="hidden" name="write_step" value="<%=step %>">
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>