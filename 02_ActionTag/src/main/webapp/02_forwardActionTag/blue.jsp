<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
blue.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name"); 
	String color = request.getParameter("color"); 	
%>

<%=name%>님이 좋아하는 색은 <%=color%>입니다.<br>
<img src = "../images/<%=color %>.jpg">
<%= "<img src = '../images/" + color + ".jpg'>" %>