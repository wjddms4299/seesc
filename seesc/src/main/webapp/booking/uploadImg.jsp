<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<jsp:useBean id="thdao" class="com.esc.thema.ThemaDAO" scope="session"></jsp:useBean>
<%
String savepath=request.getRealPath("/thema_img");
MultipartRequest mr=new MultipartRequest(request,savepath,2097152,"utf-8",new DefaultFileRenamePolicy());

String img_name=mr.getFilesystemName("upload");
if(img_name==null || img_name.equals("")){
	%>
	<script>
	window.alert("이미지를 업로드해주세요.");
	history.back();
	</script>
	<%
	return;
}
if(!img_name.substring(img_name.length()-4,img_name.length()).equals(".jpg") && !img_name.substring(img_name.length()-4,img_name.length()).equals(".png")){
	%>
	<script>
	window.alert("이미지 파일(.jpg .png)만 업로드해주세요.");
	history.back();
	</script>
	<%
	return;
}

int result=thdao.imgInsert(mr);
String msg=result>0?"이미지 업로드를 완료하였습니다.":"이미지 업로드에 실패하였습니다. 담당 개발자에게 문의바랍니다.";
%>
<script>
window.alert('<%=msg%>');
window.opener.location.href='bookingStep01_in.jsp?img_name=<%=img_name%>';
window.self.close();
</script>