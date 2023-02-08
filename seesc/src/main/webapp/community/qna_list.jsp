<%@page import="java.time.Month"%>
<%@page import="java.time.Year"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.Instant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	        <% request.setCharacterEncoding("utf-8");%>
<%@ page import="java.util.*"%>
<%@ page import="com.esc.write.*"%>
<%@page import ="com.esc.userinfo.*" %>
<jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO" scope = "session"></jsp:useBean>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>

<%


int user_idx = session.getAttribute("user_idx") == null || session.getAttribute("user_idx").equals("")? 0: (Integer) session.getAttribute("user_idx");
int manager = session.getAttribute("manager") == null || session.getAttribute("manager").equals("")? 0: (Integer) session.getAttribute("manager");

%>
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
    background-color: #2C952C;
    color : black;
    text-align:center;

}
.noticelist{/*공지 리스트*/
border-top : 2px double black ;
color : red;
text-align : center;
background-color: #c8c8c8;
}

.noticelist a{
color : red;
}
.noticelist td{
border-bottom: 1px dotted #444444;
color : red;
font-weight: bold;

}

.writelist{/*일반글 리스트*/
text-align : center;
background-color: white;
color : black;
padding : 10px;
}
.writelist td{/*일반글 리스트*/
border-bottom: 1px dotted #444444;
}


.write_title {/*일반글 제목 정렬*/
text-align : left;

}
.tfoot{
background-color: white;
text-align : center;
padding : 5px;
}
</style>
</head>
<%
/*검색 기능*/
String listname = request.getParameter("listname")==null||request.getParameter("listname").equals("")?"0":request.getParameter("listname");
String content = request.getParameter("content")==null||request.getParameter("content").equals("")?"0":request.getParameter("content");


/*페이징 처리*/
int totalqna = qnadao.getTotalCnt(listname,content);
int writeList = request.getParameter("listSize")==null||request.getParameter("listSize").equals("")?10:Integer.parseInt(request.getParameter("listSize"));
int pageList = 5;
int userpage = request.getParameter("userpage")==null||request.getParameter("userpage").equals("")?1:Integer.parseInt(request.getParameter("userpage"));
int totalpage = totalqna/writeList+1;
if(totalqna%writeList==0){
	totalpage --;
}
int pagegroup = userpage/pageList;
if(userpage%pageList == 0){
	pagegroup --;
}

/*넘길때 데이터 너무 많아서*/
String data = "&listSize="+writeList+"&listname="+listname+"&content="+content;
String notice_open = request.getParameter("notice_open");

%>

<body>
	<%@include file="/header.jsp"%>
	<%sid= (String) session.getAttribute("sid");
UserinfoDTO udto = userdao.userInfo(sid); %>



