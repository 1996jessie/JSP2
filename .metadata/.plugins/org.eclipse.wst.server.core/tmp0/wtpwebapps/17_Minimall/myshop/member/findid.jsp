<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
myshop/member/findid.jsp

<link rel="stylesheet" href="<%=request.getContextPath() %>/style.css" type="text/css">
<form action="findidProc.jsp" method="post">
	<h2 align="center">[아이디 찾기]</h2>
	<table border=1 align="center">
		<tr>
			<th align="center" bgcolor="yellow">이름</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th align="center" bgcolor="yellow">주민 등록 번호</th>
			<td><input type="text" name="rrn1" size="6"> - <input type="text" name="rrn2" size="7"></td>
		</tr>
		<tr>
			<td colspan=2 align="center" bgcolor="#ffcc00">
				<input type="submit" value="아이디 찾기">
			</td>
		</tr>
	</table>
</form>