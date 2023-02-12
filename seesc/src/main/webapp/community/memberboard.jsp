<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.esc.write.*"%>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/button.css">
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="/seesc/css/subLayout.css">
</head>
<style>
section {
	width: 1200px;
	margin: 0px auto;
}

.select { /*상단 select 박스*/
	width: 100px;
	height: 30px;
	border: none;
	border-radius: 5px;
	background-color: black;
	color: white;
	font-size: 15px;
	margin-left: 20px;
}

#div2 {
	text-align: right;
}

.writedel { /*게시글삭제하기 버튼*/
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

.submenu {
	position: relative;
	width: 1200px;
	height: 50px;
	margin: 0px auto;
	left: 380px;
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
	color: black;
	text-align: center;
	background-color: #FF8200;
}

td {
	color: black;
	text-align: center;
	background-color: white;
}

tfoot {
	text-align: center;
	height: 10px;
}

.prbutton1 { /*해당페이지 눌렀을때*/
	width: 25px;
	height: 20px;
	border: none;
	border-radius: 5px;
	background-color: #ff8200;
	color: white;
	font-size: 20px;
}

#pageing {
	margin-top: 10px;
	color: #FF8200;
}
.onebutton{/*처음,끝*/
		width: 40px;
        height: 25px;
        border: none;
        border-radius: 5px;
        background-color: #ff8200;
        color: white;
        font-size: 20px;
      }
.onebutton:hover {
    background-color: #FACC2E
            color: white;
  }
  .nextbutton{/*다음*/
		width: 40px;
        height: 25px;
        border: none;
        border-radius: 5px;
        background-color: #ff8200;
        color: white;
        font-size: 20px;
      }
.nextbutton:hover {
    background-color: #FACC2E
       color: white;
}  
.prbutton{/*해당페이지 눌렀을때*/
		width: 25px;
        height: 20px;
        border: none;
        border-radius: 5px;
        background-color: #ff8200;
        color: white;
        font-size: 20px;
      }
.pagebutton{/*페이지 버튼*/
		width: 25px;
        height: 20px;
        border: none;
        border-radius: 5px;
        background-color: #dcdcdc;
        color: black;
        font-size: 20px;
      }
.pagebutton:hover {
    background-color: #828282;

}	
a{
	text-decoration: none;
}
</style>
<%

int user_idx=session.getAttribute("user_idx")==null||session.getAttribute("user_idx").equals("")?0:(Integer)session.getAttribute("user_idx"); /*로그인 */

int manager=session.getAttribute("manager")==null || session.getAttribute("manager").equals("")?0:(Integer)session.getAttribute("manager");

int totalCnt=wdao.membergetTotalCnt();//DB로 부터 가져올 정보
int listSize=5;//사용자 마음
int pageSize=5;//사용자 마음

String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);//핵심요소 사용자로부터 가져와야하는 정보

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<br>
		<div  class="submenu">
			<a href="/seesc/community/community_eventcontent_list.jsp"><button class="tbutton"><span>이벤트</span></button></a>
			<a href="/seesc/community/qna_list.jsp"><button class="tbutton"><span>QnA</span></button></a>
			<a href="/seesc/community/community.jsp"><button class="rbutton"><span>자유게시판</span></button></a>

		</div>
		<br><br><br>
		<h2 class="h1">커뮤니티</h2>
		<br>
		<hr>
		<Br>
		<Br>
		<div id="div2">
		<%
				String sort_s = request.getParameter("sort");
				int sort = 0;
				if (sort_s == null || sort_s.equals("")) {
					sort_s = "0";
					sort = Integer.parseInt(sort_s);

				} else {
					sort = Integer.parseInt(sort_s);
				}
				%>
					<select name="sort" onchange="window.location.href=this.value" class="select">
						<option value="memberboard.jsp?cp=<%=cp%>&sort=0" <% out.println(sort==0?"selected":"");%>>번호순</option>
						<option value="memberboard.jsp?cp=<%=cp%>&sort=1" <% out.println(sort==1?"selected":""); %>>조회수 순</option>
						
					</select>
			<span><a href="/seesc/community/memberboard.jsp"><input type="button" value="멤버모집게시판" class="writedel"></a></span>
			</div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				
					<% 
					 ArrayList<WriteDTO> arr=wdao.member(listSize, cp, sort);
					
						if(arr==null || arr.size()==0){
							%>
							<tr>
							<td colspan="5">게시글이 존재하지 않습니다.</td>
							</tr>
							<%
						}else{
							for(int i=0;i<arr.size();i++){
							%>
							<tr>
								<td><%=arr.get(i).getWrite_idx() %></td>
								<td><a href="community_freecontent.jsp?idx=<%=arr.get(i).getWrite_idx()%>"><%=arr.get(i).getWrite_title() %>[<%=wdao.findref(arr.get(i).getWrite_ref())%>]</a></td>
								<td><%=arr.get(i).getWrite_writer() %></td>
								<td><%=arr.get(i).getWrite_wdate() %></td>
								<td><%=arr.get(i).getWrite_readnum() %></td>
							</tr>
							<%
						}
					}
					%>
				
			</tbody>
			<tfoot>
				<tr>
					<%
					if(manager==0){
						%>
						<td colspan="5" >
				<input type="button" value="글쓰기" onclick="location.href='community_write.jsp'" class="writedel">
				</td>
				<% 
					}else if(manager==1){
						%>
						<td colspan="5" >
				<input type="button" value="글쓰기" onclick="location.href='community_write.jsp'"class="writedel">
				<input type="button" value="게시글삭제하기" class="writedel">
				</td>
						<% 
					}
				
				%>
				</tr>
				<tr>
					<td colspan="5" align="center">
									<%
				if(userGroup!=0){
					%><a href="memberboard.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>&sort=<%=sort%>">&lt;&lt;</a><%
				}
				%>
				
				<%
				for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
					%>&nbsp;&nbsp;<a href="memberboard.jsp?cp=<%=i%>&sort=<%=sort%>" class="prbutton1"><%=i %></a>&nbsp;&nbsp;<% 
					if(i==totalPage)break;
				}
				%>
				<%
				if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
					%><a href="memberboard.jsp?cp=<%=(userGroup+1)*pageSize+1%>&sort=<%=sort%>">&gt;&gt;</a> <%
				}
				
				%>
					</td>
				</tr>
			</tfoot>
		</table>
		<br>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>