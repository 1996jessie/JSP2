<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
control.jsp<br>

<%
	String product = request.getParameter("product");
%>

선택한 제품 : <%= product %>

<%--  
<jsp:forward page="template.jsp">
	<jsp:param value='<%= product + "Left.jsp" %>' name="viewLeft"/>
	<jsp:param value='<%= product + ".jsp"%>' name="viewRight"/>
</jsp:forward>  
--%>

<jsp:forward page="template.jsp"/> <!-- param 없이 바로 넘겨도 가능 -->
<%-- 	
	<jsp:param value="<%=product%>"  name="product"/> 
</jsp:forward> --%>