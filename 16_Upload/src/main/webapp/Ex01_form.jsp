<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_form.jsp<br>

<form method = "post" action = "Ex01_proc.jsp" enctype="multipart/form-data">
	이름 : <input type = "text" name = "name"><br>
	파일 : <input type = "file" name = "filename"><br>
	
	<input type = "submit" value = "전송">
</form>

<!-- 
파일 전송 
method : post
enctype 속성 : null로 나옴
cos.jar 필요 
-->