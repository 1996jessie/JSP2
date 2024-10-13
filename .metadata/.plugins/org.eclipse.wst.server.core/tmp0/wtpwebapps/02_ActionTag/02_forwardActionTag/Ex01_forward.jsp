<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_forward.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id"); //여기 request에도 form에서의 정보 들어있음
	String passwd = request.getParameter("passwd"); 	
%>

f아이디 : <%=id%><br>
f비밀번호 : <%=passwd%><br>
