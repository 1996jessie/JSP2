<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex05_form.jsp<br>
폼에 데이터를 입력한 후 '전송' 버튼을 클릭하세요.
<form action = "Ex05_result.jsp">
이름 : 
<input type = "text" name = "이름"><br>
주소 : 
<input type = "text" name = "주소"><br>
좋아하는 계절 : 
	봄<input type = "radio" name = "계절" value = "봄" checked>
	여름<input type = "radio" name = "계절" value = "여름">
	가을<input type = "radio" name = "계절" value = "가을">
	겨울<input type = "radio" name = "계절" value = "겨울">
	<br><br>
좋아하는 동물 : 
	<input type = "checkbox" name = "동물" value = "강아지">강아지
	<input type = "checkbox" name = "동물" value = "토끼">토끼
	<input type = "checkbox" name = "동물" value = "돼지">돼지
	<br><br>
좋아하는 과일?<br>
	<select name = "과일">
		<option value = "사과">사과</option>
		<option value = "바나나">바나나</option>
		<option value = "복숭아">복숭아</option>
	</select>
	<br>
	<input type = "submit" value = 전송>


</form>
