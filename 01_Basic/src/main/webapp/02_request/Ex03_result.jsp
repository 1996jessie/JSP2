<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex03_result.jsp<br>

<% 
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender"); //value값이 넘어옴(여자 아니고 woman 넘어옴)
	String hobby = request.getParameter("hobby");
	String color = request.getParameter("color");
	String abc = request.getParameter("abc");
	if(abc == null) { 
		out.print("abc라는 name이 없음<br>");
	}else{
		out.print("abc라는 name이 있음<br>");
	}
	if(gender.equals("man")) { //java는 equals 메서드로 비교
		gender = "남자";
	} else {
		gender = "여자";
	}
%>
이름 : <%= name %><br>
나이 : <%= age %><br>
성별 : <%= gender %><br>
취미 : <%= hobby %><br>
색 : <%= color %><br>
1. 
<img src = "../images/<%=color + ".jpg"%>"><br>
2. 
<img src = "../images/<%=color%>.jpg"><br>
3.
<%
	if(color.equals("blue")){
		%>
		<img src = "../images/blue.jpg">
<%	} else if(color.equals("red")) {
		%>
		<img src = "../images/red.jpg">
<%  } else if(color.equals("green")) {
		%>
		<img src = "../images/green.jpg">
<%	} else {
		%>
		<img src = "../images/yellow.jpg">
<%	}
%>
<br>
4. 
<%
	out.print("<img src = '../images/" + color + ".jpg'>");
	//JspWriter out = new JspWriter(); 내장객체
%>

<!-- 
내장객체
request : 요청정보
response : 응답정보
out : 출력
pageContext : Context 
-->
