<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
via.jsp<br>

<%
	String id = request.getParameter("id"); 
	String passwd = request.getParameter("passwd"); 
	
	session.setAttribute("id", id); //넘어온 id를 id 이름으로 설정
	/* session : HttpSession session(내장객체)의 참조변수 */
	session.setAttribute("passwd", passwd);
	session.setMaxInactiveInterval(10); //10초동안만 정보 유지된다(그 이후엔 사라짐)
	
%>

아이디 : <%=id %><br>
비밀번호 : <%=passwd %><br>

<h2>Session내장객체 예제</h2> 
<form method = "post" action = "result.jsp"> 
 
<%-- 
아이디 : <input type = "text" name = "id" value = "<%=id %>"><br><br>
패스워드 : <input type = "text" name = "passwd" value = "<%=passwd %>"><br><br> 
--%>
 <!-- result.jsp로 넘기고 싶으면 폼 안에 value로 집어넣어야 함 --> 

☆가장 좋아하는 스포츠를 선택하세요.☆<br>
<input type = "radio" name = "sport" value = "태권도">태권도
<input type = "radio" name = "sport" value = "유도">유도
<input type = "radio" name = "sport" value = "프로레슬링">프로레슬링
<input type = "radio" name = "sport" value = "이종격투기">이종격투기
<br><br>
☆가장 좋아하는 게임를 선택하세요.☆<br>
<select name = "game">
	<option value = "카트라이더">카트라이더</option>
	<option value = "피파">피파</option>
	<option value = "롤">롤</option>
</select>
<input type = "submit" value= "전송">
</form>

<!-- 
request : 요청할 때마다 매번 객체 만들어짐
session : 웹브라우저 당 객체 1개만 만들어짐 
-->