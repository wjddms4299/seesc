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
</head>
<body>
	<%@include file="/header.jsp"%>
	<section>
		<article>
			<form name="qnaOpen" action="qnaOpen_pwd_ok.jsp" method="post">
				<input type="hidden" name="write_pwd" value="<%=request.getParameter("write_pwd")%>">
				<input type="hidden" name="write_idx" value="<%=request.getParameter("write_idx")%>">
				<fieldset>
					<h4>비밀글 기능으로 보호된 글입니다.</h4>
					작성자와 관리자만 열람하실 수 있습니다. <br>
					본인이라면 비밀번호를 입력하세요.
					<div>
						비밀번호<input type="password" name="inputpwd" required>
						<input type="submit" value="확인">
					</div>

				</fieldset>
			</form>
		</article>
	</section>


	<%@include file="/footer.jsp"%>

</body>
</html>