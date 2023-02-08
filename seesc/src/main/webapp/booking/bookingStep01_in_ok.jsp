<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="thdao" class="com.esc.thema.ThemaDAO" scope="session"></jsp:useBean>
<%
String img_idx_s=request.getParameter("img_idx");
int img_idx=Integer.parseInt(img_idx_s);

String thema_name=request.getParameter("thema_name");
if(thema_name==null || thema_name.equals("")){
	%>
	<script>
	window.alert("테마명을 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

String thema_level_s=request.getParameter("thema_level");
if(thema_level_s==null || thema_level_s.equals("")){
	%>
	<script>
	window.alert("난이도를 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}
int thema_level;
try{
	thema_level=Integer.parseInt(thema_level_s);
}catch(NumberFormatException e){
	%>
	<script>
	window.alert("난이도는 '숫자'만 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

String thema_people_min_s=request.getParameter("thema_people_min");
if(thema_people_min_s==null || thema_people_min_s.equals("")){
	%>
	<script>
	window.alert("최소인원을 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}
int thema_people_min;
try{
	thema_people_min=Integer.parseInt(thema_people_min_s);
}catch(NumberFormatException e){
	%>
	<script>
	window.alert("최소인원은 '숫자'만 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

String thema_people_max_s=request.getParameter("thema_people_max");
if(thema_people_max_s==null || thema_people_max_s.equals("")){
	%>
	<script>
	window.alert("최대인원을 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}
int thema_people_max;
try{
	thema_people_max=Integer.parseInt(thema_people_max_s);
}catch(NumberFormatException e){
	%>
	<script>
	window.alert("최대인원은 '숫자'만 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

if(thema_people_max < thema_people_min){
	%>
	<script>
	window.alert("최대인원은 최소인원보다 크거나 같아야합니다.");
	history.back();
	</script>
	<%
	return;
}

String thema_time_s=request.getParameter("thema_time");
if(thema_time_s==null || thema_time_s.equals("")){
	%>
	<script>
	window.alert("게임시간을 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}
int thema_time;
try{
	thema_time=Integer.parseInt(thema_time_s);
}catch(NumberFormatException e){
	%>
	<script>
	window.alert("게임시간은 '숫자'만 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

String thema_price_s=request.getParameter("thema_price");
if(thema_price_s==null || thema_price_s.equals("")){
	%>
	<script>
	window.alert("가격을 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}
int thema_price;
try{
	thema_price=Integer.parseInt(thema_price_s);
}catch(NumberFormatException e){
	%>
	<script>
	window.alert("가격은 '숫자'만 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

String thema_tag1=request.getParameter("thema_tag1");
if(thema_tag1==null || thema_tag1.equals("")){
	%>
	<script>
	window.alert("해시태그1을 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

String thema_tag2=request.getParameter("thema_tag2");
if(thema_tag2==null || thema_tag2.equals("")){
	%>
	<script>
	window.alert("해시태그2을 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

String thema_tag3=request.getParameter("thema_tag3");
if(thema_tag3==null || thema_tag3.equals("")){
	%>
	<script>
	window.alert("해시태그3을 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

String thema_intro1=request.getParameter("thema_intro1");
if(thema_intro1==null || thema_intro1.equals("")){
	%>
	<script>
	window.alert("설명1을 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

String thema_intro2=request.getParameter("thema_intro2");
if(thema_intro2==null || thema_intro2.equals("")){
	%>
	<script>
	window.alert("설명2을 입력해주세요.");
	history.back();
	</script>
	<%
	return;
}

String thema_intro3=request.getParameter("thema_intro3");

int result=thdao.themaInsert(thema_name,img_idx,thema_level,thema_people_min,thema_people_max,thema_time,thema_price,thema_tag1,thema_tag2,thema_tag3,thema_intro1,thema_intro2,thema_intro3);
String msg=result>0?"테마 추가를 완료하였습니다.":"테마 추가에 실패하였습니다. 담당 개발자에게 문의바랍니다.";%>
<script>
window.alert("<%=msg%>");
location.href='/seesc/booking/bookingStep01.jsp';
</script>