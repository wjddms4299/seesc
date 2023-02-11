<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.esc.hof.HofDTO" %>
    <%@page import="java.util.*" %>
    <%@page import="com.esc.thema.*" %>
    <jsp:useBean id="hofdao" class="com.esc.hof.HofDAO" scope="session"></jsp:useBean>
    <jsp:useBean id="thedao" class="com.esc.thema.ThemaDAO" scope="session"></jsp:useBean>
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

@keyframes sparkle {
  	0% {
    color: white;
    text-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
  }
  50% {
    color: yellow;
    text-shadow: 0 0 20px rgba(255, 255, 0, 0.5);
  }
  100% {
    color: white;
    text-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
  }
}
@keyframes sparkle1 {
  	0% {
    color: white;
    text-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
  }
  50% {
    color: silver;
    text-shadow: 0 0 20px rgba(255, 255, 0, 0.5);
  }
  100% {
    color: white;
    text-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
  }
}
@keyframes sparkle2 {
  	0% {
    color: white;
    text-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
  }
  50% {
    color: #803232;
    text-shadow: 0 0 20px rgba(255, 255, 0, 0.5);
  }
  100% {
    color: white;
    text-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
  }
}
 .rank:nth-child(1) {
    text-align: center;
    border: 10px solid gold;
    animation: sparkle 1s ease-in-out infinite;
  }
  .rank:nth-child(1) span{
  color: gold;
  font-size: 30px;
  }

  .rank:nth-child(2) {
    float: left;
    margin-right: 10px;
    border: 10px solid silver;
    animation: sparkle1 1s ease-in-out infinite;
  }
  .rank:nth-child(2) span{
  color: silver;
  font-size: 30px;
  }

  .rank:nth-child(3) {
    float: right;
    margin-left: 10px;
    border: 10px solid #803232;
    animation: sparkle2 1s ease-in-out infinite;
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
  .themabt{
  margin: 0px auto;
  text-align: center;
  }
</style>
<script>
function openhofUpload(){
	window.open('hofUpload.jsp','upload','width=550,height=450');
}
</script>
<%
ArrayList<ThemaDTO> arr1=thedao.allThema();
String thema=request.getParameter("thema");
if(thema==null||thema==""||arr1!=null||arr1.size()!=0){
	thema=arr1.get(0).getThema_name();
}
%>
	<link rel = "stylesheet" type = "text/css" href = "/seesc/css/mainLayout.css">
	<link rel = "stylesheet" type = "text/css" href = "/seesc/css/subLayout.css">
<body>
<%@include file="../header.jsp" %>
<section>
<br><br>
<h1 class ="h1">명예의 전당</h1>
         <br>
           <hr width="130px">
           <br>
<article  class="themabt">
	<div>
		<%
		if(arr1==null||arr1.size()==0){
			%><span>등록된 테마가 없습니다.</span><%
		}else{
			for(int i=0;i<arr1.size();i++){
				if(thema.equals(arr1.get(i).getThema_name())){
					%><a href="hof.jsp?thema=<%=arr1.get(i).getThema_name()%>"><button class="rbutton"><span><%=arr1.get(i).getThema_name()%></span></button></a><%
				}else{
					%><a href="hof.jsp?thema=<%=arr1.get(i).getThema_name()%>"><button class="tbutton"><span><%=arr1.get(i).getThema_name()%></span></button></a><%
				}
			}
		}
		%>
		
		
		
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