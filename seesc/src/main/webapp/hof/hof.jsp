<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.esc.hof.HofDTO" %>
    <%@page import="java.util.*" %>
    <jsp:useBean id="hofdao" class="com.esc.hof.HofDAO" scope="session"></jsp:useBean>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function openhofUpload(){
	window.open('hofUpload.jsp','upload','width=550,height=700');
}
</script>
<body>
<%@include file="../header.jsp" %>
<section>
<h1>명예의 전당</h1>
<article>
	<ul>
		<li><a href="hof.jsp?thema=이젠401"><button><span>이젠401</span></button></a></li>
		<li><a href="hof.jsp?thema=이젠402"><button><span>이젠402</span></button></a></li>
		<li><a href="hof.jsp?thema=이젠403"><button><span>이젠403</span></button></a></li>
		<li><a href="hof.jsp?thema=이젠404"><button><span>이젠404</span></button></a></li>
		<li><a href="hof.jsp?thema=이젠405"><button><span>이젠405</span></button></a></li>
		<li><a href="hof.jsp?thema=이젠406"><button><span>이젠406</span></button></a></li>
		<li><a href="hof.jsp?thema=이젠407"><button><span>이젠407</span></button></a></li>
	</ul>
</article>
<article>
	<table>
<%
String thema=request.getParameter("thema");
if(thema==null||thema==""){
	thema="이젠401";
}
ArrayList<HofDTO> arr=hofdao.hofList(thema); 
if(arr==null||arr.size()==0){
	%>
	<tr>
	<th>등록된 기록이 없습니다</th>
	</tr>
	<%
}else{
	for(int i=0;i<arr.size();i++){
		if(arr.get(i)==null){
			%>
			<tr>
			<th>등록된 기록이 없습니다</th>
			</tr>
			<%
		}
		%>
		<tr>
		<th><%=i+1 %>위</th>
		<td>
		<div>
		<img src="/escape/write/hofimg/<%=arr.get(i).getHof_imgname()%>"><br>
		<%=arr.get(i).getHof_name() %><br>
		<%=arr.get(i).getHof_date() %><br>
		<%
		int record1=arr.get(i).getHof_record();
		String record=(record1/60)+"분"+(record1%60)+"초";
		%>
		<%=record %>클리어
		</div>
		</td>
		</tr>
		<%
		if(i==2)break;
	}
}
%>
	</table>
	<div>
	<!-- 로그인정보불러와서 관리자일경우에만 보이게@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<input type="button" value="기록올리기" onclick="openhofUpload();">
	</div>
</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>