<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%request.setCharacterEncoding("utf-8"); %>
<%@page import="com.esc.write.*"%>
<%@page import ="com.esc.userinfo.*" %>
<jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO" scope = "session"></jsp:useBean>
<%

int user_idx = session.getAttribute("user_idx")==null||session.getAttribute("user_idx").equals("")?0:(int)session.getAttribute("user_idx");
int manager = session.getAttribute("manager")==null||session.getAttribute("manager").equals("")?0:(int)session.getAttribute("manager");
int write_notice = 0;

if(manager==0){
	%>
	<script>
	window.alert('관리자만 접근할 수 있습니다.');
	window.self.close;
	</script>
	
	<%return;} 
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="/seesc/css/write.css">

</head>
<body>
	<%@include file="/header.jsp"%>
<%
sid= (String) session.getAttribute("sid");
UserinfoDTO dto = userdao.userInfo(sid);
%>
	<section>
		<article>
			<br><br><br>
			<h1 class ="h1">공지글 작성</h1>
			<br>
			  <hr width="130px">
			  <br><br>
			  
			  
			<form name="qna_noticeUpload" action="qna_noticeUpload_ok.jsp" method="post"
				enctype="multipart/form-data" accept=".jpg,.jpeg,.png,.gif,.bmp">
					<table>
					<tbody class = "writelist">
						<input type="hidden" name="user_idx" value="<%=user_idx%>">
						<input type="hidden" name="write_notice"
							value="<%=write_notice%>">
						
						
						<tr><td><br></td></tr>
	
						<tr>
							<th>글제목</th>
							<td><input type="text" name="write_title" maxlength="50"
								required="required"placeholder=" 제목 50자이내로 작성"></td>
						</tr>
						<tr>
							<th>파일첨부</th>
							<td><input type="file" name="write_filename"><label style = "color :red;">* jpg, jpeg, png, gif, bmp 파일만 첨부 가능합니다.</label></td>
						</tr>
						<tr>
							<th>글내용</th>
							<td><textarea name="write_content" rows="10" cols="50" maxlength="3000"
									required="required" placeholder="내용 3000자 이내로 작성"></textarea></td>
						</tr>
						<tfoot class = "tfoot">
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td colspan ="2"><input type="submit"
								value="등  록"> 
								</tr>
								<tr>
								<td colspan = "2">&nbsp;</td>
								</tr>
								<tr>
								<td colspan="2" style = "text-align : right;">
								<input type="reset" value="다시 작성"> 
								<input
								type="button" value="목록"
								onclick="location.href ='/seesc/community/qna_list.jsp'"></td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						</tfoot>
						</tbody>
					</table>

			</form>
			
				<br><br><br>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>