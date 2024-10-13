<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
template.jsp<br>
<%
	String product = request.getParameter("product"); // tv/dc/mp 
	//String viewRight = request.getParameter("viewRight");
%>
<h1>템플릿 페이지 - 템플릿 페이지(template.jsp)</h1>

<%
	String viewLeft = request.getParameter("viewLeft");
	String viewRight = request.getParameter("viewRight");
%>
<table border = "1">
	<tr>
		<td colspan = 2><jsp:include page="top.jsp"/> </td>
	</tr>
	<tr>
<%-- 		
		<td><jsp:include page="<%= viewLeft %>"/></td>
		<td><jsp:include page="<%= viewRight %>"/></td> 
--%>
		<th>
			<jsp:include page='<%=product + "Left.jsp"%>'/> 
		</th>
		<td>
			<jsp:include page='<%=product + ".jsp" %>'/> 
		</td>
	</tr>
	<tr>
		<td colspan = 2><jsp:include page="bottom.jsp"/></td>
	</tr>
</table>