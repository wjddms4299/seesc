<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String idx=request.getParameter("idx");
if(idx==null || idx.equals("")){
	idx="0";
}

%>
</head>
<Style>
article{
	text-align: center;

}
.writedel{/*게시글삭제하기 버튼*/
		
        height: 30px;
        border: none;
        border-radius: 5px;
        background-color: #4646CD;
        color: white;
        font-size: 16px;
      }
.writedel:hover {
    background-color: #0000CD;
}
legend{
	font-size:25px;
}
      input[type="text"],
      input[type="password"]{
        width: 50px;
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 2px solid black;
      }
fieldset{

	text-align: center;
}
#under{
	color: red;
}
#password{
	color: red;
}
.red{
	color:red;
}
.writedel{/*게시글삭제하기 버튼*/
		
        height: 30px;
        border: none;
        border-radius: 5px;
        background-color: #ff8200;	
        color: white;
        font-size: 16px;
      }
.writedel:hover {
    background-color: #FACC2E;
}
</Style>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">  
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
	<form name="undershow" action="under_open_ok.jsp" method="post" enctype="multipart/form-data">
		<a class="red">비밀 댓글</a>을 보기 위해서는 비밀번호를 입력해주세요<br>
		<input type="password" name="write_pwd">
		<input type="submit" value="수정하기" class="writedel">
		<input type="hidden" value=<%=idx %> name="write_idx">
	</form>	
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>