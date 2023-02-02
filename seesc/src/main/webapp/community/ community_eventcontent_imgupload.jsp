<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="imgupload" action="community_eventcontent_imgupload_ok.jsp" enctype="multipart/form-data">
<fieldset>
	<legend>파일 올리기</legend>
	<ul>
		<li><label>제목</label>
			<input type="text"	name="title">
		</li>
		<li><label>파일</label>
			<input type="file" name="upload">			
		</li>
	</ul>
	<div><input type="submit" value="파일 올리기"></div>
</fieldset>
</form>
</body>
</html>