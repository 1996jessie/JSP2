<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_form.jsp <br>
<form method = "post" action = "Ex01_result.jsp"> <!-- 대소문자까지 정확해야 함 --> 

	이름 : <input type = "text" name = "name" value = "kim"><br>
	나이 : <input type = "text" name = "age"><br><br>
	
	<input type = "submit" value = "확인">
</form>


<!-- 
name = kim
value = 33
name 속성에 value 속성이 들어감 
-->

<!-- 
Ex01_form.jsp에서 submit 클릭하면 Ex01_result.jsp를 요청하면 값을 갖고 넘어옴
-->

<!-- 
get(default)
http://localhost:8080/01_Basic/02_request/Ex01_result.jsp?name=kim&age=123 
전송속도 빠름
보낼 수 있는 데이터 양 작음(256바이트)
비밀번호 등 민감 정보 그대로 노출 위험

post
http://localhost:8080/01_Basic/02_request/Ex01_result.jsp
보안 좋음
보낼 수 있는 데이터의 양 많음
-->


