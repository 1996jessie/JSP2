<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
Ex06_result_이예원.jsp
<br>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String[] parr = request.getParameterValues("product");
	String time = request.getParameter("time");
	String approve = request.getParameter("approve");
	String agree = request.getParameter("agree");
%>
	아이디 : <%= id %><br>
	비번 : <%= pw %><br>
	<%
		if(parr == null) {
			out.println("선택한 구매상품이 없습니다.<br>");
		}else{
			out.print("구매상품 : ");
			for(int i=0;i<parr.length;i++) {
				out.print(parr[i]+" ");
			}
			out.print("<br>");
		}
	%>
	
	배송시간 : <%= time %><br>
	결제방법 : <%= approve %><br>
	
	<%
	if(agree == null) { 
		out.print("동의하지 않음");
	}else{
		out.print("동의");
	}
	%>
<table border = "1">

	<tr>
		<th>아이디</th>
		<td><%= id %></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><%= pw %></td>
	</tr>
	<tr>
		<th>구매상품</th>
		<td>
    	<%
		if(parr == null) {
			out.println("선택한 구매상품이 없습니다.<br>");
		}else{
			for(int i=0;i<parr.length;i++) {
				out.print(parr[i]+" ");
			}
		}
		%>
		</td>
	</tr>
	<tr>
		<th>배송시간</th>
		<td><%= time %></td>
	</tr>
	<tr>
		<th>결제방법</th>
		<td><%= approve %></td>
	</tr>
	<tr>
		<th>동의여부</th>
		<td>
    	<%
		if(agree == null) { 
			out.print("동의하지 않음");
		}else{
			out.print("동의");
		}
		%>
		</td>
	</tr>
</table>

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
<%
	Enumeration<String> names2 = request.getParameterNames();
	int cnt = 0;
	out.print("<table border = 1>");
      
	boolean flag = false;

	while(names2.hasMoreElements()) {
		cnt++;
		String em = names2.nextElement();
		if(em.equals("agree")){
			flag = true;
		}
		String[] values = request.getParameterValues(em);
		out.print("<tr><th>" + em + "</th><td>");
    	  
		for(int i=0;i<values.length;i++) {
			if(values[i].equals("on")){
				values[i] = "동의";
			}
			out.print(values[i]);
		}
		out.print("</td></tr>");
	}
	if(flag == false) {
		out.print("<tr><th>agree</th>");
		out.print("<td>동의하지 않음</td></tr>");  
	}
	out.print("</table>");
%>
