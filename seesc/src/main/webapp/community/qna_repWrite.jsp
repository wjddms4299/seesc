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
	%><script>
	window.alert('관리자만 접근가능합니다.');
	history.back();
	</script>
	
<%return;}

String write_title = request.getParameter("write_title");
String write_ref = request.getParameter("write_ref");
String write_lev = request.getParameter("write_lev");
String write_step = request.getParameter("write_step");
String write_content = request.getParameter("write_content");
String write_pwd = request.getParameter("write_pwd");

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
			<h1 class ="h1">답글쓰기</h1>
			<br>
			  <hr width="130px">
			  <br><br>
			  <table>
			  		<tr><td><br></td></tr>
			  		
			<form name="qna_repWrite" action="qna_repWrite_ok.jsp" method="post"
				enctype="multipart/form-data" accept=".jpg,.jpeg,.png,.gif,.bmp">
					<table>
					<tbody class = "writelist">
						<input type="hidden" name="user_idx" value="<%=user_idx%>">
						<input type ="hidden" name = "write_ref" value = "<%=write_ref%>">
						<input type = "hidden" name = "write_step" value = "<%=write_step%>">
						<input type = "hidden" name = "write_lev" value = "<%=write_lev%>">
						<input type = "hidden" name = "write_pwd" value = "<%=write_pwd%>">
						
						<tr>
							<th>작성자</th>
							<td><input type="text" name="write_writer" maxlength="50"
								required="required" value="<%
								String value = user_idx==0?"":dto.getUser_nic();
								out.println(value);
								%> "
								<%
								String readonly =user_idx==0?"":"readonly";
								out.println(readonly);
								%>>
								</td>
						</tr>
						<tr>
							<th>글제목</th>
							<td><input type="text" name="write_title" maxlength="50" value = "Re:)<%=write_title%>"
								required="required"placeholder=" 제목 50자이내로 작성"></td>
						</tr>
						<tr>
							<th>공개여부</th>
							<td><input type="radio" name="write_open" value="0" checked>비밀글
							&nbsp;&nbsp;&nbsp;
								<input type="radio" name="write_open" value="1">공개글</td>
						</tr>
						<tr>
							<th>파일첨부</th>
							<td><input type="file" name="write_filename" accept="image/gif,image/jpeg,image/png"><label style = "color :red;">* jpg, jpeg, png, gif, bmp 파일만 첨부 가능합니다.</label></td>
						</tr>
						<tr>
							<th>글내용</th>
							<td><textarea name="write_content" rows="10" cols="50" maxlength="3000"
									required="required" placeholder="내용 3000자 이내로 작성">------------------Original Message------------------

<%=write_content%>

----------------------------------------------------

</textarea></td>
						</tr>
						</tbody>
						<tfoot class = "tfoot">
						<tr><td>&nbsp;</td></tr>
								<tr>
								<td colspan="2" style = "text-align : center;">
								<input type="submit"
								value="등  록"> 
								<input type="reset" value="다시 작성"> 
								<input
								type="button" value="목록"
								onclick="location.href ='/seesc/community/qna_list.jsp'"></td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						</tfoot>
					</table>

			</form>
			
				<br><br><br>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>