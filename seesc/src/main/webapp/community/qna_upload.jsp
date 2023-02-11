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
			<h1 class ="h1">문의하기</h1>
			<br>
			  <hr width="130px">
			  <br><br>
			  
			  
			<form name="qna_upload" action="qna_upload_ok.jsp" method="post"
				enctype="multipart/form-data">
					<table>
					<tbody class = "writelist" cellspacing ="0px">
					
						<tr><td><input type="hidden" name="user_idx" value="<%=user_idx%>">
						<input type="hidden" name="write_notice"
							value="<%=write_notice%>"></td></tr>
	
						
						<tr>
							<th>작성자</th>
							<td><input type="text" name="write_writer" maxlength="50"
								required="required" value="<%
								String value = user_idx==0?"":dto.getUser_nic();
								out.println(value);
								%>"
								<%
								String readonly =user_idx==0?"":"readonly";
								out.println(readonly);
								%>>
								</td>
						</tr>
						<tr>
							<th>글제목</th>
							<td><input type="text" name="write_title" maxlength="49"
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
									required="required" placeholder="내용 3000자 이내로 작성"></textarea></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="write_pwd" maxlength="50"
								required="required"  placeholder="비밀번호 분실시 글 수정과 삭제를 할 수 없습니다."></td>
						</tr>
						<tfoot class = "tfoot">
						<tr><td>&nbsp;</td></tr>
						<tr>
								<td colspan="2" style = "text-align :center;">
							<input type="submit"
								value="등  록"> 
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