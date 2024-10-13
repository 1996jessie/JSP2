<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findpw.jsp<br>
<script type="text/javascript">
	function rrn1Length() {
		if(document.forms[0].rrn1.value.length == 6) {
			document.forms[0].rrn2.focus();
		}
	}
</script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style.css" type="text/css">
<form action="findpwProc.jsp" method="post">
	<h2 align="center">[비밀번호 찾기]</h2>
	<table border=1 align="center">
		<tr>
			<th align="center" bgcolor="yellow">아이디</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th align="center" bgcolor="yellow">이름</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th align="center" bgcolor="yellow">주민 등록 번호</th>
			<td><input type="text" name="rrn1" size="6" onkeyup = "rrn1Length()"> - <input type="text" name="rrn2" size="7"></td>
		</tr>
		<tr>
			<td colspan=2 align="center" bgcolor="#ffcc00">
				<input type="submit" value="아이디 찾기">
			</td>
		</tr>
	</table>
</form>