<article>
	<div class = "submenu">
	<br>
	<a href="/seesc/community/community_eventcontent_list.jsp"><button class="tbutton"><span>이벤트</span></button></a>
	<a href="/seesc/community/qna_list.jsp"><button class="rbutton"><span>QnA</span></button></a>
	<a href="/seesc/community/community.jsp"><button class="tbutton"><span>자유게시판</span></button></a>
	</div>
	</article>
	<section>
		<article>
			<br><br><br>
			<h1 class ="h1">QnA</h1>
			<br>
			  <hr width="130px">
			  <br><br>
			<table >
				<thead>
					<tr>
						<td colspan="6" style = "text-align:left;">
						<%String searchmsg = listname.equals("0")?("전체글 : "+qnadao.getTotalCnt(listname,content)+"개 "):("검색 내용 : "+content+" / 검색 결과 : "+qnadao.getTotalCnt(listname,content)+"개");%>
					
					
						<%=searchmsg %>
						</td>
						<td align="right">
						<select name="writeList"
							onChange="window.location.href=this.value" class = "select">
								<option value ="">리스트수</option>
								<option value="qna_list.jsp?listSize=5&listname=<%=listname%>&content=<%=content%>"	<% out.println(writeList==5?"selected":"");%>>5개씩</option>
								<option value="qna_list.jsp?listSize=10&listname=<%=listname%>&content=<%=content%>"	<% out.println(writeList==10?"selected":"");%>>10개씩</option>
								<option value="qna_list.jsp?listSize=15&listname=<%=listname%>&content=<%=content%>"	<% out.println(writeList==15?"selected":"");%>>15개씩</option>
								<option value="qna_list.jsp?listSize=30&listname=<%=listname%>&content=<%=content%>"	<% out.println(writeList==30?"selected":"");%>>30개씩</option>
								<option value="qna_list.jsp?listSize=50&listname=<%=listname%>&content=<%=content%>"	<% out.println(writeList==50?"selected":"");%>>50개씩</option>
						</select></td>
					</tr>
					<tr class="th">
						<th>번호</th>
						<th colspan = "3">제목</th>
						<th>등록자</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody class = "noticelist">
					<!-- --------------------------------------공지 ----------------------------------------------- -->
					<%
					ArrayList<WriteDTO> notice = qnadao.qna_noticelist();
					if(notice!=null&&notice.size()!=0){
					for(int n=0;n<notice.size();n++){
						//오늘 올라온 글일 경우 new icon 붙이기
						Date nowDate = new Date();
						SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
						String today = simpleDateFormat.format(nowDate); 
						
						String dbdate= simpleDateFormat.format(notice.get(n).getWrite_wdate());
						String newicon= today.equals(dbdate)?"<img src='/seesc/img/ico_n.png' alt = 'new' style = 'width:15px;height:15px;'>":"";
					%>
						<tr class = "td">
						<td>공 지</td>
						<td colspan="3">
						<a href="qna_content.jsp?write_idx=<%=notice.get(n).getWrite_idx()%>"class = "notice"><%=notice.get(n).getWrite_title()%><%=newicon %></a></td>
						<td><%=notice.get(n).getWrite_writer()%></td>
						<td><%=notice.get(n).getWrite_wdate()%></td>
						<td><%=notice.get(n).getWrite_readnum()%></td>
					</tr>
						<%}
					}%>
					</tboby>
					<!-- -------------------------------------- ----------------------------------------------- -->
					<tbody class = "writelist">
					<!-- --------------------------------------게시물 리스트 출력 ----------------------------------------------- -->
					<%

					ArrayList<WriteDTO> arr = qnadao.writeQnAList(userpage,writeList,listname,content);
					if (arr == null || arr.size() == 0) {
					%>
					<tr>
						<td colspan="7">등록된 게시글이 없습니다.</td>
					</tr>
					
					<%
					} else {
					for (int i = 0; i < arr.size(); i++) {
						//게시글 오늘 날짜일경우  new 표시하기
						Date nowDate = new Date();
						SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
						String today = simpleDateFormat.format(nowDate); 
						
						String dbdate= simpleDateFormat.format(arr.get(i).getWrite_wdate());
						String newicon= today.equals(dbdate)?"<img src='/seesc/img/ico_n.png' alt = 'new'style = 'width:15px;height:15px;' >":"";
						
						
						//내가쓴글 알려주기
						String me = 
						user_idx==arr.get(i).getUser_idx()&&user_idx!=0?"<img src='/seesc/img/meme.png' alt = 'me' style='width :25px; height:16px;'>":"";
					%>
					<!-- a태그 post방식으로 보내기 -->
					<form  id = "open_pwd" action = "qnaOpen_pwd.jsp" method = "post">
									<input type ="hidden" name = "write_pwd" value="<%=arr.get(i).getWrite_pwd()%>">
									<input type ="hidden" name = "write_idx" value="<%=arr.get(i).getWrite_idx()%>">
									</form>
					<tr>
						<td><%=arr.get(i).getWrite_idx()%></td>
						<td class="write_title" colspan="3">
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
									<img src="/seesc/img/ico_lock.gif" alt = "비밀글" class = "lock">&nbsp;<%=arr.get(i).getWrite_title()%>&nbsp;[<%=qnadao.commentNum(arr.get(i).getWrite_idx()) %>]<%=newicon %></a>
								<%}else{%>
									<a href="#" onclick="document.getElementById('open_pwd').submit();">
								<img src="/seesc/img/ico_lock.gif" alt = "비밀글" class = "lock">&nbsp;<%=arr.get(i).getWrite_title()%>&nbsp;[<%=qnadao.commentNum(arr.get(i).getWrite_idx()) %>]<%=newicon %></a>
								<%}
							}else{%>
								<a href="qna_content.jsp?write_idx=<%=arr.get(i).getWrite_idx()%>">
								<%=arr.get(i).getWrite_title()%>&nbsp;[<%=qnadao.commentNum(arr.get(i).getWrite_idx()) %>]<%=newicon %></a>
							
							<%} %>
							</td>
							<td><%=me%><%=arr.get(i).getWrite_writer()%></td>
							<td><%=arr.get(i).getWrite_wdate()%></td>
							<td><%=arr.get(i).getWrite_readnum()%></td>
						</tr>

					<%
					}

					}
					%>
					
				</tbody>
				<!-- -----------------------------검색-------------------------------------------------------------- -->
				
				<tfoot class="tfoot">
				<tr><td colspan="7"><br></td></tr>
					<tr>
				<tr>
						<td colspan ="7" align = "right">
						<% String wbutton = manager==0?"qna_upload.jsp":"qna_noticeUpload.jsp"; %>
						<input type="button" value="글작성" onclick= "location.href ='<%=wbutton%>'" class ="writebutton">
						<input type="button" value="목록" onclick= "location.href ='qna_list.jsp'" class = "listbutton"></td>
						</tr>
				<tr>
				<td colspan="7"><br></td>
				</tr>
				
					<form name = "search_list" action = "qna_list.jsp" method = "post">
					<input type = "hidden" name = "listsize" value = "<%=writeList %>">
					<input type = "hidden" name = "userpage" value = "<%=userpage %>">
					
					<td colspan="7" align="center"><select name= "listname" class = "select1">
							<option value ="4">제목+내용</option>
								<option value="1">글제목</option>
								<option value="2">내용</option>
								<option value="3">작성자</option>
						</select> <input type="text" name="content" placeholder="내용입력" required = "required" class="inputtext"> 
						<input type="submit" value="검색"  class = "findbutton"></td>

						</form>
						
					</tr>
						<!-- ------------------------------------------------------------------------------------------- -->
						
						
	
						
						<!-- ---------------------------------------페이징---------------------------------------------------- -->
					<tr>
						<td colspan="7" align="center">
						<input type = "button" onclick ="location.href = 'qna_list.jsp?userpage=<%=1 %><%=data%>'" value = "처음" class="onebutton">
						<%if(pagegroup!=0){
							%>
							<input type="button" onclick = "location.href = 'qna_list.jsp?userpage=<%=(pagegroup-1)*pageList+pageList%><%=data%>'" value = "이전" class="nextbutton">
							<%} 	
						
						
							for(int i=pagegroup*pageList+1;i<=pagegroup*pageList+pageList;i++){
								%>
									<%if(userpage==i){
		%>	<input type="button" onclick = "location.href='qna_list.jsp?userpage=<%=i%><%=data%>'"value = "<%=i%>" class = "prbutton"><%
		}else{
			%>	<input type="button" onclick = "location.href='qna_list.jsp?userpage=<%=i%><%=data%>'"value = "<%=i%>" class = "pagebutton"><%
		} %>
								<%
							if(i==totalpage)break;
							}
							
							if(pagegroup!=(totalpage/pageList-(totalpage%pageList==0?1:0))){
								%>
								<input type = "button" onclick ="location.href = 'qna_list.jsp?userpage=<%=(pagegroup+1)*pageList+1%><%=data%>'" value = "다음" class="nextbutton">
								
							<%}%>
							<input type = "button" onclick ="location.href = 'qna_list.jsp?userpage=<%=totalpage%><%=data%>'" value ="끝" class="onebutton">
						</td>
						</tr>
						<tr><td colspan = "7"><br></td></tr>
				</tfoot>
			</table>
		</article>
	</section>
			<br><br><br>
	<%@include file="/footer.jsp"%>
</body>
</html>