<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@page import = "com.oreilly.servlet.*"%>
<jsp:useBean id="qnadao" class="com.esc.write.QnADAO" scope = "session"></jsp:useBean>
<%

String savepath = request.getRealPath("/community/userFile");
MultipartRequest mr = new MultipartRequest(request,savepath,2097152,"UTF-8");
String img_name = mr.getFilesystemName("write_filename");
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

int result = qnadao.qna_repwrite(mr);
if(result>0){
%>

<script>
window.alert('답변글을 작성하였습니다.');
window.location.href = '/seesc/community/qna_list.jsp';
</script>

<%}else{%>
	<script>
	window.alert('답변글을 작성에 실패하였습니다.');
	history.back();
	</script>

<%}%>