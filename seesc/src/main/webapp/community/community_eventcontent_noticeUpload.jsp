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
h3{
	text-align: center;
	font-size: 30px;
	color:#FFA300;
}
table {
	width: 660px;
	margin: 0px auto;
	align:center;
}
th {
	float:left;
}
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
<%
sid= (String) session.getAttribute("sid");
UserinfoDTO dto = udao.userInfo(sid);
%>
	<section>
		<article>
			<form name="community_eventcontent_noticeUpload" action="community_eventcontent_noticeUpload_ok.jsp" method="post" enctype="multipart/form-data">
				<br>
				<h3>이벤트 공지사항 글쓰기</h3>
				<hr>
				<br>
					<table>
						<input type="hidden" name="user_idx" value="<%=user_idx%>">
						
						<tr>
							<th>제목: </th>
							<td colspan="3"><input type="text" size="79" name="write_title"
								required></td>
						</tr>
						<tr>
							<th>파일첨부: </th>
							<td colspan="3"><input type="file" name="write_filename"></td>
						</tr>
						<tr>
							<td colspan="4"><textarea name="write_content" rows="10" cols="92"
									required></textarea></td>
						</tr>
						<tr>
							<td colspan="4" align="center"><input type="submit"
								value="등록" class="listbutton" > <input type="reset"  class="listbutton" value="다시 작성"> 
								<input type="button"  class="listbutton" value="목록" onclick="location.href ='/seesc/community/community_eventcontent_list.jsp'"></td>
						</tr>
					</table>
			</form>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>