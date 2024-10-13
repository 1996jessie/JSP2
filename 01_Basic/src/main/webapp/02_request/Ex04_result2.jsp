<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Enumeration" %>
Ex04_result2.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");

	Enumeration<String> names = request.getParameterNames(); 
	//Enumeration<String> //import 해줘야 함 //반복할 때 사용 //이름들이 names라는 변수로 관리되고 있음 //name,pw,fruits
	while(names.hasMoreElements()){ //하나라도 있으면 true
		String em = names.nextElement();
		out.println(em + ":"); 
		
		String[] values = request.getParameterValues(em);
		for(int i=0;i<values.length;i++) {
			out.println(values[i] + " ");
		}
		out.println("<br>");
	}//while
%>