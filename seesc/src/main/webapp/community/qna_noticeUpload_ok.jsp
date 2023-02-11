<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import = "com.oreilly.servlet.*"%>
<%request.setCharacterEncoding("utf-8"); %>
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


int result = qnadao.qna_noticeUpload(mr);
String msg = result>0?"공지글이 등록되었습니다.": "공지글 등록에 실패하였습니다.";
%>

<script>
window.alert('<%=msg%>');
window.location.href = '/seesc/community/qna_list.jsp';
</script>