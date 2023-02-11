<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO" scope="session"></jsp:useBean>
<%
	String idx_s=request.getParameter("idx");
	if(idx_s==null || idx_s==""){
		idx_s="0";
	}
	int idx=Integer.parseInt(idx_s);
	
	
	int ref=0;
	String ref_s=request.getParameter("write_ref");
	if(ref_s==null || ref_s.equals("")){
		idx_s="0";
	}else{
		ref=Integer.parseInt(ref_s);
	}
	int lev=0;
	String lev_s=request.getParameter("write_lev");
	if(lev_s==null || lev_s.equals("")){
		lev_s="0";
	}else{
		lev=Integer.parseInt(lev_s);
	}
	int step=0;
	String step_s=request.getParameter("write_step");
	if(step_s==null || step_s.equals("")){
		step_s="0";
	}else{
		step=Integer.parseInt(step_s);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">  
</head>
<style>
.writedel{/*게시글삭제하기 버튼*/
		
        height: 30px;
        border: none;
        border-radius: 5px;
        background-color: #ff8200;
        color: white;
        font-size: 16px;
      }
.writedel:hover {
    background-color: #FACC2E
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
.yellow{
	color: yellow;
}
</style>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<fieldset>
		<legend><A class="yellow">댓글 삭제하기</A></legend>
		<form name="writeDel" action="under_del_ok.jsp" method="post" enctype="multipart/form-data">
		<div>
		<a id="under">댓글</a>을 삭제하기 위해서는 <a id="password">비밀번호</a>가 필요합니다.<br>
		<a id="password">비밀번호</a> : <input type="password" name="pwd">
		<input type="hidden" name="idx" value="<%=idx%>">
		<input type="hidden" name="ref" value="<%=ref %>">
		<input type="hidden" name="step" value=<%=step	%>>
		<input type="hidden" name="lev" value="<%=lev %>">
		<input type="submit" value="삭제하기" class="writedel">
 		</div>
 		</form>
 		</fieldset>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>