<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.esc.write.*" %>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<style>
h3{
 text-align: center;
}
table{
   width:550px;
   border-top:3px double darkblue;
   border-bottom: 3px double darkblue;
   border-spacing: 0px;
   margin:0px auto;
}
table thead th{
   background-color: skyblue;
}
section div{
   text-align: right;
}
section div input{
   margin-right:80px;
}
section img{
   width:80px;
   height:80px;
}
</style>
</head>
<%
int totalCnt=wdao.getTotalCnt(); //DB
int listSize=10; //내맘
int pageSize=5; //내맘

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
		<h3>이벤트게시판</h3>
		<table>
			<thead>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
      </thead>
      <tfoot>
      	<tr>
      		<td colspan="3" align="center">
      			<!-- -------------------------------------- -->
      			<%
if(userGroup!=0){
	%><a href="community_eventcontent.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a><% 
	
}
%>
<%
for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
	%>&nbsp;&nbsp;<a href="community_eventcontent.jsp?cp=<%=i%>"><%=i %>&nbsp;&nbsp;<%
	if(i==totalPage)break;
}
%>
<%
if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	%><a href="community_eventcontent.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%
}
%>
      			<!-- -------------------------------------- -->
      		</td>
      		<td align="center"><input type="button" value="글쓰기" onclick="location.href='community.jsp'"></td>
      	</tr>
      </tfoot>
      <tbody>
     <%
     ArrayList<WriteDTO> arr=wdao.selWrite(listSize,cp);
     if(arr==null||arr.size()==0){  
        %>
        <tr>
           <td colspan="4">
           등록된 글이 없습니다
           </td>
        </tr>
        <% 
     }else{
        for(int i=0;i<arr.size();i++){
           %>
           <tr>
              <td><%=arr.get(i).getWrite_title() %></td>
              <td></td>
              <td></td>
              <td></td>
           </tr>
           <% 
        }
     }
     %>
      </tbody>
   </table>
   </article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>