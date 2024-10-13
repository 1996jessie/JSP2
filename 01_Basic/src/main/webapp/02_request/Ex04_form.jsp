<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex04_form.jsp<br>
<form action = "Ex04_result2.jsp">
	이름 : 
	<input type = "text" name = "name"><br>
	비번 : 
	<input type = "password" name = "pw"><br>
	<br>
	[과일 선택]
	<br>
	<input type = "checkbox" name = "fruits" value = "감">감<br>
	<input type = "checkbox" name = "fruits" value = "밤">밤<br>
	<input type = "checkbox" name = "fruits" value = "사과">사과<br>
	<input type = "checkbox" name = "fruits" value = "오렌지">오렌지<br>
	<br>
	
	<input type = "submit" value = "전송">
	<input type = "reset" value = "취소">
</form>