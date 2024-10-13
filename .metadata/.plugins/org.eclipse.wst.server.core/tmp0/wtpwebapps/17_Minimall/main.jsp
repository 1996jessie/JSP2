<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
main.jsp<br>


<link rel="stylesheet" href="style.css" type = "text/css"/>
<style>
	table{
		cellspacing : 0;
	}
</style>
<%
	session.invalidate(); //세션 무효화
%>
<h2 align = "center">[로그인 화면]</h2>

<form action = "loginPro.jsp" method = "post"> 

	<table border = "1">
		<tr>
			<td bgcolor = "yellow" align = "center">아이디</td>
			<td>
				<input type = "text" name = "id">
			</td>
		</tr>
		<tr>
			<td bgcolor = "yellow" align = "center">비번</td>
			<td>
				<input type = "text" name = "password">
			</td>
		</tr>
		<tr>
			<td colspan = "2" bgcolor = "orange" align = "center">
				<input type = "submit" value = "로그인">
				<input type = "button" value = "회원가입" onClick = "location.href = 'myshop/member/register.jsp'">
				<input type = "button" value = "아이디찾기" onClick = "location.href = 'myshop/member/findid.jsp'">
				<input type = "button" value = "비번찾기" onClick = "location.href = 'myshop/member/findpw.jsp'">
			</td>
			
		</tr>
	</table>
</form>