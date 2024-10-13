<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
main.jsp<br>

<jsp:forward page="template.jsp">
	<jsp:param value="content.jsp" name="viewPage"/>
</jsp:forward>