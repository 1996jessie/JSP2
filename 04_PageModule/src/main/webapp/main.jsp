<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
main.jsp<br>

<h1>템플릿 페이지 - 메인 페이지</h1>
<form method = "post" action = "control.jsp">
	<table border = 1>
		<tr>
			<th colspan = 2>제품을 선택해주세요</th>
		</tr>
		<tr>
			<td>제품</td>
			<td>
				<input type = "radio" name = "product" value = "tv">텔레비젼<br>
				<input type = "radio" name = "product" value = "dc">디지털 카메라<br>
				<input type = "radio" name = "product" value = "mp">MP3 플레이어
			</td>
		</tr>
		<tr>
			<td colspan = 2>
				<input type="submit" value = "확인">
				<input type="reset" value = "취소">
			</td>
		</tr>
	</table>
</form>
