<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
input[type=submit] {
  width: 100%;
  background-color: #333;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}
input[type=text], select {
  width: 90%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
ul{
list-style: none;
}
legend{
text-align: center;
}
</style>
<body>
<form name="hofUpload" method="post" action="hofUpload_ok.jsp" enctype="multipart/form-data">
	<fieldset>
		<legend>기록 올리기</legend>
		<ul>
			<li>
			<select name="thema" size="1" id="thema">
					<option value="이젠401">이젠401</option>
					<option value="이젠402">이젠402</option>
					<option value="이젠403">이젠403</option>
					<option value="이젠404">이젠404</option>
					<option value="이젠405">이젠405</option>
					<option value="이젠406">이젠406</option>
					<option value="이젠407">이젠407</option>
			</select>
			</li>
			<li><label>이름</label>
				<input type="text" name="name">
			</li>
			<li><label>기록</label>
				<input type="text" name="record">
			</li>
			<li><label>이미지</label>
				<input type="file" name="img">
			</li>
		</ul>
		<div><input type="submit" value="기록 올리기"></div>
	</fieldset>
</form>
</body>
</html>