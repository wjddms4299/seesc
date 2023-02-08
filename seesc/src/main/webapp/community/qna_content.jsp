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

//게시글 오늘 날짜일경우 표시하기
Date nowDate = new Date();
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
String today = simpleDateFormat.format(nowDate); 

String dbdate= simpleDateFormat.format(dto.getWrite_wdate());
String newicon= today.equals(dbdate)?"<img src='/seesc/img/ico_n.png' alt = 'new' style = 'width:15px;height:15px;'>":"";



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="/seesc/css/write.css">

<style>

ul, li {
	list-style: none;
}

a {
	text-decoration: none;
}

</style>
</head>
<body>
	<%@include file="/header.jsp"%>
<%
	sid = (String) session.getAttribute("sid");
	UserinfoDTO udto = userdao.userInfo(sid);
%>
	
	<section>
		<!-- ----------------------------본문 글보기--------------------------------------------- -->
		<article>
			
			<br><br><br>
			<h1 class ="h1">QnA 본문보기</h1><br>
			  <hr width="130px">
			  <br><br>
			  
			  
			<table>
				<tbody>
					<tr>
						<th>제목</th>
						<td><%=dto.getWrite_title()%></td>
					</tr>
					<tr>
						<th>작성시간</th>
						<td><%=dto.getWrite_wdate()%></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%=dto.getWrite_writer()%></td>
					</tr>
					<tr>
						<th>첨부파일</th>
							<td><a href="/seesc/community/userFile/<%=dto.getWrite_filename()%>" target="_blank">
							<% out.println(dto.getWrite_filename()!=null?dto.getWrite_filename()+"</a>":"</a>첨부된 파일 없음");%></a></td>
					</tr>
					<% if(dto.getWrite_filename()!=null){%>
					<tr>
					<td colspan ="2"><img src="/seesc/community/userFile/<%=dto.getWrite_filename()%>" alt = "사용자업로드이미지 "></td>
					</tr>
					<%} %>
					<tr>
						<td colspan ="2"><textarea rows="10" cols="50" name="write_content" readonly><%=dto.getWrite_content()%></textarea></td>
					</tr>
	
			<!-- --------------------------본문 삭제,수정,답글--------------------------->
		

				<%
				if(dto.getWrite_notice()==1 && manager!=1){%><!-- 공지글일경우 삭제 기능 없음 -->
					<tr>
						<td colspan="2">
							<input type="button" value="목록으로 돌아가기" onclick="location.href = 'qna_list.jsp'">
						</td>
					</tr>
				<% }else if(manager==1 || user_idx == dto.getUser_idx()&&user_idx!=0){%> <!-- 관리자 또는 작성자 본인이면 바로 삭제 할 수 있는 기능  -->
				<tr>
					<td colspan="2">
						<input type="button" value="삭제" onclick ="location.href ='qna_delete_ok.jsp?flag=userDelete&write_idx=<%=write_idx%>'">
						<input type="button" value="수정" onclick="location.href = 'qna_update.jsp?flag=userUpdate&write_idx=<%=write_idx%>'">
						<input type="button" value="목록" onclick="location.href = 'qna_list.jsp'">
				
						<form name = "qna_rewrite" action="qna_repWrite.jsp" method ="post">
						<input type="hidden" name="write_idx" value="<%=write_idx%>">
						<input type = "hidden" name = "user_idx" value = "<%=user_idx %>">
						<input type = "hidden" name = "write_title" value = "<%=dto.getWrite_title()%>">
						<input type = "hidden" name = "write_content" value = "<%=dto.getWrite_content()%>">
						<input type ="hidden" name = "write_ref" value = "<%=dto.getWrite_ref()%>">
						<input type = "hidden" name = "write_lev" value = "<%=dto.getWrite_lev()%>">
						<input type = "hidden" name = "write_step" value = "<%=dto.getWrite_step()%>">
						<input type="submit" value="답글">
						</form>
					</td>
				</tr>
				<%}else {%> <!-- 비회원이면 비밀번호 입력후 수정과 삭제 가능하게 -->
				<tr>
					<td colspan="2">
						<form name="qna_wdu" method="post">
						<input type="hidden" name="write_idx" value="<%=write_idx%>">
						<input type="hidden" name="write_pwd" value="<%=dto.getWrite_pwd()%>"> 
						글을 삭제하거나 수정할 경우 비밀번호를 입력해주세요.<br>
						<input type="password" name="userinput_pwd" required="required">
						<input type="submit" value="삭제" onclick="javascript:qna_wdu.action='qna_delete_ok.jsp';">
						<input type="submit" value="수정" onclick="javascript:qna_wdu.action='qna_update.jsp';">
						<input type="button" value="목록" onclick="location.href = 'qna_list.jsp'">
						</form>
						
						<form name = "qna_rewrite" action="qna_repWrite.jsp" method ="post">
						<input type="hidden" name="write_idx" value="<%=write_idx%>">
						<input type = "hidden" name = "user_idx" value = "<%=user_idx %>">
						<input type = "hidden" name = "write_title" value = "<%=dto.getWrite_title()%>">
						<input type = "hidden" name = "write_content" value = "<%=dto.getWrite_content()%>">
						<input type ="hidden" name = "write_ref" value = "<%=dto.getWrite_ref()%>">
						<input type = "hidden" name = "write_lev" value = "<%=dto.getWrite_lev()%>">
						<input type = "hidden" name = "write_step" value = "<%=dto.getWrite_step()%>">
						<input type = "submit" value ="답글">
						</form>
					</td>
				</tr>
				<%} %>
			</tbody>
			</table>

		</article>
		
		
			<%if(dto.getWrite_notice()!=1){ %> <!-- 공지글일 경우 댓글 작성 막아두기 -->
			<!-- ---------------------댓글 출력----------------------------------------- -->
		<article>
			
				<legend>댓글</legend>
				<table class = "tb">
				
				<%
				ArrayList<CommentDTO> arr = qnadao.commentList(write_idx);
				String flag = request.getParameter("flag");
				if (arr != null && arr.size() != 0) {
					for (int i = 0; i < arr.size(); i++) {
						//댓글 작성자가 본문 작성자와 동일할경우 알려주기
						String me = 
						dto.getUser_idx()==arr.get(i).getUser_idx()?"<img src='/seesc/img/me.png' alt = '작성자' style='width :35px; height:25px;'>":"";
				%>
				<tr>
				<td onclick="location.href = 'qna_content.jsp?comm_idx=<%=arr.get(i).getComm_idx()%>&write_idx=<%=write_idx%>&flag=commentwrite'">
					<%
					for (int z = 0; z < arr.get(i).getComm_lev(); z++) {
						out.print("&nbsp;&nbsp;");
					}
					if (arr.get(i).getComm_lev() > 0) {
						out.print("&nbsp;&nbsp;&#8627;");
					}
					%>
					<%=me%><%=arr.get(i).getComm_writer()%>&nbsp;|&nbsp;<%=arr.get(i).getComm_content()%>&nbsp;|&nbsp;<%=arr.get(i).getComm_date()%><%=newicon %>
					
					<%if(manager==1){%>
					<a href="comment_Delete.jsp?comm_idx=<%=arr.get(i).getComm_idx()%>&write_idx=<%=write_idx%>&flag=commdel">
					<img src="/seesc/img/s_delete.gif" alt = "댓글삭제">
					</a>
					</td>
							<%}else if(user_idx == dto.getUser_idx()&&user_idx!=0&&arr.get(i).getUser_idx()==user_idx){%>
								<a href="comment_Delete.jsp?comm_idx=<%=arr.get(i).getComm_idx()%>&write_idx=<%=write_idx%>&flag=commdel">
								<img src="/seesc/img/s_delete.gif" alt = "댓글삭제">
								</a>
							<%}else{%>
							
							<a href="qna_content.jsp?comm_idx=<%=arr.get(i).getComm_idx()%>&write_idx=<%=write_idx%>&flag=delete">
							<img src="/seesc/img/s_delete.gif" alt = "댓글삭제">
							</a>
							</td>
							</tr>
							<tr>
						<%
				
						if (comm_idx == arr.get(i).getComm_idx()&flag!=null&&flag.equals("delete")) {%>	
							<td>
							<form name= "commentdelete" action = "comment_Delete.jsp">
							<input type="password" name="userinputpwd" placeholder="비밀번호" required>
							<input type="hidden" name="comm_pwd" value="<%=arr.get(i).getComm_pwd()%>">
							<input type="hidden" name="comm_idx" value="<%=arr.get(i).getComm_idx()%>">
							<input type="hidden" name="write_idx" value="<%=write_idx%>">
							<input type="submit" value="삭제">
							<input type="button"value="닫기" onclick="location.href = 'qna_content.jsp?write_idx=<%=write_idx%>'">
							</form>
							</td>
							</tr>
					<%}
					}%>

				<!-- -------대댓글달기 ------- -->
				<%
				if (comm_idx == arr.get(i).getComm_idx()&&flag!=null&&flag.equals("commentwrite")) {
					if(manager==1 || user_idx == dto.getUser_idx()&&user_idx!=0){%>
						<tr>
						<td>➥<%=udto.getUser_nic()%></td>
						</tr>
								<form name="co_comment" action="comenRe_ok.jsp" method="post">
									<tr>
									<td>
									<input type="hidden" name="write_idx" value="<%=write_idx%>">
									<input type="hidden" name="user_idx" value="<%=user_idx%>">
									<input type="hidden" name="comm_ref"value="<%=arr.get(i).getComm_ref()%>">
									<input type="hidden" name="comm_lev" value="<%=arr.get(i).getComm_lev()%>">
									<input type="hidden" name="comm_step" value="<%=arr.get(i).getComm_step()%>"> 
									<input type="hidden" name="comm_writer" value = "<%=udto.getUser_nic()%>">
									</td>
									</tr>
									<tr>
									<td>
									<textarea rows="2" cols="40" name="comm_content" placeholder="내용을 작성해주세요" required></textarea>
									<input type="submit" value="등록">
									<input type="button"value="닫기" onclick="location.href = 'qna_content.jsp?write_idx=<%=write_idx%>'">
									</td>
									</tr>								
								</form>
						<%}else{%>
							<form name="co_comment" action="comenRe_ok.jsp" method="post">
							<tr>
							<td>
							➥
							<input type="text" name="comm_writer" placeholder="작성자" required>
							<input type="password" name="comm_pwd" placeholder="비밀번호" required>
							<input type="hidden" name="write_idx" value="<%=write_idx%>">
							<input type="hidden" name=user_idx value="<%=user_idx%>">
							<input type="hidden" name="comm_ref"value="<%=arr.get(i).getComm_ref()%>">
							<input type="hidden" name="comm_lev" value="<%=arr.get(i).getComm_lev()%>">
							<input type="hidden" name="comm_step" value="<%=arr.get(i).getComm_step()%>"> 
							<input type="hidden" name="flag" value = "commentwrite">
							
							</td>
							</tr>
							<tr>
							<td>
							<textarea rows="2" cols="40" name="comm_content" placeholder="내용을 작성해주세요" required></textarea>
							<input type="submit" value="등록">
							<input type="button"value="닫기" onclick="location.href = 'qna_content.jsp?write_idx=<%=write_idx%>'">
							</td>
						</tr>
							</form>

				<%
							}	
						}
					}
				}
				%>

			</table>


			<!-- ----------------본문에 대한 댓글 작성 -------------------------------------------->
			<form name="comment" action="comment_ok.jsp" method="post">
				<input type="hidden" name="write_idx" value="<%=write_idx%>">
				<input type="hidden" name="user_idx" value=<%=user_idx%>>
			
				<table>
				<%if(manager==1 || user_idx == dto.getUser_idx()&&user_idx!=0){%>
					<tr>
					<td><input type="hidden" name="comm_writer" value = "<%=udto.getUser_nic()%>" readonly>
					<%=udto.getUser_nic()%></td>
					
					
				<%}else{%>
					<tr>
						<td>
						<input type="text" name="comm_writer" placeholder="작성자" required>
						<input type="password" name="comm_pwd" placeholder="비밀번호" required>
						</td>
					</tr>
					<%} %>
					<tr>
						<td><textarea rows="2" cols="40" name="comm_content" placeholder="내용을 작성해주세요" required></textarea>
						<input type="submit" value="등록"></td>
					</tr>
				</table>
	
			</form>
		</article>
		<%} %>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>