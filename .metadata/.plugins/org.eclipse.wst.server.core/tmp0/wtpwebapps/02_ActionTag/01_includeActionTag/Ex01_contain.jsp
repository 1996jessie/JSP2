<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_contain.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	String id2 = request.getParameter("id"); 
	String passwd2 = request.getParameter("passwd"); 	
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
%>

c아이디 : <%=id2%><br>
c비밀번호 : <%=passwd2%><br>
c나이 : <%=age %>
c주소 : <%=addr %>

<!-- 
form에서 입력된 값이 request 객체에 똑같이 담겨있음
request 객체 공유(Redirect와의 차이)
 -->
