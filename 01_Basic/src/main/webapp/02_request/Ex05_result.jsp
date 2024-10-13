<%@page import="java.util.Enumeration"%> <!-- ctrl+space 하면 자동 import -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
Ex05_result.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("이름");
	String address = request.getParameter("주소");
	String season = request.getParameter("계절");
	String[] aarr = request.getParameterValues("동물");
	String fruit = request.getParameter("과일");
%>
	이름 : <%= name %><br>
	주소 : <%= address %><br>
	계절 : <%= season %><br>
	<%
		if(aarr == null) {
			out.println("선택한 동물이 없습니다.<br>");
		}else{
			out.print("동물 : ");
			for(int i=0;i<aarr.length;i++) {
				out.print(aarr[i]+" ");
			}
			out.print("<br>");
		}
	%>
	과일 : <%= fruit %><br>

<hr>

<%
	Enumeration<String> names = request.getParameterNames(); 
	while(names.hasMoreElements()){ 
		String em = names.nextElement();
		out.println(em + ":"); 
		String[] values = request.getParameterValues(em);
		for(int i=0;i<values.length;i++) {
			out.println(values[i] + " ");
		}
		out.println("<br>");
	}
%>