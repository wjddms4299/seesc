<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
section{
text-align:center;
}
 input[type="password"]{
        width: 180px;
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 1px solid lightgray;
        margin-bottom: 20px;
      }
      
           input[type="submit"] {
        width: 80px;
        height: 40px;
        border: none;
        border-radius: 5px;
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
        margin-top: 20px;
      }
      input[type="submit"]:hover {
   		 background-color: #3e8e41;
		}
      
                input[type="button"] {
        width: 80px;
        height: 40px;
        border: none;
        border-radius: 5px;
        background-color: #464646;
        color: white;
        font-size: 16px;
        margin-top: 20px;
      }
      input[type="button"]:hover {
   		 background-color: #3c3c3c;
		}
      
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<form name="qnaOpen" action="qnaOpen_pwd_ok.jsp" method="post">
				<input type="hidden" name="write_pwd" value="<%=request.getParameter("write_pwd")%>">
				<input type="hidden" name="write_idx" value="<%=request.getParameter("write_idx")%>">
					<br><br>
					<div style = "font-size:18px;">
					<p><label style ="color:red;">비밀글</label> 기능으로 보호된 글입니다.</p>
					<label style ="color:red;">작성자와 관리자만</label> 열람 가능합니다.<br>
					<br>
					본인이라면 비밀번호를 입력하세요.
					</div>
					<br>
					<div style = "font-size:18px;">
						비밀번호 <input type="password" name="inputpwd" required>
						<input type="submit" value="확인">
						<input type="button" value="뒤로" onclick = "javascript:history.back();">
					</div>
					<br><br>
			</form>
		</article>
	</section>


	<%@include file="/footer.jsp"%>

</body>
</html>