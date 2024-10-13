
<%@page import="my.shop.board.BoardDao"%>
<%@page import="my.shop.board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../display/mall_top.jsp" %>  
updateForm.jsp<br>

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


<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	//System.out.println("<updateForm.jsp> num : " + num + ", pageNum : " + pageNum);
	
%>


	<%
		BoardDao bdao = BoardDao.getInstance();
		BoardBean bb = bdao.updateGetArticle(num);
		
		//System.out.println("<updateForm.jsp> bb.getWriter() : " + bb.getWriter() + ", bb.getContent() : " + bb.getContent());
		//System.out.println("<updateForm.jsp> bb.getEmail() : " + bb.getEmail());
	
	%>
<b>글쓰기</b>

<body>
	<form action="updateProc.jsp?num=<%= num %>&pageNum=<%= pageNum %>" method="post">
		<table border = 1 width = "500">
			<tr>
				<td colspan = "2"  bgcolor = "<%= value_c %>" align = "right" onClick = "location.href = 'list.jsp'">글목록</td>
			</tr>
			<tr>
				<td bgcolor = "<%= value_c %>" width = "150" align = "center">이름</td>
				<td><input type = "text" name = "writer" maxlength="10" value = "<%= bb.getWriter() %>"></td>
			</tr>
			<tr>
				<td bgcolor = "<%= value_c %>" width = "150" align = "center">제목</td>
				<td><input type = "text" name = "subject" value = "<%= bb.getSubject() %>"></td>
			</tr>
			<tr>
				<td bgcolor = "<%= value_c %>" width = "150" align = "center">Email</td>
				<td><input type = "text" name = "email" value = "<%= bb.getEmail() %>"></td>
			</tr>
			<tr>
				<td bgcolor = "<%= value_c %>" width = "150" align = "center">내 용</td>
				<td><textarea name="content" rows="20" cols="50"><%= bb.getContent() %></textarea></td>
			</tr>
			<tr>
				<td bgcolor = "<%= value_c %>" width = "150" align = "center">비밀번호</td>
				<td><input type = "password" name = "passwd"></td>
			</tr>
			<tr>
				<td colspan = "2" bgcolor = "<%= value_c %>" width = "150" align = "center">
				<input type = "submit" value = "글수정">
				<input type = "reset" value = "다시작성">
				<input type = "button" value = "목록보기" onClick = "location.href = 'list.jsp'">
				</td>			
			</tr>	
		</table>
	</form>
</body>
<%@ include file="../display/mall_bottom.jsp" %>  