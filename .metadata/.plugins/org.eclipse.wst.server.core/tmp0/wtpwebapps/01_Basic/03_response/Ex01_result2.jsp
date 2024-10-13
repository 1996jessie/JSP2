<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_result2.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String msg = request.getParameter("msg");
	System.out.println("Ex01_result2.jsp msg : " + msg); //form에서 오긴 왔음
%>
msg : <%= msg %>
