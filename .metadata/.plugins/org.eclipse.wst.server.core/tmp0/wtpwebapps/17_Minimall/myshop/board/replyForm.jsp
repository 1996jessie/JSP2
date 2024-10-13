<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../display/mall_top.jsp" %>  
replyForm.jsp<br>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = Integer.parseInt(request.getParameter("re_level"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));

	System.out.println("<replyForm.jsp>부모가 넘긴 ref : " + ref + ", 부모의 re_step : " + re_step + ", 부모의 re_level : " + re_level);
	System.out.println("<replyForm.jsp>로 넘어온 pageNum : " + pageNum);
%>

<%@include file = "color.jsp" %>
<link rel="stylesheet" href="style.css" type = "text/css"/>
<style>
	body {
		text-align: center;
	}
	table{
		margin: 5px auto;
	}
</style>

<b>답글쓰기</b>

<body>
	<form action="replyProc.jsp?pageNum=<%= pageNum %>" method="post">
		<table border = 1 width = "500">
			<tr>
				<td colspan = "2"  bgcolor = "<%= value_c %>" align = "right" onClick = "location.href = 'list.jsp'">글목록</td>
			</tr>
			<tr>
				<td bgcolor = "<%= value_c %>" width = "150" align = "center">이름</td>
				<td><input type = "text" name = "writer" maxlength="10" value = <%= memid %>></td>
			</tr>
			<tr>
				<td bgcolor = "<%= value_c %>" width = "150" align = "center">제목</td>
				<td><input type = "text" name = "subject" value = "[답글]"></td>
			</tr>
			<tr>
				<td bgcolor = "<%= value_c %>" width = "150" align = "center">Email</td>
				<td><input type = "text" name = "email"></td>
			</tr>
			<tr>
				<td bgcolor = "<%= value_c %>" width = "150" align = "center">내 용</td>
				<td><textarea name = "content" rows = "20" cols = "50" ></textarea></td>
			</tr>
			<tr>
				<td bgcolor = "<%= value_c %>" width = "150" align = "center">비밀번호</td>
				<td>
				<input type = "password" name = "passwd">
				<input type = "hidden" name = "num" value = "<%= num %>">
				<input type = "hidden" name = "ref" value = "<%= ref %>">
				<input type = "hidden" name = "re_step" value = "<%= re_step %>">
				<input type = "hidden" name = "re_level" value = "<%= re_level %>">
				</td>
			</tr>
			<tr>
				<td colspan = "2" bgcolor = "<%= value_c %>" width = "150" align = "center">
				<input type = "submit" value = "답글쓰기">
				<input type = "reset" value = "다시작성">
				<input type = "button" value = "목록보기" onClick = "location.href = 'list.jsp?pageNum = <%= pageNum %>'">
				</td>			
			</tr>	
		</table>
	</form>
</body>
<%@ include file="../display/mall_bottom.jsp" %>  