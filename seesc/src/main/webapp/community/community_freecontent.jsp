<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.write.*" %>
<jsp:useBean id="wdao" class="com.esc.write.WriteDAO" scope="session"></jsp:useBean>
<jsp:useBean id="wdto" class="com.esc.write.WriteDTO" scope="session"></jsp:useBean>
<jsp:useBean id="udao" class="com.esc.userinfo.UserinfoDAO" scope="session"></jsp:useBean>
<%
	String idx_s=request.getParameter("idx");	
	if(idx_s==null || idx_s.equals("")){
		idx_s="0";
	}
	int idx=Integer.parseInt(idx_s);	
	
	session.setAttribute("write_idx", idx_s);
	

	
	int user_idx=session.getAttribute("user_idx")==null||session.getAttribute("user_idx").equals("")?0:(Integer)session.getAttribute("user_idx");
	
	int manager=session.getAttribute("manager")==null || session.getAttribute("manager").equals("")?0:(Integer)session.getAttribute("manager");   //로그인한 회원의 정보
	
	String sid_s=session.getAttribute("sid")==null || session.getAttribute("sid").equals("")?"":(String)session.getAttribute("sid");
		
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="/seesc/css/write.css">
<style>
h3{
 text-align: center;
}

table {
width: 1000px;
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
  background-color: white;
  text-align: center;	
}

#undercontent{
		text-align: CENTER;	
	}

.prbutton1{/*해당페이지 눌렀을때*/
		width: 25px;
        height: 20px;
        border: none;
        border-radius: 5px;
        background-color: #4646CD;
        color: white;
        font-size: 20px;
      }
.writedel{/*게시글삭제하기 버튼*/
		
        height: 30px;
        border: none;
        border-radius: 5px;
        background-color: #4646CD;
        color: white;
        font-size: 20px;
      }
.writedel:hover {
    background-color: #0000CD;
}
#select{
	text-align: center;

}
tfoot{

	text-align: center;
}  


.prbutton1{/*해당페이지 눌렀을때*/
		width: 25px;
        height: 20px;
        border: none;
        border-radius: 5px;
        background-color: #ff8200;
        color: white;
        font-size: 20px;
      }
#img{

	margin-top: 10px;

}
#next{
	text-align: center;
	width:40%;
}
.pagebutton{/*페이지 버튼*/
		width: 25px;
        height: 20px;
        border: none;
        border-radius: 5px;
        background-color: #ff8200;
        color: black;
        font-size: 20px;
      }
