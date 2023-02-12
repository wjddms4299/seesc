<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
.red{

	color: red;
}
section{
	text-align: center;
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
</style>
</head>
<%
	int idx=0;
	String idx_s=(String)session.getAttribute("write_idx");
	if(idx_s==null || idx_s.equals("")){
		idx_s="0";
		idx=Integer.parseInt(idx_s);
	}else{
		idx=Integer.parseInt(idx_s);
	}

%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
	<form name="fm" action="community_freecontent_update_ok2.jsp" method="post" enctype="multipart/form-data">
		<h3><a class="red"><%=idx %></a>번 게시물 수정하기</h3>
		<div id="div1">
		<a class="red">수정</a>를 하기 위해서는 게시글을 작성하실 때에 <br> 입력하신 <a id="password" class="red">비밀번호</a>를 입력하셔야 합니다. <br>
		<a id="password" class="red">비밀번호</a>:<input type="password" name="write_pwd" > 
		<input type="hidden" name="write_idx"value="<%=idx%>">
		</div>
		<div>
		<input type="submit" value="수정하기" id="del" class="writedel" >
		<input type="button" value="취소하기" id="cancel" onclick="location.href='community.jsp'" class="writedel"	>
		</div>
	</form>	
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>