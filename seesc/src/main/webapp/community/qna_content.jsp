<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
	
<%@page import="java.util.*"%>
<%@page import="com.esc.write.*"%>
<%@page import="com.esc.userinfo.*"%>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope="session"></jsp:useBean>
<jsp:useBean id="userdao" class="com.esc.userinfo.UserinfoDAO"
	scope="session"></jsp:useBean>
<%
int user_idx = session.getAttribute("user_idx") == null || session.getAttribute("user_idx").equals("")? 0: (int) session.getAttribute("user_idx");
int manager = session.getAttribute("manager") == null || session.getAttribute("manager").equals("")? 0: (int) session.getAttribute("manager");

int write_idx= request.getParameter("write_idx")==null||request.getParameter("write_idx").equals("")?0:Integer.parseInt(request.getParameter("write_idx"));
int comm_idx = request.getParameter("comm_idx")==null||request.getParameter("comm_idx").equals("")?0:Integer.parseInt(request.getParameter("comm_idx"));


WriteDTO dto = qnadao.writeQnAContent(write_idx);

if (dto == null||dto.equals("")) {
%>
<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location.href = '/seesc/community/qna_list.jsp';
</script>
<%
return;
}
/**답글있으면 삭제 못함 */
UserinfoDTO udto = userdao.userInfo_Idx(dto.getUser_idx());
boolean writer_m;
if(udto!=null&&!udto.equals("")){
	writer_m = udto.getManager()!=0?true:false;
}else{
	writer_m = false;
}

//게시글 오늘 날짜일경우 표시하기
Date nowDate = new Date();
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
String today = simpleDateFormat.format(nowDate); 
						
String dbdate= simpleDateFormat.format(dto.getWrite_wdate());
String todayW = today.equals(dbdate)?qnadao.writetime(write_idx):dbdate;



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="/seesc/css/write.css">

</head>

