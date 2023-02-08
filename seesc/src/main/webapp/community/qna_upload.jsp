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
<style>
a {
	text-decoration: none;
}

ul {
	list-style: none;
}
body {
        font-family: Arial, sans-serif;
      }
section {
width: 50%;
margin: 0 auto;
text-align: center;
}
      
article {
margin-bottom: 20px;
}
      
h2 {
font-size: 36px;
margin-bottom: 20px;
}
      
table {
width: 700px;
margin: 0 auto;
text-align: left;
background-color: #FADCA5;
      }
      
      th {
        font-size: 18px;
        padding: 10px;
        border-bottom: 1px dotted #444444;
        

      }
      td{
   color : black;
      border-bottom: 1px dotted #444444;
      
   
      }
      
      input[type="text"],
      input[type="password"]{
        width: 400px;
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 1px solid lightgray;
      }
  
      input[type="button"],input[type="reset"]{
        width: 100px;
        height: 40px;
        border: none;
        border-radius: 5px;
        background-color: #DC9146;
        color: white;
        font-size: 16px;
        margin-left: 20px;
      }
      input[type="button"]:hover, input[type="reset"]:hover {
    background-color: #D27328;
	}
      
      input[type="submit"] {
        width: 100%;
        height: 50px;
        border: none;
        border-radius: 5px;
        background-color: #FF8200;
        color: black;
        font-weight : bold;
        font-size: 16px;
        margin-top: 20px;
      }
      input[type="submit"]:hover {
   		 background-color: #FF9614;
		}
      
      textarea {
        width: 400px;
    height: 250px;
    border: none;
    resize: none;
    border-radius: 5px;
      padding: 10px;
  }
</style>

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
			<h1 class ="h1">QnA 글쓰기</h1>
			<br>
			  <hr width="130px">
			  <br><br>
			  
			  
			<form name="qna_upload" action="qna_upload_ok.jsp" method="post"
				enctype="multipart/form-data" accept=".jpg,.jpeg,.png,.gif,.bmp">
					<table>
						<input type="hidden" name="user_idx" value="<%=user_idx%>">
						<input type="hidden" name="write_notice"
							value="<%=write_notice%>">
						
						<tr>
							<th>작성자</th>
							<td><input type="text" name="write_writer" 
								required="required" value="<%
								String value = user_idx==0?"":dto.getUser_nic();
								out.println(value);
								%> "
								<%
								String readonly =user_idx==0?"":"readonly";
								out.println(readonly);
								%>
								ㄴ></td>
						</tr>
						<tr>
							<th>글제목</th>
							<td><input type="text" name="write_title"
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
							<td><input type="file" name="write_filename"></td>
						</tr>
						<tr>
							<th>글내용</th>
							<td><textarea name="write_content" rows="10" cols="50"
									required="required" placeholder="내용 3000자 이내로 작성"></textarea></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="write_pwd"
								required="required"  placeholder="비밀번호 분실시 글 수정과 삭제를 할 수 없습니다."></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="등록"> 
								</tr>
								<tr>
								<td colspan ="2">
								
								<input type="reset" value="다시 작성"> 
								<input
								type="button" value="목록"
								onclick="location.href ='/seesc/community/qna_list.jsp'"></td>
						</tr>
					</table>

			</form>
			
				<br><br><br>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>