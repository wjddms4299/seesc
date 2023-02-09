<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.esc.write.*"%>
<%@page import ="com.esc.userinfo.*" %>
<jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO" scope = "session"></jsp:useBean>
<%
int user_idx = session.getAttribute("user_idx")==null||session.getAttribute("user_idx").equals("")?0:(int)session.getAttribute("user_idx");
int manager = session.getAttribute("manager")==null||session.getAttribute("manager").equals("")?0:(int)session.getAttribute("manager");
int write_notice = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
.listbutton{
		width: 80px;
        height: 40px;
        border: none;
        border-radius: 10px;
        background-color: #FFA300;
        color: white;
        font-size: 16px;
      }
.listbutton:hover {
    background-color: #FF870C;

}
table{
	blackground-color:white;
	width: 660px;
	word-break:break-all;
	margin: 0px auto;
	align:center;
	border: 3px solid #FFA300;
}
h3{
	text-align: center;
	font-size: 30px;
	color:#FFA300;
}

th {
	float:left;
	color:black;
}
td {
	color:black;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<%
sid= (String) session.getAttribute("sid");
UserinfoDTO dto = userdao.userInfo(sid);
%>
<section>
	<article>
			<br><br><br>
			<h1 class ="h1">Event 글쓰기</h1>
			<br>
			  <hr width="130px">
			  <br><br>
		<form name="community_eventcontent_write" action="community_eventcontent_write_ok.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="user_idx" value="<%=user_idx%>">
		<input type="hidden" name="write_notice" value="<%=write_notice%>">
							
		<table style="background-color: #f2f2f2;">
			<tr>
				<th>작성자 :</th>
				<td><input type="text" size="33px" name="write_writer"
				required="required" value="<%String value = user_idx==0?"":dto.getUser_nic();
				out.println(value);%>"
				<%String readonly=user_idx==0?"":"readonly"; out.println(readonly);%>>
				</td>
				<th>비밀번호 :</th>
				<td><input type="password" placeholder="비밀번호입력" name="write_pwd" required></td>
			</tr>
			<tr>
				<th>파일첨부 : 
				<td><input type="file" name="write_filename"></td>
				<th>공개여부</th>
				<td><input type="radio" name="write_open" value="0" checked>비밀글
				<input type="radio" name="write_open" value="1">공개글</td>
			</tr>
			<tr>
				<th colspan="1">제목 :</th>
				<td colspan="3"><input type="text" size="76px" placeholder="제목입력" name="write_title" required></td>
			</tr>
			<tr>
				<td colspan="4"><textarea rows="10" cols="92" placeholder="내용입력" name="write_content" required></textarea></td>
			</tr>
			</table>
			
			<div align="center"><input  class="listbutton" type="submit" value=" 등록 ">
			<input class="listbutton" type="button" value=" 취소 " onclick="location.href='community_eventcontent_list.jsp'"></div>
		</form>
		<br>
	</article>	
</section>
<%@include file="/footer.jsp" %>
</body>
</html>