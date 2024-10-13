<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex05_form.jsp<br>
<%
	String[] subject = {"국어","영어","수학","과학","음악"};
%>

<form action="Ex05_result.jsp" method="post">
	
	이름 : <input type="text" name="name"><br>
	비번 : <input type="text" name="pw"><br>
	점수 : <br>
	
<%
	for(int i=0; i<subject.length; i++) {
%>
		<%= subject[i] %> : <input type="text" name="jumsu"> <br>
<%
	}
%>
	좋아하는 걸그룸 : <br>
	<select name = "group" multiple = "multiple"> <!-- ctrl 눌러서 여러개 선택 가능(하나의 이름에 여러가지 담을 수 있음) -->
		<option value = "블랙핑크">블랙핑크</option>
		<option value = "뉴진스">뉴진스</option>
		<option value = "레드벨벳">레드벨벳</option>
		<option value = "트와이스">트와이스</option>
	</select>

	<input type="submit" value="전송">
</form>