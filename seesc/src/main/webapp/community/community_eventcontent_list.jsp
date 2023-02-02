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
	width: 660px;
	margin: 0px auto;
}
section img{
   width:250px;
   height:250px;
}
</style>
</head>
<%
int user_idx=session.getAttribute("user_idx")==null||session.getAttribute("user_idx").equals("")?0:(int)session.getAttribute("user_idx");
int manager=session.getAttribute("manager")==null||session.getAttribute("manager").equals("")?0:(int)session.getAttribute("manager");
int totalCnt=wdao.getTotalCnt();
int listSize=12; 
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
		<table>
			<thead>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
      </thead>
      <tfoot>
      	<tr>
      		<td colspan="4" align="center">
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
      		<td align="center"><input type="button" value="글쓰기" onclick="location.href='community_eventcontent_write.jsp'"></td>
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
       	 if(i%4==0){
    		 %>
    		</tr>
    		<tr>
    		  <%
    	 }
        %>
           <td align="center"><a href="community_eventcontent_content.jsp?write_idx=<%=arr.get(i).getWrite_idx()%>"><img src="img/<%=arr.get(i).getWrite_filename()%>"></a>
           <br>No. <%=arr.get(i).getWrite_idx() %>
           <br>제목: <%=arr.get(i).getWrite_title() %>
           <br><%=arr.get(i).getWrite_writer() %>
           <br><%=arr.get(i).getWrite_wdate() %>
           <br><%=arr.get(i).getWrite_readnum() %></td>
        
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