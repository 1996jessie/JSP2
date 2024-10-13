<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
template.jsp<br>

[Template 페이지]

<%
	String viewPage = request.getParameter("viewPage");
%>
<table border = "1">
	<tr>
		<td colspan = 2><jsp:include page="top.jsp"/> </td>
	</tr>
	<tr>
		<td><jsp:include page="left.jsp"/></td>
		<td><jsp:include page="<%= viewPage %>"/></td>
	</tr>
	<tr>
		<td colspan = 2><jsp:include page="bottom.jsp"/></td>
	</tr>
</table>

<!-- 
변하지 않는 곳은 지시어 써도 됨
변해야 하는 곳은 액션태그만 가능

페이지 모듈화 : 조각조각 만들어서 하나로 합치는 작업
 -->
