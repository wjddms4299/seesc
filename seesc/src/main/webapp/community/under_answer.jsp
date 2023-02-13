<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.userinfo.*" %>
<jsp:useBean id="udao" class="com.esc.userinfo.UserinfoDAO" scope="session"></jsp:useBean>
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
table {
width: 800px;
margin: 0 auto;
text-align: center;
background-color: white;

}
      
 th {
font-size: 18px;
padding: 10px;
color :black;
text-align : center;
background-color: #ff8200;
        

      }

 td{
color : black;
text-align : center;
  background-color: white;
}
tfoot{

	text-align: center;
} 
.writer /**작성자 비밀번호*/{
	width: 200px;
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 2px solid black;
}
.textarea/*댓글 입력창*/{
		width: 400px;
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 2px solid black;

}
tbody{
	font-size: 18px;

}
legend{
	font-size: 20px;
}
#red{
	color: red;
}

</style>
<body>
<%@include file="/header.jsp" %>
<%

String sid_s=(String)session.getAttribute("sid");
if(sid_s==null||sid_s.equals("")){
	sid_s="";
}

int user_idx=session.getAttribute("user_idx")==null || session.getAttribute("user_idx").equals("")?0:(Integer)session.getAttribute("user_idx");

int manager=session.getAttribute("manager")==null || session.getAttribute("manager").equals("")?0:(Integer)session.getAttribute("manager");

String nick="";
UserinfoDTO dto=udao.userInfo(sid_s);
if(dto==null){
	nick="";
}else{
	nick=dto.getUser_nic();
}



String ref_s=request.getParameter("ref");
int ref=Integer.parseInt(ref_s);
String lev_s=request.getParameter("lev");
int lev=Integer.parseInt(lev_s);
String step_s=request.getParameter("step");
int step=Integer.parseInt(step_s);
String content=request.getParameter("write_content");
String write_idx=request.getParameter("write_idx");
%>


<section>
	<article>
		<form name="answer" action="under_answer_ok.jsp" method="post" enctype="multipart/form-data">
		<fieldset>
			<legend><a id="red">답 글 달 기</a></legend>
				<table>
		<thead>
			<tr>
				<%
				if(sid_s==null || sid_s.equals("")){
					%>
					<th>작성자 :<input type="text" name="write_writer" class="writer"></th>
					<% 
				}else{
					%>
					<th>작성자 :<input type="text" name="write_writer" readonly  value="<%=nick %>" class="writer"></th>
					<%
				}
				%>
				<th>비밀번호 : <input type="password" name="write_pwd" class="writer"></th>
				<th colspan="2"><input type="checkbox" name="write_open" value="0">비밀 글</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3">댓글 : <input type="text" name="write_content" size="60" class="textarea" value="Re:)"></td><!--  value="RE:)"--> 
				<td><input type="submit" value="댓글 등록하기" class="writedel">
					<input type="button" value="돌아가기" class="writedel" onclick="location.href='community_freecontent.jsp?idx=<%=write_idx%>'">
				</td>	
			</tr>
		</tbody>	
		</table>
		</fieldset>
		<input type="hidden" name="write_ref" value="<%=ref %>" >
		<input type="hidden" name="write_lev" value="<%=lev %>">
		<input type="hidden" name="write_step" value="<%=step %>">
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>