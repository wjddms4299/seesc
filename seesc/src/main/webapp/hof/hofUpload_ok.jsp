<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.oreilly.servlet.*" %>
<jsp:useBean id="hofdao" class="com.esc.hof.HofDAO" scope="session"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String savepath=request.getRealPath("/hof/hofimg");
MultipartRequest mr=new MultipartRequest(request,savepath,2097152,"utf-8");
String img_name=mr.getFilesystemName("img");
if(img_name!=null&&!img_name.equals("")){
	if(!img_name.substring(img_name.length()-4,img_name.length()).equals(".jpg") && !img_name.substring(img_name.length()-4,img_name.length()).equals(".png")&&
		!img_name.substring(img_name.length()-4,img_name.length()).equals(".gif")&&!img_name.substring(img_name.length()-4,img_name.length()).equals(".bmp")&&
		!img_name.substring(img_name.length()-5,img_name.length()).equals(".jpeg")){
	%>
	<script>
	window.alert("이미지 파일만 업로드 가능합니다. \n  (.jpg, .jpeg, .png, .gif, .bmp) ");
	history.back();
	</script>
	<%
	
}
return;
}
int result=hofdao.addRecord(mr);
String msg=result>0?"기록 업로드 성공!":"기록 업로드 실패!";
%>
<script>
window.alert('<%=msg%>');
opener.location.reload();
window.self.close();
</script>