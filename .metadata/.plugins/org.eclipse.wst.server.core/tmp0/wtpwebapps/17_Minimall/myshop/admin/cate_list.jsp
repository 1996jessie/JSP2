<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "top.jsp" %>

	<td colspan = "6" align = "center" valign = "top">
		<table border = "1" width = "80%">
			<caption> 카테고리 목록(cate_list.jsp) </caption>
			<tr bgcolor = "yellow">
				<th>번호</th>
				<th>카테고리 코드</th>
				<th>카테고리명</th>
				<th>수정 | 삭제</th>
			</tr>
			<%
				CategoryDao cdao = CategoryDao.getInstance();
				ArrayList<CategoryBean> clist = cdao.getAllCategory();
				if(clist.size() == 0) {
			%>		<tr align = "center">
						<td colspan = "4">등록된 카테고리가 없습니다.</td>
					</tr>
			<%	} else {
					for(CategoryBean cb : clist) {
			%>	
						<tr align = "center">
						<td align = "right"><%= cb.getCnum() %></td>
						<td><%= cb.getCode() %></td>
						<td><%= cb.getCname() %></td>
						<td>
							<a href = "cate_update.jsp?cnum=<%= cb.getCnum() %>">수정</a> |
							<a href = "cate_delete.jsp?cnum=<%= cb.getCnum() %>">삭제</a>
						</td>
					</tr>
				<%	}	
				} %>
		</table>
	</td>
<%@ include file = "bottom.jsp" %>