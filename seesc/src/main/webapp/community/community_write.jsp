<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.write.*" %>
<%@ page import="com.esc.userinfo.*" %>
<jsp:useBean id="wdto" class="com.esc.write.WriteDTO"></jsp:useBean>
<jsp:useBean id="udao" class="com.esc.userinfo.UserinfoDAO" scope="session"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table{
	margin:0px auto;
}
textarea{
	text-align: left;	
}
#select{
	text-align:right;
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

</style>
<%
	String sid_s=(String)session.getAttribute("sid");
	if(sid_s==null||sid_s.equals("")){
		sid_s="";
	}

	

int user_idx=session.getAttribute("user_idx")==null||session.getAttribute("user_idx").equals("")?0:(Integer)session.getAttribute("user_idx");

int manager=session.getAttribute("manager")==null || session.getAttribute("manager").equals("")?0:(Integer)session.getAttribute("manager");
	
	String nick="";
	UserinfoDTO dto=udao.userInfo(sid_s);
	if(dto==null){
		nick="";
	}else{
		nick=dto.getUser_nic();
	}
	
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<h3> 자유게시판 글쓰기</h3>
	<article>
		<form name="community" action="community_write_ok.jsp" method="post" enctype="multipart/form-data">
					<input type="hidden" name="write_cate" value="free">
			<table>
					<tr>
					<%
						if(sid_s.equals("")){
							%>
							<th>작성자<input type="text" name="write_writer"></th>
							<% 
						}else{
							%>
							<th>작성자<input type="text" name="write_writer" readonly placeholder="<%=nick%>" value="<%=nick%>"></th>
							<% 
						}
					%>
						
						<th>비밀번호<input type="password" name="write_pwd"></th>
					</tr>
					<tr>
						<th colspan="2">제목<input type="text" name="write_title" size="60"></th>
					</tr>
					<tr>
						<th><input type="file" name="write_filename">
						<th><input type="checkbox" name="member" value="[멤버모집]" >멤버 모집</th>
					</tr>
					<tr>
						<th colspan="3"><textarea rows="20" cols="75" name="write_content"></textarea></th>
					</tr>
			</table>
				<div id="select">
					<input type="button" value="취소하기" onclick="location.href='community.jsp'" class="communitybutton communitybutton:hover">
					<input type="submit" value="글쓰기" class="communitybutton communitybutton:hover">
				</div>
		</form>
	</article>
	
</section>
<%@include file="/footer.jsp" %>
</body>
</html>