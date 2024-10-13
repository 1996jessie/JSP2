<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex02_via.jsp"<br>

<%
	request.setCharacterEncoding("UTF-8"); 
	String name = request.getParameter("name");
	String color = request.getParameter("color");
%>

이름 : <%= name %> <br>
색 : <%= color %> <br>


<%-- <jsp:forward page="<%= color + ".jsp" %>"/>  --%>
<!-- 속성 값 [ color + ".jsp" ]이(가) ["]을(를) 사용하여 인용부 처리되어 있는데, 이는 값 내에서 사용될 때에는 반드시 escape되어야 하는 것입니다.-->
<%-- <jsp:forward page="<%= color + '.jsp' %>"/> --%>
<!-- 그냥 아예 오류(Invalid character constant) -->
<jsp:forward page='<%= color + ".jsp" %>'/>
<!-- 이건 정상적으로 됨 -->
<%-- <jsp:forward page='<%= color + '.jsp' %>'/>  --%>
<!-- 그냥 아예 오류(Invalid character constant) -->

<%-- <% 
	if(color.equals("green")) {
		%>
		<jsp:forward page="green.jsp"/>		
<%	} else if(color.equals("blue")) {
		%>
		<jsp:forward page="blue.jsp"/>	
<%	} else if(color.equals("red")) {
		%>
		<jsp:forward page="red.jsp"/>	
<%	} else {
		%>
		<jsp:forward page="yellow.jsp"/>	
<%}
%> --%>
