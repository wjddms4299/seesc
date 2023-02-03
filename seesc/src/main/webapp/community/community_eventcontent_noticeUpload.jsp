<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.esc.write.*" %>
<%@ page import ="com.esc.userinfo.*" %>
<jsp:useBean id="udao" class="com.esc.userinfo.UserinfoDAO" scope="session"></jsp:useBean>
<%
int user_idx=session.getAttribute("user_idx")==null || session.getAttribute("user_idx").equals("")?0:(int)session.getAttribute("user_idx");
int manager=session.getAttribute("manager")==null || session.getAttribute("manager").equals("")?0:(int)session.getAttribute("manager");
int write_notice=0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
</head>
<body>
	<%@include file="/header.jsp"%>
<%
sid= (String) session.getAttribute("sid");
UserinfoDTO dto = udao.userInfo(sid);
%>
	<section>
		<article>
			<form name="community_eventcontent_noticeUpload.jsp" action="community_eventcontent_noticeUpload_ok.jsp" method="post"
				enctype="multipart/form-data">
				<h2>공지글쓰기</h2>
				<fieldset>
					<table>
						<input type="hidden" name="user_idx" value="<%=user_idx%>">
						
						<tr>
							<th>글제목</th>
							<td><input type="text" name="write_title"
								required="required"></td>
						</tr>
						<tr>
							<th>파일첨부</th>
							<td><input type="file" name="write_filename"></td>
						</tr>
						<tr>
							<th>글내용</th>
							<td><textarea name="write_content" rows="10" cols="50"
									required="required"></textarea></td>
						</tr>

						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="등록"> <input type="reset" value="다시 작성"> <input
								type="button" value="목록"
								onclick="location.href ='/seesc/community/community_eventcontent_list.jsp'"></td>
						</tr>
					</table>
				</fieldset>
			</form>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>