<body>
	<%@include file="/header.jsp"%>
	
	<section>
		<!-- ----------------------------본문 글보기--------------------------------------------- -->
		<article>
			
			<br><br><br>
			<h1 class ="h1">QnA 본문보기</h1><br>
			  <hr width="130px">
			  <br><br>
			  
			  
			<table class = "content">
				<tbody >
					<tr>
						<th>제목</th>
						<td colspan="3" class ="bottom"><%=dto.getWrite_title()%></td>
					</tr>
					
					<tr>
						<th>작성자</th>
						<!-- 작성자 회원일경우 관리자가 예약내역 확인후 예약 취소할 수 있음.-->
							<%
							int writeUser_idx = dto.getUser_idx();
							int userM = userdao.mngnum(writeUser_idx);
							String memberCh = "";
							if(userM!=0){
								memberCh = "<img src='/seesc/img/login_manager.png' alt = '관리자' style='width :20px; height:20px;'>";
							}else if(writeUser_idx==0&&userdao.mngnum(writeUser_idx)==0){
								memberCh = "<img src='/seesc/img/login_no.png' alt = '비회원' style='width :20px; height:20px;'>";
							}else{
								memberCh ="<img src='/seesc/img/login_main.png' alt = '회원' style='width :20px; height:20px;'>";
							}
								
							if(dto.getUser_idx()!=0&&manager!=0&&userM==0){%>
								<td class ="bottom" style ="width :40%"><a href ="/seesc/booking/member_bookingcheck.jsp?user_idx=<%=dto.getUser_idx()%>" target="_blank"><%=memberCh%><%=dto.getWrite_writer()%></a></td>
							<%}else{%> 
							<td class ="bottom" style ="width :40%"><%=memberCh%><%=dto.getWrite_writer()%></td>
							<%} %>
						<th >등록일</th>
						<td class ="bottom" ><%=todayW%></td>
					</tr>
					<tr>
						<th>첨부파일</th>
							<td colspan="3" class ="bottom"><a href="/seesc/community/userFile/<%=dto.getWrite_filename()%>" target="_blank">
							<% out.println(dto.getWrite_filename()!=null?dto.getWrite_filename()+"</a>":"</a>첨부된 파일 없음");%></a></td>
					</tr>
					<% if(dto.getWrite_filename()!=null){%>
					<tr>
					<td colspan ="4" style = "text-align:center;"><img src="/seesc/community/userFile/<%=dto.getWrite_filename()%>" alt = "사용자업로드이미지 " style ="width :800px; height : 300px; object-fit: contain;"></td>
					</tr>
					<%} %>
					<tr><th>내용</th>
						<td colspan="3"><textarea rows="10" cols="50" name="write_content" readonly><%=dto.getWrite_content()%></textarea></td>
					</tr>
			</tbody>
			<!-- --------------------------본문 삭제,수정,답글--------------------------->
			<tfoot class = "tfoot">
				<tr><td colspan = "4">&nbsp;</td></tr>
					<tr><td colspan = "4">&nbsp;</td></tr>
				<tr><td colspan = "4">&nbsp;</td></tr>
				<%
				if(dto.getWrite_notice()==1 && manager!=1){%><!-- 공지글일경우 삭제 기능 없음 -->
					<tr>
						<td colspan="4" style = "text-align : center;">
							<input type="button" value="목록" onclick="location.href = 'qna_list.jsp'">
						</td>
					</tr>
				<% }else if(manager==1 && user_idx != dto.getUser_idx()&&user_idx!=0 && dto.getWrite_notice()==0){%> <!-- 관리자면 답글 쓸 수 있음 -->
				<tr>
				<td colspan="4" style = "text-align : center;">
					<form name = "qna_rewrite" action="qna_repWrite.jsp" method ="post">
					<input type="button" value="삭제" onclick ="javascript: var result =window.confirm('삭제하시겠습니까?');if(result){location.href ='qna_delete_ok.jsp?flag=userDelete&write_idx=<%=write_idx%>'}"style = "backgroud-color : black; font-weight : bold;">
					<input type="submit" value="답글">
					<input type="button" value="목록" onclick="location.href = 'qna_list.jsp'">
					<input type="hidden" name="write_idx" value="<%=write_idx%>">
					<input type = "hidden" name = "user_idx" value = "<%=user_idx %>">
					<input type = "hidden" name = "write_title" value = "<%=dto.getWrite_title()%>">
					<input type = "hidden" name = "write_content" value = "<%=dto.getWrite_content()%>">
					<input type = "hidden" name = "write_pwd" value = "<%=dto.getWrite_pwd()%>">					
					<input type ="hidden" name = "write_ref" value = "<%=dto.getWrite_ref()%>">
					<input type = "hidden" name = "write_lev" value = "<%=dto.getWrite_lev()%>">
					<input type = "hidden" name = "write_step" value = "<%=dto.getWrite_step()%>">
					<input type = "hidden" name = "user_idx" value = "<%=user_idx %>">
					
					</form>
				</td>
			</tr>
			<%}else if(manager==1 || user_idx == dto.getUser_idx()&&user_idx!=0){%> <!-- 관리자 또는 작성자 본인이면 바로 삭제 할 수 있는 기능  -->
				<tr>
					<td colspan="4" style = "text-align : center;">
						<input type="submit" value="삭제" onclick ="javascript: var result =window.confirm('삭제하시겠습니까?');if(result){location.href ='qna_delete_ok.jsp?flag=userDelete&write_idx=<%=write_idx%>'}"style = "backgroud-color : black; font-weight : bold;">
						<input type="button" value="수정" onclick="location.href = 'qna_update.jsp?flag=userUpdate&write_idx=<%=write_idx%>'">
						<input type="button" value="목록" onclick="location.href = 'qna_list.jsp'">
					</td>
				</tr>
				<%}else if(manager==0&&writer_m==false){%> <!-- 관리자글은 수정 삭제 못함.-->
				<tr>
				<td colspan="4" style = "text-align : center;">
					<input type="button" value="목록" onclick="location.href = 'qna_list.jsp'">
				</td>
			</tr>
			<%}else {%> <!-- 비회원이면 비밀번호 입력후 수정과 삭제 가능하게 -->
				<tr>
				<td colspan="4" style = "text-align : center;">글을 삭제하거나 수정할 경우 작성시 입력했던 비밀번호를 입력해주세요.</td>
				</tr>
				<tr>
					<td colspan="4" style = "text-align : center;" id="secret">
						<form name="qna_wdu" method="post">
						<input type="hidden" name="write_idx" value="<%=write_idx%>">
						<input type="hidden" name="write_pwd" value="<%=dto.getWrite_pwd()%>"> 
						<input type="password" name="userinput_pwd" required="required">
						<input type="submit" value="삭제"
						onclick="javascript: var result =window.confirm('삭제하시겠습니까?');if(result){qna_wdu.action='qna_delete_ok.jsp';}" >
						<input type="submit" value="수정" onclick="javascript:qna_wdu.action='qna_update.jsp';">
						<input type="button" value="목록" onclick="location.href = 'qna_list.jsp'">
						</form>
					</td>
				</tr>
				<%} %>
				<tr><td>&nbsp; </td></tr>
				<tr><td>&nbsp; </td></tr>
				<tr><td>&nbsp; </td></tr>
				<tr><td>&nbsp; </td></tr>
			<tfoot>
			</table>
		</article>
	</section>
	<br><br><br>
	<%@include file="/footer.jsp"%>
</body>
</html>