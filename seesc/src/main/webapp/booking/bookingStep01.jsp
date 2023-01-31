<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{width:1200px;margin:0px auto;}
#a1{margin:0px 100px;}
#a1-0{background:lightgray;}
#a1-1{margin:20px auto;}
.a1-2{color:blue;}
.a1-3{color:red;}
select{margin:0px 950px;}
#a2{width:500px;float:left;}
#a3{width:580px;float:left;}
.a2-0{margin:10px 150px;}
.a2-1{margin:10px 5px;}
#a2-2{font-size:22px;}
</style>
</head>
<body>
<section>
<hr width="1100">
 <article>
 <h2 id="a1">테마 예약하기</h2>
 <br>
 <h4 align="center"><label id="a1-0">STEP01 날짜/테마 선택</label> &nbsp; STEP02 정보입력 &nbsp; STEP03 예약확인</h4>
 <br>
 <table id="a1-1">
 	<tr align="center" height="20">
 	<%
 	Calendar now=Calendar.getInstance();
 	int w_i[]=new int[10];
 	int d[]=new int[10];
 	String w[]=new String[10];
 	
 	for(int z=0;z<10;z++){
 		w_i[z]=now.get(Calendar.DAY_OF_WEEK);
 		d[z]=now.get(Calendar.DATE);
 		
 		switch(w_i[z]){
	 		case 1:w[z]="S";break;
	 		case 2:w[z]="M";break;
	 		case 3:w[z]="T";break;
	 		case 4:w[z]="W";break;
	 		case 5:w[z]="T";break;
	 		case 6:w[z]="F";break;
	 		case 7:w[z]="S";
 		}
 		
 		out.print("요일:"+w[z]+"/일자:"+d[z]);
 				
 		now.add(Calendar.DATE,1);
 	}
 	%>
 		<td width="30">M</td>
 		<td width="30">T</td>
 		<td width="30">W</td>
 		<td width="30">T</td>
 		<td width="30">F</td>
 		<td width="30" class="a1-2">S</td>
 		<td width="30" class="a1-3">S</td>
 		<td width="30">M</td>
 		<td width="30">T</td>
 		<td width="30">W</td>
 	</tr>
 	<tr align="center" height="20">
 		<td>30</td>
 		<td>31</td>
 		<td>1</td>
 		<td>2</td>
 		<td>3</td>
 		<td class="a1-2">4</td>
 		<td class="a1-3">5</td>
 		<td>6</td>
 		<td>7</td>
 		<td>8</td>
 	</tr>
 </table>
</article>
<select>
	<option value="이름순">이름순</option>
	<option value="난이도순">난이도순</option>
	<option value="인기순">인기순</option>
</select>
<article>
 <h3 class="a2-0">테마 이름</h3>
 <div class="a2-0">난이도:★★★★★ &nbsp; 인원:2~6명 &nbsp; 시간:100분</div>
 <hr width="950">
</article>
<article id="a2">
 <img alt="방탈출 1" src="/escape/img/12.jpg" width="300" height="400" class="a2-0">
</article>
<article id="a3">
 <br><br><br><br>
 <label class="a2-1" id="a2-2">#학교 #무서운 #공포</label><br><br>
 <label class="a2-1">테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개</label><br><br>
 <input type="button" value="10:00 예약마감" class="a2-1"> <input type="button" value="12:00 예약마감"> <input type="button" value="14:00 예약마감"><br>
 <input type="button" value="16:00 예약마감" class="a2-1"> <input type="button" value="18:00 예약마감"> <input type="button" value="20:00 예약마감"><br><br><br><br><br><br><br><br><br>
</article>

<article>
 <h3 class="a2-0">테마 이름</h3>
 <div class="a2-0">난이도:★★★★★ &nbsp; 인원:2~6명 &nbsp; 시간:100분</div>
 <hr width="950">
</article>
<article id="a2">
 <img alt="방탈출 2" src="/escape/img/12.jpg" width="300" height="400" class="a2-0">
</article>
<article id="a3">
 <br><br><br><br>
 <label class="a2-1" id="a2-2">#학교 #무서운 #공포</label><br><br>
 <label class="a2-1">테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개</label><br><br>
 <input type="button" value="10:00 예약마감" class="a2-1"> <input type="button" value="12:00 예약마감"> <input type="button" value="14:00 예약마감"><br>
 <input type="button" value="16:00 예약마감" class="a2-1"> <input type="button" value="18:00 예약마감"> <input type="button" value="20:00 예약마감"><br><br><br><br><br><br><br><br><br>
</article>

