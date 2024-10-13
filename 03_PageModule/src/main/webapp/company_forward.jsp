<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
company_forward.jsp<br>

<jsp:forward page="template.jsp">
	<jsp:param value="company.jsp" name="viewPage"/>
	
</jsp:forward>

<!-- 잠시 거쳐가는 페이지 viewPage = company.jsp -->