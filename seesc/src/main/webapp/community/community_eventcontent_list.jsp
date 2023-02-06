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
<style>
h3{
	text-align: center;
	font-size: 30px;
}
table{
	width: 1200px;
	margin: 0px auto;
}
section img{
   width:250px;
   height:250px;
}
th{
background-color: lightgray;
}
</style>
</head>
<%
int user_idx=session.getAttribute("user_idx")==null||session.getAttribute("user_idx").equals("")?0:(Integer)session.getAttribute("user_idx");
int manager=session.getAttribute("manager")==null||session.getAttribute("manager").equals("")?0:(Integer)session.getAttribute("manager");
int totalCnt=wdao.getTotalCnt();
int listSize=10; 
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
<section>
	<article>
	<br>
		<h3>이벤트게시판</h3>
		<br>
	<hr>
	<br>
		<table>
			<thead>
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
      		</thead>
      		
      <tfoot>
      <tr>
      <td colspan="5" align="right"><input style=font-size:15px; type="button" value=" 글쓰기 " onclick="location.href='community_eventcontent_write.jsp'"></td>
      </tr>	
      	<tr>
      		<td colspan="5" align="center">
      			<!-- -------------------------------------- -->
      			<%
if(userGroup!=0){
	%><a href="community_eventcontent.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a><% 
	
}
%>
<%
for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
	%>&nbsp;&nbsp;<a href="community_eventcontent_list.jsp?cp=<%=i%>"><%=i %>&nbsp;&nbsp;<%
	if(i==totalPage)break;
}
%>
<%
if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	%><a href="community_eventcontent_list.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%
}
%>
      			<!-- -------------------------------------- -->
      		</td>
      	</tr>
      </tfoot>
      <tbody>
      <%
		ArrayList<WriteDTO> notice = idao.event_noticelist();
		if(notice!=null&&notice.size()!=0){
			for(int i=0;i<notice.size();i++){
		%>
		<tr align="center">
		<td style=color:blue;>-공 지-</td>
		<td>
		<a href="community_eventcontent_content.jsp?write_idx=<%=notice.get(i).getWrite_idx()%>"><%=notice.get(i).getWrite_title()%></a></td>
		<td style=color:blue;><%=notice.get(i).getWrite_writer()%></td>
		<td><%=notice.get(i).getWrite_wdate()%></td>
		<td><%=notice.get(i).getWrite_readnum()%></td>
		</tr>
		<%}
			}%>
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
       	 if(i%5==0){
    		 %>
    		</tr>
    		<tr>
    		  <%
    	 }
        %>
           <td align="center"><a href="community_eventcontent_content.jsp?write_idx=<%=arr.get(i).getWrite_idx()%>"><img src="img/<%=arr.get(i).getWrite_filename()%>"></a>
           <br>No. <%=arr.get(i).getWrite_idx() %>
           <br>제목: <%=arr.get(i).getWrite_title() %>
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