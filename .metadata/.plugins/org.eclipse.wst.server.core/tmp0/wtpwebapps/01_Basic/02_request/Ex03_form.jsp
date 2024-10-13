<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex03_form.jsp<br>
<h1> Request 내장 객체 예제</h1>
<form action = "Ex03_result.jsp">
	이름 : 
	<input type = "text" name = "name">
	<br>
	나이 : 
	<input type = "text" name = "age">
	<br>
	성별 : 
	<input type = "radio" name = "gender" value = "man">남자
	<input type = "radio" name = "gender" value = "woman">여자 
	<br>
	취미 : 
	<select name = "hobby">
		<option value = "JSP공부">JSP공부</option>
		<option value = "게임">게임</option>
		<option value = "등산">등산</option>
		<option value = "웹툰보기">웹툰보기</option>
	</select>
	<br><br>
	색 선택 : 
	<select name = "color">
		<option value = "blue">파랑색</option>
		<option value = "red">빨강색</option>
		<option value = "green">초록색</option>
		<option value = "yellow">기타</option>
	</select>
	<br><br>
	<input type = "submit" value = "보내기">

</form>