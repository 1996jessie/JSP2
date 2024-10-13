<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_result1.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String msg = request.getParameter("msg"); //request 안에 msg 안에 hello 담았다는 정보 담김
	System.out.println("Ex01_result1.jsp msg : " + msg); //form에서 오긴 왔음
%>
msg : <%= msg %>

<%
	response.sendRedirect("Ex01_result2.jsp?msg="+msg); //순식간에 여기로 이동 //get방식으로 넘기는 중
%>

<!-- 
response : 참조변수
HttpServletResponse response : 자동으로 만들어지는 내장객체 
request 객체를 공유하지 않음
result1의 request와 result2의 request는 서로 다른 객체
? 쓰고 result2로 넘길 값 쓰면 넘길 수 있음
-->