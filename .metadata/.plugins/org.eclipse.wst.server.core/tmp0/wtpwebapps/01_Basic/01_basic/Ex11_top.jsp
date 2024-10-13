<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Date" %>
Ex11_top.jsp(완성된 코드)<br>

<p>
<%
	Date d = new Date(); //import 안하면 에러 //
%>
<%=d.toString()%> / <%=d.toLocaleString()%> <br>
<hr>
