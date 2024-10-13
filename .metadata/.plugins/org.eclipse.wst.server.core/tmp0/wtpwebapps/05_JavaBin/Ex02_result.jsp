<%@page import="myPkg.PersonBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String address = request.getParameter("address");
	String tel = request.getParameter("tel");
%>

이름 : <%= name %><br>
나이 : <%= age %><br>
주소 : <%= address %><br>
전화번호 : <%= tel %><br>

<hr>

<%
	PersonBean pb = new PersonBean();
	pb.setName(name);
	pb.setAge(age);
	pb.setAddress(address);
	pb.setTel(tel);
	
	out.print("이름 : " + pb.getName()+"<br>"); 
	out.print("나이 : " + pb.getAge()+"<br>");
	out.print("주소 : " + pb.getAddress()+"<br>");
	out.print("전화번호 : " + pb.getTel()+"<br>");
%>
<hr>

<jsp:useBean id="pb2" class="myPkg.PersonBean">
	<jsp:setProperty name = "pb2" property = "name"/>
	<jsp:setProperty name = "pb2" property = "age"/>
	<jsp:setProperty name = "pb2" property = "address"/>
	<jsp:setProperty name = "pb2" property = "tel"/>
</jsp:useBean>

이름 : <jsp:getProperty name = "pb2" property = "name"/><br>
나이 : <jsp:getProperty name = "pb2" property = "age"/><br>
주소 : <jsp:getProperty name = "pb2" property = "address"/><br>
전화번호 : <jsp:getProperty name = "pb2" property = "tel"/><br>

