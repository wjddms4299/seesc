<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.esc.write.*"%>
<%@page import ="com.esc.userinfo.*" %>
<%@page import="java.time.Month"%>
<%@page import="java.time.Year"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.Instant"%>
<jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO" scope = "session"></jsp:useBean>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<link rel = "stylesheet" type = "text/css" href = "/seesc/css/subLayout.css">
<link rel="stylesheet" type="text/css" href="/seesc/css/button.css">
<style>
a {
	text-decoration: none;
}

ul {
	list-style: none;
}
.submenu{
position: relative;
width : 1200px;
height : 50px;
margin : 0px auto;
left :380px;
}

table{
  width: 900px;
  border-collapse: collapse;
  table-layout:fixed;
  word-break:break-all;

}
.th{ /*제목*/
	margin : 10px auto;
    padding: 10px;
    word-break:break-all;
    background-color: #FFF064;
    color : black;
    text-align:center; 
 
}

.writelist{/*일반글 리스트*/
text-align : center;
background-color: white;
color : black;
padding :5px;
}
.writelist td{/*일반글 리스트*/
border-bottom: 1px dotted #444444;
    padding : 5px;

}
.tfoot{
background-color: white;
text-align : center;
padding : 5px;
}
</style>
</head>
<%
int user_idx = session.getAttribute("user_idx") == null || session.getAttribute("user_idx").equals("") ? 0
		: (Integer) session.getAttribute("user_idx");
int manager = session.getAttribute("manager") == null || session.getAttribute("manager").equals("") ? 0
		: (Integer) session.getAttribute("manager");
int write_idx = request.getParameter("write_idx")==null||request.getParameter("write_idx").equals("")?1:Integer.parseInt(request.getParameter("write_idx"));
%>
<body>
	<%@include file="/header.jsp"%>

	<section>
		<article><br><br><br>
			<h1 class ="h1">내문의내역</h1>
			<br>
			  <hr width="130px">
			  <br><br>
			<table>
				<thead class="th">
					<tr>
						<th>번호</th>
						<th colspan="3">제목</th>
						<th>등록자</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody class = "writelist">
					<%
					ArrayList<WriteDTO> arr = qnadao.userWriteList(user_idx);
					if(user_idx==0){%>
					
					<tr><td colspan ="7">비회원은 조회할 수 없습니다.</td></tr>
					<%
					}else if(arr.size()==0||arr==null){
						%>
						
						<tr><td colspan ="7">등록된 문의글이 없습니다.</td></tr>
						<%
						
					}else{
						for(int i=0;i<arr.size();i++){
							java.util.Date nowDate = new java.util.Date();
							SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
							String today = simpleDateFormat.format(nowDate); 
							String dbdate= simpleDateFormat.format(arr.get(i).getWrite_wdate());
							String newicon= today.equals(dbdate)?"<img src='/seesc/img/ico_n.png' alt = 'new'style = 'width:15px;height:15px;' >":"";
							
							String todayW = today.equals(dbdate)?qnadao.writetime(arr.get(i).getWrite_idx()):dbdate;

							//내가쓴글 알려주기
							String me = 
							user_idx==arr.get(i).getUser_idx()&&user_idx!=0?"<img src='/seesc/img/meme.png' alt = 'me' style='width :20px; height:20px;'>":"";
						%>
						<tr>
						<td><%=arr.get(i).getWrite_idx()%></td>
						
						<td class="write_title" colspan="3" align = "left">
					
						<%
						for(int z=0; z<arr.get(i).getWrite_lev();z++){
							out.println("&nbsp;&nbsp;");
							}
						if(arr.get(i).getWrite_lev()>0){
							out.println("&#8627;");
						}
							if(arr.get(i).getWrite_open()==0){ //비밀글 관리
								/**관리자나 본인이 쓴글이면 비밀번호 필요 없음*/
								if(manager==1||user_idx==arr.get(i).getUser_idx()&&user_idx!=0){%>
									<a href="qna_content.jsp?write_idx=<%=arr.get(i).getWrite_idx()%>">
									<img src="/seesc/img/ico_lock.gif" alt = "비밀글" class = "lock">&nbsp;<%=arr.get(i).getWrite_title()%>&nbsp;<%=newicon %></a>
								<%}else{%>
									<a href="qnaOpen_pwd.jsp?write_idx=<%=arr.get(i).getWrite_idx()%>&write_pwd=<%=arr.get(i).getWrite_pwd()%>">
								<img src="/seesc/img/ico_lock.gif" alt = "비밀글" class = "lock">&nbsp;<%=arr.get(i).getWrite_title()%>&nbsp;<%=newicon %></a>
								<%}
							}else{%>
								<a href="qna_content.jsp?write_idx=<%=arr.get(i).getWrite_idx()%>">
								<%=arr.get(i).getWrite_title()%>&nbsp;<%=newicon %></a>
							
							<%} %>
							</td>
							<td><%=me%><%=arr.get(i).getWrite_writer()%></td>
							<td><%=todayW%></td>
							<td><%=arr.get(i).getWrite_readnum()%></td>
						</tr>
					<%
					}
					}
					%>
					<tfoot class="tfoot">
				<tr><td colspan="7"><br></td></tr>
					<tr>
				<tr>
						<td colspan ="7" align = "right">
						<% String wbutton = manager==0?"qna_upload.jsp":"qna_noticeUpload.jsp"; %>
						<input type="button" value="글작성" onclick= "location.href ='<%=wbutton%>'" class ="writebutton">
						<input type="button" value="전체글" onclick= "location.href ='qna_list.jsp'" class = "listbutton">&nbsp;</td>
						</tr>
										<tr><td colspan="7"><br></td></tr>
						
										<tr><td colspan="7"><br></td></tr>
						
						</tfoot>
				</tbody>
			</table>
		</article>
	</section>
		<br><br><br>
	
		<%@include file="/footer.jsp"%>
	
</body>
</html>