.pagebutton:hover {
    background-color: #FACC2E
}

	      textarea {
          width: 600px;
    	  height: 250px;
   	      border: none;
    	  resize: none;
    	  border-radius: 5px;
    	  padding: 10px;
          border: 2px solid #FF8200;
          text-align: center;
  }
  
  
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h3>본문</h3>
		<form name="update2" action="community_freecontent_update.jsp" method="post" enctype="multipart/form-data">
		<table>
		
		<%
		
		WriteDTO dto=wdao.contentWrite(idx);
		int ref=dto.getWrite_ref();
		
		

		int totalCnt=wdao.getUnderTotal(ref);//DB로 부터 가져올 정보
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
		
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
				</tr>
				<tr>
					<th><%=dto.getWrite_idx() %></th>
					<th><%=dto.getWrite_title() %></th>
					<th><%=dto.getWrite_writer() %></th>
					<th><%=dto.getWrite_wdate() %></th>
				</tr>
			</thead>
			<tbody id="content">
				
				<%
				if(dto.getWrite_filename()==null || dto.getWrite_filename().equals("")){
					%>
					<tr>
					<td colspan="4"><textarea cols="50" rows="20" readonly><%=dto.getWrite_content() %></textarea></td>
					</tr>
					<%
				}else{
					%>
					<tr>
					<td colspan="4"><img alt="등록 이미지" id="img" src="/seesc/community/userFile/writeImg/<%=dto.getWrite_filename() %>">
					<textarea cols="50" rows="20" readonly><%=dto.getWrite_content() %></textarea></td>
					</tr>
					<%
				}
				%>	
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4"  id="select">
						<input type="hidden" name="idx"  value="<%=dto.getWrite_idx()%>">
						<input type="hidden" name="write_writer" value=<%=dto.getWrite_writer() %>>
						<input type="button" value="수정하기" class="writedel" onclick="location.href='community_freecontent_update2.jsp'">
						<input type="button" value="목록으로" onclick="location.href='community.jsp'" class="writedel">
						<input type="button" value="삭제하기" onclick="location.href='community_del.jsp?idx=<%=dto.getWrite_idx() %>&writer=<%=dto.getWrite_writer() %>'" class="writedel">
						<input type="button" value="댓글작성하기" onclick="location.href='community_under.jsp?ref=<%=dto.getWrite_ref() %>&lev=<%=dto.getWrite_lev() %>&step=<%=dto.getWrite_step() %>&idx=<%=dto.getWrite_idx() %>'" class="writedel">						
					</td>
				</tr>
			</tfoot>
		</table>
		</form>	
		<hr>
		<fieldset>
			<legend>댓글 보이는곳</legend>
			<table border="1">
			<thead>
				<tr>
					<th>작성자</th>
					<th colspan="2">댓글 내용</th>
					<th>선택지</th>
				</tr>
			</thead>
			<tbody>
			<%
			ArrayList<WriteDTO> arr2=wdao.underList(ref,listSize,cp);
			%>
						<%
			if(arr2==null || arr2.size()==0){
				%>
				<tr>
					<td colspan="4" align="center">등록된 댓글이 없습니다.</td>
				</tr>
				<% 
			}else{
				for(int i=0;i<arr2.size();i++){
					%>
					<tr>
						<td align="left">
						<%=arr2.get(i).getWrite_writer() %>
						</td>
						<td id="undercontent" colspan="2">
						<%
						for(int z=0;z<arr2.get(i).getWrite_lev();z++){
							out.print("&nbsp;&nbsp;");
						}
						%>
						<% 
						if(arr2.get(i).getWrite_open()==1){
							%>
							<%=arr2.get(i).getWrite_content() %>
							<%
						}else{
							%>
							<a href="under_open.jsp?idx=<%=arr2.get(i).getWrite_idx()%>">비밀 댓글입니다</a>
							<%
						}
						
						%>
						</td >
						<td id="next"><input type="button" value="삭제하기" class="writedel" onclick="location.href='under_del.jsp?idx=<%=arr2.get(i).getWrite_idx()%>&write_idx=<%=(String)session.getAttribute("write_idx")%>&write_ref=<%=dto.getWrite_ref()%>&write_lev=<%=arr2.get(i).getWrite_lev()%>&write_step<%=arr2.get(i).getWrite_step()%>'">
							<input type="button" value="답글하기" class="writedel" onclick="location.href='under_answer.jsp?ref=<%=arr2.get(i).getWrite_ref() %>&lev=<%=arr2.get(i).getWrite_lev() %>&step=<%=arr2.get(i).getWrite_step()%>&write_idx=<%=dto.getWrite_idx() %>&write_content=<%=arr2.get(i).getWrite_content()%>'">
					</tr>
					<% 
				}
			}
			%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4" ><!-- 페이징 들어갈 영역 -->
										<%
if(userGroup!=0){
	%><a href="community_freecontent.jsp?idx=<%=idx %>&cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a><%
}
%>

<%
for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
	%>&nbsp;&nbsp;<a href="community_freecontent.jsp?idx=<%=idx %>&cp=<%=i%>" class="prbutton1"><%=i %></a>&nbsp;&nbsp;<% 
	if(i==totalPage)break;
}
%>
<%
if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
	%><a href="community_freecontent.jsp?idx=<%=idx %>&cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a> <%
}

%>
						
						
						</td>
					</tr>
				</tfoot>
			</table>
		</fieldset>
		</article>
		</section>
<%@include file="/footer.jsp" %>
</body>
</html>