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

<style>
.rankrel{
position: fixed;
left: 50px;
bottom: 19px;
z-index: 2;
}
	.rank{
	width: 220px;
	height: 415px;
	text-align: center;
	}
 .rank:nth-child(1) {
    text-align: center;
    border: 3px double gold;
  }
  .rank:nth-child(1) span{
  color: gold;
  font-size: 30px;
  }

  .rank:nth-child(2) {
    float: left;
    margin-right: 10px;
    border: 3px double silver;
  }
  .rank:nth-child(2) span{
  color: silver;
  font-size: 30px;
  }

  .rank:nth-child(3) {
    float: right;
    margin-left: 10px;
    border: 3px double brown;
  }
  .rank:nth-child(3) span{
  color: brown;
  font-size: 30px;
  }
  .name{
  font-size: 20px;
  }
  .rank1{
  width: 70%;
  }
</style>
<script>
function openhofUpload(){
	window.open('hofUpload.jsp','upload','width=550,height=700');
}
</script>
<%
String thema=request.getParameter("thema");
if(thema==null||thema==""){
	thema="이젠401";
}
%>
	<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
	<link rel = "stylesheet" type = "text/css" href = "/seesc/css/subLayout.css">
<body>
<%@include file="../header.jsp" %>
<section>
<h1>명예의 전당</h1>
<article>
	<div>
		<%if(thema.equals("이젠401")){
			%><a href="hof.jsp?thema=이젠401"><button class="rbutton"><span>이젠401</span></button></a><%
		}else{
			%><a href="hof.jsp?thema=이젠401"><button class="tbutton"><span>이젠401</span></button></a><%
		} %>
		<%if(thema.equals("이젠402")){
			%><a href="hof.jsp?thema=이젠402"><button class="rbutton"><span>이젠402</span></button></a><%
		}else{
			%><a href="hof.jsp?thema=이젠402"><button class="tbutton"><span>이젠402</span></button></a><%
		} %>
		<%if(thema.equals("이젠403")){
			%><a href="hof.jsp?thema=이젠403"><button class="rbutton"><span>이젠403</span></button></a><%
		}else{
			%><a href="hof.jsp?thema=이젠403"><button class="tbutton"><span>이젠403</span></button></a><%
		} %>
		<%if(thema.equals("이젠404")){
			%><a href="hof.jsp?thema=이젠404"><button class="rbutton"><span>이젠404</span></button></a><%
		}else{
			%><a href="hof.jsp?thema=이젠404"><button class="tbutton"><span>이젠404</span></button></a><%
		} %>
		<%if(thema.equals("이젠405")){
			%><a href="hof.jsp?thema=이젠405"><button class="rbutton"><span>이젠405</span></button></a><%
		}else{
			%><a href="hof.jsp?thema=이젠405"><button class="tbutton"><span>이젠405</span></button></a><%
		} %>
		<%if(thema.equals("이젠406")){
			%><a href="hof.jsp?thema=이젠406"><button class="rbutton"><span>이젠406</span></button></a><%
		}else{
			%><a href="hof.jsp?thema=이젠406"><button class="tbutton"><span>이젠406</span></button></a><%
		} %>
		<%if(thema.equals("이젠407")){
			%><a href="hof.jsp?thema=이젠407"><button class="rbutton"><span>이젠407</span></button></a><%
		}else{
			%><a href="hof.jsp?thema=이젠407"><button class="tbutton"><span>이젠407</span></button></a><%
		} %>
		
		
		
	</div>
</article>
<br><br>
<article>
	
<%

ArrayList<HofDTO> arr=hofdao.hofList(thema); 
if(arr==null||arr.size()==0){
	%>
	<div>
	등록된 기록이 없습니다
	</div>
	<%
}else{
	%><div class="rank1"><%
	for(int i=0;i<arr.size();i++){
		if(arr.get(i)==null){
			%>
			<div>
			등록된 기록이 없습니다
			</div>
			<%
		}
		%>
		<div class="rank">
		<span><%=i+1 %>위</span>
		
		
		<img src="/seesc/hof/hofimg/<%=arr.get(i).getHof_imgname()%>" width="200" height="300"><br>
		<a class="name"><%=arr.get(i).getHof_name() %></a><br>
		<%=arr.get(i).getHof_date() %><br>
		<%
		int record1=arr.get(i).getHof_record();
		String record=(record1/60)+"분"+(record1%60)+"초";
		%>
		<%=record %>클리어
		</div>
		
		<%
		if(i==2)break;
	}
	%></div><%
}
%>
</article>
<%
	int manager=0;
	if(session.getAttribute("manager")!=null){
		manager=(int)session.getAttribute("manager");
	if(manager>0){
		%>
		<div class="rankrel">
			<input type="button" value="기록올리기" onclick="openhofUpload();" class="tbutton">
		</div>
		<%
	}
	}
	%>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>