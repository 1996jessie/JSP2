<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
myshop\member\register.jsp<br>
<%-- <%=request.getContextPath()%><br> /17_Minimall --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/script.js"></script>

<form action = "registerPro.jsp" name = "myform" method = "post" onSubmit = "return writeSave()">
	<table border="1" align = "center">
		<tr>
			<td colspan = "2" bgcolor = "#ffcc00" align = "center">
				<font size = "3" color = "#5d1900"> ◈ 기본정보 ◈ </font>
			</td>
		</tr>
		<tr>
			<td bgcolor = "yellow" align = "center">* 회원 아이디</td>
			<td>
				<input type = "text" name = "id" maxlength = "10">
				<input type = "button" value = "중복체크" onClick = "duplicate()">
				<span id = "idmessage"></span>
			</td>
		</tr>
		<tr>
			<td bgcolor = "yellow" align = "center">* 비밀 번호</td>
			<td>
				<input type = "password" name = "password" maxlength = "16" onBlur = "return pwcheck()">
				영문 소문자/숫자 조합 3~8자
			</td>
		</tr>
		<tr>
			<td bgcolor="yellow" align="center">* 비밀 번호 확인</td>
			<td>
				<input type="password" name="repassword" maxlength="16" onKeyUp = "repasswordCheck()">
				<span id = "pwmessage"></span>
			</td>
		</tr>
		<tr>
			<td bgcolor="yellow" align="center">E-Mail</td>
			<td>
				<input type="text" name="email">
			</td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#ffcc00">
				<font size="3" color="#5d1900">◈ 개인 신상 정보 ◈</font>
			</td>
		</tr>
		<tr>
			<td bgcolor="yellow" align="center">한글 이름</td>
			<td>
				<input type="text" name="name" value="홍길동">
				성과 이름을 붙여주세요 (예)홍길동
			</td>
		</tr>
		<tr>
			<td bgcolor="yellow" align="center">주민 등록 번호</td>
			<td>
				<input type="text" name="num1" value="123456"> -
				<input type="text" name="num2" value="1234567">
			</td>
		</tr>
		<tr>
			<td bgcolor="yellow" align="center">휴대 전화 번호</td>
			<td>
				<select name="phone1">
					<option value="010">010
					<option value="011">011
					<option value="051">051
				</select>
				-
				<input type="text" name="phone2" size="4" value="1234"> -
				<input type="text" name="phone3" size="4" value="5678">
				예)011-000-0000
			</td>
		</tr>
		<tr>
			<td bgcolor="yellow" align="center">가입 일자</td>
			<td>
				<input type="text" name="reg_date" value="2020/01/01">
				예)2000/05/22
			</td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#ffcc00" align="center">
				<input type="submit" value="가입하기">
				<input type="button" value="취소">
			</td>
		</tr>
	</table>
</form>