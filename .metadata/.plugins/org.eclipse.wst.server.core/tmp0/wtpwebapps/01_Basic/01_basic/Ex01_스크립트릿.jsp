<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 현재 페이지에 대한 설정 정보 -->
<!DOCTYPE html>   
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Hello 
	<script type="text/javascript"> //영역을 만들어서 어떤 언어 사용하는지 표현해야 함(이 부분 없으면 그냥 html 코드)
		document.write("hi");
	</script>
		
	<%-- jsp코드 --%> 
	<% //java 코드를 콘솔창에 출력하라는 명령어 : jsp
	String name = "홍길동";
	System.out.println(name);
	 %>   
	 <br>
	 <b>저의 이름은</b> 
	 <b><%=name %>입니다.</b>
</body>
</html>


<%-- : 주석
jsp 일반 태그
<%@ page%> : 지시어 : 현재 jsp 페이지의 설정 정보에 대한 설정 (page, include, taglib) 
<% %> : 스크립트릿 : 변수, 제어문, 프로그램 코드 구현(제일 많이 사용)
<%= %>  : 표현식 : 변수의 결과값, 메소드의 리턴값 출력할 때
<%! %>  : 선언문 : 전역변수 및 메소드 선언
--%>
<%--
html안에 java 코드 넣어서 동적으로 변화하는 웹 페이지 만들 수 있도록 함
--%>