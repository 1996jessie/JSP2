<%@page import="my.shop.CategoryBean"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "top.jsp" %>
<%
	int cnum = Integer.parseInt(request.getParameter("cnum"));

	CategoryDao cdao = CategoryDao.getInstance();
	CategoryBean cb = cdao.getCategoryByCnum(cnum);
%>

<td colspan = "6" align = "center" valign = "top">
	<form action = "cate_updateProc.jsp" method = "post">
		<table border = "1" width = "60%">
		<caption> 카테고리 수정(cate_update.jsp) </caption>
			<tr>
				<td bgcolor = "yellow" align = "center">번호</td>
				<td>
					<%= cnum %>
					<input type = "hidden" name = cnum value = "<%= cb.getCnum() %>">
				</td>
			</tr>
			
			<tr>
				<td bgcolor = "yellow" align = "center">카테고리 코드</td>
				<td>
					<input type = "text" name = "code" value = "<%= cb.getCode() %>">
				</td>
			</tr>
			
			<tr>
				<td bgcolor = "yellow" align = "center">카테고리명</td>
				<td>
					<input type = "text" name = "cname" value = "<%= cb.getCname() %>">
				</td>
			</tr>
	
			<tr align = "center">
				<td colspan = "2">
					<input type = "submit" value = "수정하기">
					<input type = "reset" value = "취소">
					<a href="cate_list.jsp">
						<input type = "button" value = "돌아가기">
					</a>
				</td>
			</tr>
		</table>
	</form>
</td>
<%@ include file = "bottom.jsp" %>