<article>
 <h3 class="a2-0">테마 이름</h3>
 <div class="a2-0">난이도:★★★★★ &nbsp; 인원:2~6명 &nbsp; 시간:100분</div>
 <hr width="950">
</article>
<article id="a2">
 <img alt="방탈출 3" src="/escape/img/12.jpg" width="300" height="400" class="a2-0">
</article>
<article id="a3">
 <br><br><br><br>
 <label class="a2-1" id="a2-2">#학교 #무서운 #공포</label><br><br>
 <label class="a2-1">테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개</label><br><br>
 <input type="button" value="10:00 예약마감" class="a2-1"> <input type="button" value="12:00 예약마감"> <input type="button" value="14:00 예약마감"><br>
 <input type="button" value="16:00 예약마감" class="a2-1"> <input type="button" value="18:00 예약마감"> <input type="button" value="20:00 예약마감"><br><br><br><br><br><br><br><br><br>
</article>

<article>
 <h3 class="a2-0">테마 이름</h3>
 <div class="a2-0">난이도:★★★★★ &nbsp; 인원:2~6명 &nbsp; 시간:100분</div>
 <hr width="950">
</article>
<article id="a2">
 <img alt="방탈출 4" src="/escape/img/12.jpg" width="300" height="400" class="a2-0">
</article>
<article id="a3">
 <br><br><br><br>
 <label class="a2-1" id="a2-2">#학교 #무서운 #공포</label><br><br>
 <label class="a2-1">테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개</label><br><br>
 <input type="button" value="10:00 예약마감" class="a2-1"> <input type="button" value="12:00 예약마감"> <input type="button" value="14:00 예약마감"><br>
 <input type="button" value="16:00 예약마감" class="a2-1"> <input type="button" value="18:00 예약마감"> <input type="button" value="20:00 예약마감"><br><br><br><br><br><br><br><br><br>
</article>

<article>
 <h3 class="a2-0">테마 이름</h3>
 <div class="a2-0">난이도:★★★★★ &nbsp; 인원:2~6명 &nbsp; 시간:100분</div>
 <hr width="950">
</article>
<article id="a2">
 <img alt="방탈출 5" src="/escape/img/12.jpg" width="300" height="400" class="a2-0">
</article>
<article id="a3">
 <br><br><br><br>
 <label class="a2-1" id="a2-2">#학교 #무서운 #공포</label><br><br>
 <label class="a2-1">테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개</label><br><br>
 <input type="button" value="10:00 예약마감" class="a2-1"> <input type="button" value="12:00 예약마감"> <input type="button" value="14:00 예약마감"><br>
 <input type="button" value="16:00 예약마감" class="a2-1"> <input type="button" value="18:00 예약마감"> <input type="button" value="20:00 예약마감"><br><br><br><br><br><br><br><br><br>
</article>

<article>
 <h3 class="a2-0">테마 이름</h3>
 <div class="a2-0">난이도:★★★★★ &nbsp; 인원:2~6명 &nbsp; 시간:100분</div>
 <hr width="950">
</article>
<article id="a2">
 <img alt="방탈출 6" src="/escape/img/12.jpg" width="300" height="400" class="a2-0">
</article>
<article id="a3">
 <br><br><br><br>
 <label class="a2-1" id="a2-2">#학교 #무서운 #공포</label><br><br>
 <label class="a2-1">테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개</label><br><br>
 <input type="button" value="10:00 예약마감" class="a2-1"> <input type="button" value="12:00 예약마감"> <input type="button" value="14:00 예약마감"><br>
 <input type="button" value="16:00 예약마감" class="a2-1"> <input type="button" value="18:00 예약마감"> <input type="button" value="20:00 예약마감"><br><br><br><br><br><br><br><br><br>
</article>

<article>
 <h3 class="a2-0">테마 이름</h3>
 <div class="a2-0">난이도:★★★★★ &nbsp; 인원:2~6명 &nbsp; 시간:100분</div>
 <hr width="950">
</article>
<article id="a2">
 <img alt="방탈출 7" src="/escape/img/12.jpg" width="300" height="400" class="a2-0">
</article>
<article id="a3">
 <br><br><br><br>
 <label class="a2-1" id="a2-2">#학교 #무서운 #공포</label><br><br>
 <label class="a2-1">테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개 테마 소개</label><br><br>
 <input type="button" value="10:00 예약마감" class="a2-1"> <input type="button" value="12:00 예약마감"> <input type="button" value="14:00 예약마감"><br>
 <input type="button" value="16:00 예약마감" class="a2-1"> <input type="button" value="18:00 예약마감"> <input type="button" value="20:00 예약마감"><br><br><br><br><br><br><br><br><br>
</article>
<hr width="1100">
</section>
</body>
</html>