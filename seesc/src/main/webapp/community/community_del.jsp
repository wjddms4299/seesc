<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<jsp:useBean id="udao" class="com.esc.userinfo.UserinfoDAO"></jsp:useBean>
<!DOCTYPE html>
<%	
	int idx=0;
	String idx_s=request.getParameter("idx");
	if(idx_s==null || idx_s.equals("")){
		idx_s="";
	}else{
		idx=Integer.parseInt(idx_s);
	}

	
	
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
</head>
<style>
article{
	text-align: center;
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

#div1{
	margin-bottom: 10px;

}
     input[type="text"],
      input[type="password"]{
        width: 100px;
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 2px solid black;
      }
#under{
	color: red;
}
#password{
	color: red;
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
</style>
<%


int user_idx=session.getAttribute("user_idx")==null||session.getAttribute("user_idx").equals("")?0:(Integer)session.getAttribute("user_idx");

int manager=session.getAttribute("manager")==null || session.getAttribute("manager").equals("")?0:(Integer)session.getAttribute("manager");

String sid_s=session.getAttribute("sid")==null || session.getAttribute("sid").equals("")?"":(String)session.getAttribute("sid");
	

String write_writer=wdao.nodel(idx);

if(udao.manager(write_writer)==1 || manager==0){
	%>
	<script>
	window.alert('관리자의 글은 삭제할 수 없습니다.');
	location.href='community_freecontent.jsp?idx=<%=idx	%>';
	</script>
	<% 	
}
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h3><a id="under"><%=idx %></a>번 게시물 삭제하기</h3>
		<form name="del" action="community_del_ok.jsp" method="get">
		<div id="div1">
		삭제를 하기 위해서는 게시글을 작성하실 때에 <br> 입력하신 <a id="password">비밀번호</a>를 입력하셔야 합니다. <br>
		<a id="password">비밀번호</a>:<input type="password" name="pwd" > 
		<input type="hidden" name="idx" value="<%=idx %>">
		</div>
		<div>
		<input type="submit" value="삭제하기" id="del" class="writedel">
		<input type="button" value="취소하기" id="cancel" onclick="location.href='community.jsp'" class="writedel"	>
		<input type="hidden" value="">
		</div>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>