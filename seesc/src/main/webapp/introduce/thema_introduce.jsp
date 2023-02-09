<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.esc.thema.*" %>
<jsp:useBean id="tdao" class="com.esc.thema.ThemaDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
article div{
	float:left; 
}
table {
width: 800px;
margin: 0 auto;
text-align: center;
padding: 0 auto;


}
table img{
	width: 300px;
	height: 200px;
}
section{
	width:1200px;
	margin:0px auto
}
h1,h2{text-align:center;}

h2{font-size:25px;}


.fontsize{
	font-size: 27px;

}
.color{
	color: #FF8200;
}
</style>
<link rel="stylesheet" type="text/css" href="/seesc/css/mainLayout.css">
<link rel="stylesheet" type="text/css" href="/seesc/css/button.css">
<body>
<%@include file="/header.jsp" %>
<section>
<%
%>
	<article>
<br>
<br>
 <h1 class = "h1">테마 소개</h1>
 <br>
  <hr width="130px">
 <br>
		<table border="1">
		<thead>
			<tr>
				<th>이름</th>
				<th>장르</th>
				<th>설명</th>
				<th>예약하기</th>
			</tr>
		</thead>
		<tbody>
		<%
		ArrayList<ThemaDTO> arr=tdao.themaread();
		String intro="";
		if(arr==null || arr.size()==0){
			%>
			<tr>
				<td>등록된 테마가 없습니다.</td>
			</tr>
			<%
		}else{
			for(int i=0;i<arr.size();i++){
				if(arr.get(i).getThema_intro3()==null){
					intro=arr.get(i).getThema_intro3();
					intro="";
				}else{
					intro=arr.get(i).getThema_intro3();
				}
				%>
				<tr>
					
					<td class="fontsize color"><%=arr.get(i).getThema_name() %><br><img alt="<%=arr.get(i).getThema_idx() %>" src="/seesc/thema_img/<%=tdao.imgread(arr.get(i).getImg_idx())%>"></td>
					<td><%=arr.get(i).getThema_tag1() %>&#44;&nbsp;<%=arr.get(i).getThema_tag2() %>&#44;&nbsp;<%=arr.get(i).getThema_tag3() %></td>
					<td><%=arr.get(i).getThema_intro1() %><br><%=arr.get(i).getThema_intro2() %><br><%=intro %></td>
					<td><input type="button" value="예약하기" onclick="location.href='/seesc/booking/bookingStep01.jsp'"class = "booking_b"></td>
				</tr>
				
				<%				
			}
		}
		
		%>
		</tbody>	
		</table>
		<br><br>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>