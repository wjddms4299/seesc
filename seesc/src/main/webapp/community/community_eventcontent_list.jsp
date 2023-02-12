<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.esc.write.*" %>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO" scope="session"></jsp:useBean>
<jsp:useBean id="idao" class="com.esc.write.ImgDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="/seesc/css/subLayout.css">
<style>
.pagebutton{
		width: 25px;
        height: 20px;
        border: none;
        border-radius: 5px;
        background-color: #FFA300;
        color: white;
        font-size: 30px;
  }
.pagebutton:hover {
    background-color: #FF870C;
}
.listbutton{
		width: 100px;
        height: 50px;
        border: none;
        border-radius: 10px;
        background-color: #FFA300;
        color: white;
        font-size: 16px;
      }
.listbutton:hover {
    background-color: #FF870C;

}
.listimg{
  		width:275px;
   		height:275px;
        background-color: black;
      }
.listimg:hover {
    background-color: black;
    border: 5px solid #FFA300;

}
.submenu{
position: relative;
width : 1200px;
height : 50px;
margin : 0px auto;
left :380px;
}
table{
	width: 1200px;
	margin: 0px auto;
	border: 3px solid #FFA300;
	
}
thead th{
color:#FFA300;
}
</style>
</head>
<%
int user_idx=session.getAttribute("user_idx")==null||session.getAttribute("user_idx").equals("")?0:(Integer)session.getAttribute("user_idx");
int manager=session.getAttribute("manager")==null||session.getAttribute("manager").equals("")?0:(Integer)session.getAttribute("manager");
int totalCnt=idao.getTotalCnt();
int listSize=8; 
int pageSize=5; 

String cp_s=request.getParameter("cp");
if(cp_s==null || cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);

int totalPage=totalCnt/listSize+1;
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<body>
<%@include file="/header.jsp" %>
<article>
	<div class = "submenu">
	<br>
	<a href="/seesc/community/community_eventcontent_list.jsp"><button class="rbutton"><span>이벤트</span></button></a>
	<a href="/seesc/community/qna_list.jsp"><button class="tbutton"><span>QnA</span></button></a>
	<a href="/seesc/community/community.jsp"><button class="tbutton"><span>자유게시판</span></button></a>
	</div>
	</article>
	<section>
		<article>
			<br><br><br>
			<h1 class ="h1"> Event</h1>
			<br>
			  <hr width="130px">
			  <br><br>
		<table>
		<tr>
			<thead>
				<th width="50px">No</th>
				<th width="200px">제목</th>
				<th width="50px">작성자</th>
				<th width="80px">날짜</th>
				<th width="50px">조회수</th>
			</thead>
		</tr>
		      <%
		ArrayList<WriteDTO> notice = idao.event_noticelist();
		if(notice!=null&&notice.size()!=0){
			for(int i=0;i<notice.size();i++){
		%>
		<tr align="center">
		<td style="color:red;background-color:#FFA300;"><b>-공 지-</b></td>
		<td style="background-color:#FFA300;">
		<a style="text-decoration:none;" href="community_eventcontent_content.jsp?write_idx=<%=notice.get(i).getWrite_idx()%>"><b style="color:black;"><%=notice.get(i).getWrite_title()%></b></a></td>
		<td style="color:red;background-color:#FFA300;"><%=notice.get(i).getWrite_writer()%></td>
		<td style="color:black;background-color:#FFA300;"><%=notice.get(i).getWrite_wdate()%></td>
		<td style="color:black;background-color:#FFA300;"><%=notice.get(i).getWrite_readnum()%></td>
		</tr>
		<%}
			}%>
		</table>	  
		<table>    		
      <tfoot>
      <tr>
      <%
      if(manager==1){%>
      <td colspan="5" align="right">
      <br>
      <b style="color:red;">-관리자모드-</b>
      <br>
      <input style=font-size:15px; type="button" class="listbutton" value=" 공지글쓰기 " onclick="location.href='community_eventcontent_noticeUpload.jsp'">
      <input style=font-size:15px; type="button" class="listbutton" value=" 일반글쓰기 " onclick="location.href='community_eventcontent_write.jsp'">
      </td>
      <%}else{ %>
      <td><br></td> <!--공간만들기-->
  <%//}else{ %> <!-- 일반유저 글쓰기 버튼  --> 
  <!--	<td colspan="5" align="right"><input class="listbutton" style=font-size:15px; type="button" value=" 글쓰기 " onclick="location.href='community_eventcontent_write.jsp'"></td>
  --> <%
      }
      %>
      </tr>	
      	<tr>
      		<td colspan="5" align="center">
      			<!-- -------------------------------------- -->
      			<%
