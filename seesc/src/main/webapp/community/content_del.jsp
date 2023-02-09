<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css"/>
<link rel="stylesheet" type="text/css" href="/seesc/css/subLayout.css">
<link rel="stylesheet" type="text/css" href="/seesc/css/button.css">
</head>
<%
	int user_idx=session.getAttribute("user_idx")==null || session.getAttribute("user_idx").equals("")?0:(Integer)session.getAttribute("user_idx");

	int manager=session.getAttribute("manager")==null || session.getAttribute("user_idx").equals("")?0:(Integer)session.getAttribute("manager");
	
%>

<%
if(manager==0 || user_idx==0){
	%>
	<script>
	window.alert('잘못된 접근입니다.');
	location.href='/seesc/index.jsp';
	</script>
	<%
}

%>
<style>
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
      input[type="text"],
      input[type="password"]{
        width: 50px;
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 2px solid black;
      }
#red{
	color: red;
}  
</style>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<form name="content_del" action="content_del_ok.jsp">
		<%
		
		%>
			<h3>게시물 삭제하기<a id="red">(관리자 모드)</a></h3>
				<div>
				삭제를 하기 위해서는 <a id="red">게시글 번호</a>를 입력하셔야 합니다<br>
				
				<a id="red">게시물 번호</a>:<input type="text" name="write_idx">
				<input type="submit" value=삭제하기 class="writedel">
				<input type="button" value=돌아가기 class="writedel" onclick="location.href='community.jsp'">
				</div>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>