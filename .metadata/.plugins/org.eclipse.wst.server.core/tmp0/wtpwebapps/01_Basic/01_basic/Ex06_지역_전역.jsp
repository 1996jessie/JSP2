<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% //String id = "kim" //지역변수는 이 안에서만 의미 가짐%>
<%! 
	String id = "kim";
	String name = "김연아";//전역변수
	public String getId() {
	   	return id;
	}
%>
<%= getId() %> <br>

<% 
	String name = "손흥민";	//지역이 다르기 때문에 중복되지 않음
	String comment = "주석문 연습";
%>

name : <%= name %> <br><!-- 지역이 없으면 전역변수 출력됨 --> 
<p>
	comment1 : <%= comment %><br>
	<!-- comment2 : <%= comment %><br> --> <!-- 결과 화면에는 안나오지만 페이지 소스보기로는 볼 수 있음 -->
	<%-- comment3 : <%= comment %><br> --%> <!-- 결과 화면에서도 볼 수 없고 페이지 소스보기로도 볼 수 없음 -->
