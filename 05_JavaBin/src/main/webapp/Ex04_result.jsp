<%@page import="myPkg.FruitBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex04_result.jsp<br>

<%

	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String[] fruit = request.getParameterValues("fruit");
	
%>


이름 : <%= name %><br>
	 
<%	
	if(fruit == null){
		out.println("좋아하는 과일을 선택하지 않았습니다..<br>");
	}else{ 
		out.print("좋아하는 과일 : ");
		for(int i=0;i<fruit.length;i++){
			out.print(fruit[i]+" ");
		}
	}
%>	

<hr>

<%
	FruitBean fb = new FruitBean();
	fb.setName(name);
	fb.setFruit(fruit);
%>

이름 : <%= fb.getName() %> <br>
fruit의 주소 : <%= fb.getFruit() %>  <br> <!-- 0번방의 주소가 리턴됨 -->
좋아하는 과일 : 
<%
	String[] farr = fb.getFruit();
	for(int i=0;i<farr.length;i++) {
		out.print(farr[i] + " ");
	}
	out.print("<br>");
%>

<hr>

<jsp:useBean id="fb2" class="myPkg.FruitBean">
	<jsp:setProperty name="fb2" property="name"/>
	<jsp:setProperty name="fb2" property="fruit"/>
</jsp:useBean>

이름 : <jsp:getProperty name="fb2" property="name"/><br>
fruit의 주소 : <jsp:getProperty name="fb2" property="fruit"/><br>
좋아하는 과일 : 
<%
	String[] farr2 = fb2.getFruit();
	for(String f : farr2) {
		out.print(f + " ");
	}
	out.print("<br>");
%>



