<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.esc.hof.HofDTO" %>
    <%@page import="java.util.*" %>
    <%@page import="com.esc.thema.*" %>
    <jsp:useBean id="hofdao" class="com.esc.hof.HofDAO" scope="session"></jsp:useBean>
    <jsp:useBean id="thedao" class="com.esc.thema.ThemaDAO" scope="session"></jsp:useBean>
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
input[type=text],input[type=number], select {
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
			<%
			ArrayList<ThemaDTO> arr=thedao.allThema();
			if(arr==null||arr.size()==0){
				%><li>등록된 테마가 없습니다.</li><%
			}else{
				%><li><select name="thema" size="1" id="thema"><%
				for(int i=0;i<arr.size();i++){
					%><option value="<%=arr.get(i).getThema_name()%>"><%=arr.get(i).getThema_name()%></option><%
				}
				%></select></li><%
			}
			%>
			
			
			<li><label>이름</label>
				<input type="text" name="name">
			</li>
			<li><label>기록</label>
				<input type="number" name="record" pattern="[0-9]">
			</li>
			<li><label>이미지</label>
				<input type="file" name="img" accept="image/gif,image/jpeg,image/png">
			</li>
		</ul>
		<div><input type="submit" value="기록 올리기"></div>
	</fieldset>
</form>
</body>
</html>