if(userGroup!=0){
	%><a style="text-decoration:none;" href="community_eventcontent_list.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a><% 
	
}
%>
<%
for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
	%>&nbsp;&nbsp;<a style="text-decoration:none;" href="community_eventcontent_list.jsp?cp=<%=i%>"><b class="pagebutton"><%=i %></b>&nbsp;&nbsp;</a><%
	if(i==totalPage)break;
}
%>
<%
if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	%><a style="text-decoration:none;" href="community_eventcontent_list.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%
}
%>
      		<br>
      		<br>
      		<br>
      		</td>
      	</tr>
      </tfoot>
      <tbody>

     <%
     ArrayList<WriteDTO> arr=idao.writeEventList(listSize,cp);
    	 
     if(arr==null||arr.size()==0){  
        %>
        <tr>
           <td colspan="5" align="center">
           <br>
           등록된 글이 없습니다
           <br>
           </td>
        </tr>
        <% 
     }else{
        for(int i=0;i<arr.size();i++){
        %>	
        <form  id ="community_eventcontent_openPwd" action = "community_eventcontent_openPwd.jsp" method = "post">
		<input type ="hidden" name = "write_pwd" value="<%=arr.get(i).getWrite_pwd()%>">
		<input type ="hidden" name = "write_idx" value="<%=arr.get(i).getWrite_idx()%>">
		</form>
        <%
        if(i%4==0){
    		 %>
    		</tr>
    		<tr>
    		  <%
    	 }
        %>
           <td align="center">
              <%
           for(int j=0;j<arr.get(i).getWrite_lev();j++){
        	   out.println("&nbsp;&nbsp;");
           }
           if(arr.get(i).getWrite_lev()>0){
        	   out.println("&#8627;");
           }

           	if(arr.get(i).getWrite_open()==0){
        	   if(manager==1){%>
        	   		<br><a href="community_eventcontent_content.jsp?write_idx=<%=arr.get(i).getWrite_idx() %>"><img class="listimg" src="img/<%=arr.get(i).getWrite_filename()%>"></a>
        	   
        	   <%}else{%>
           			<br><a href="#" onclick="document.getElementById('community_eventcontent_openPwd').submit();"><img class="listimg" src="img/lock.png"></a>
           		<%} 
           	}else{%>
           		<br><a href="community_eventcontent_content.jsp?write_idx=<%=arr.get(i).getWrite_idx() %>"><img class="listimg" src="img/<%=arr.get(i).getWrite_filename()%>"></a>	
           	<%} %>
           <br>No. <%=arr.get(i).getWrite_idx() %>
           <br>
           <%
           for(int j=0;j<arr.get(i).getWrite_lev();j++){
        	   out.println("&nbsp;&nbsp;");
           }
           if(arr.get(i).getWrite_lev()>0){
        	   out.println("&#8627;");
           }
           	if(arr.get(i).getWrite_open()==0){
        	   if(manager==1||user_idx==arr.get(i).getUser_idx()&&user_idx!=0){%>
        	   		<b style="color:red;">[Secret]</b><br><a style="text-decoration:none;" href="community_eventcontent_content.jsp?write_idx=<%=arr.get(i).getWrite_idx() %>"><b style="color:#FFA300;">제목:&nbsp;<%=arr.get(i).getWrite_title()%>&nbsp;[<%=idao.commentNum(arr.get(i).getWrite_idx()) %>]</b></a>
        	   <%}else{%>
           			<b style="color:red;">[Secret]</b><br><a  style="text-decoration:none;" href="#" onclick="document.getElementById('community_eventcontent_openPwd').submit();"><b style="color:#FFA300;">제목:&nbsp;<%=arr.get(i).getWrite_title() %>&nbsp;[<%=idao.commentNum(arr.get(i).getWrite_idx()) %>]</b></a>
           		<%} 
           	}else{%>
           		<b style="color:blue;">[Open]</b><br><a  style="text-decoration:none;" href="community_eventcontent_content.jsp?write_idx=<%=arr.get(i).getWrite_idx() %>"><b style="color:#FFA300;">제목:&nbsp;
           		<%=arr.get(i).getWrite_title() %>&nbsp;[<%=idao.commentNum(arr.get(i).getWrite_idx()) %>]</b></a>	
           	<%} %>	
           <br>작성자: <%=arr.get(i).getWrite_writer() %>
           <br><%=arr.get(i).getWrite_wdate() %>
           <br>조회수: <%=arr.get(i).getWrite_readnum() %></td>
        
        <%
     }
  }
  %>
      </tbody>
   </table>
   </article>
</section>
<br>
<%@include file="/footer.jsp" %>
</body>
</html>