<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="coudao" class="com.esc.coupon.CouponDAO"></jsp:useBean>
<%
String idxr=request.getParameter("idx");
String dcr=request.getParameter("dc");
int idx=Integer.parseInt(idxr);
int dc=Integer.parseInt(dcr);
int result=coudao.couponCre(dc,idx);
String msg=result>0?"생성완료!":"생성실패";
%>
<script>
	window.alert('<%=msg%>');
	location.href='coumng.jsp';
</script>