<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_form.jsp => Ex01_result.jsp<br>
<% 
	request.setCharacterEncoding("UTF-8"); //한글 처리를 하겠다 //★★★★★제일 먼저 처리해야 함★★★★★
	//HttpServletRequest request = new HttpServletRequest(); //이미 만들어진 객체 = 내장객체
	//request 객체 : 요청한 쪽의 정보 담겨있음
	String s = request.getParameter("name"); //괄호 안에 String 쓰면 String 리턴
	//name이라는 name에 담겨서 넘어오는 value를 s에 담음
	String a = request.getParameter("age");
	//age라는 name에 담겨서 넘어오는 value를 a에 담음
%>

<!-- 출력하기 -->
이름 : <%=s%><br> <!-- null : request.getParameter("nane"); 괄호 안에 올바른 이름 아닐 경우 -->
나이 : <%=a%><br>

<!-- 
request : 참조변수
getParameter() : 메서드명(문자열 리턴)
 -->