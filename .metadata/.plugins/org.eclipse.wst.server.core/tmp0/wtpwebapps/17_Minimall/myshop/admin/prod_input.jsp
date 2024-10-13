<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "top.jsp" %>

<%
	String[] pspec = {"NORMAL", "HIT", "NEW", "BEST"};
%>
	<td colspan = "6" align = "center">
		<form action = "prod_proc.jsp" method = "post"  enctype = "multipart/form-data">
			<table border = "1">
				<caption>상품등록</caption>
				<tr>
					<td class = "m2">카테고리</td>
					<td>
						<select name = "pcategory_fk">
							<%
						        CategoryDao cdao = CategoryDao.getInstance();
						        ArrayList<CategoryBean> clist = cdao.getAllCategory();
						        if(clist.size() == 0) {
							%>   	 <option value="카테고리 없음">카테고리 없음</option>
							<% } else {
									for(CategoryBean cb : clist) {					
						    %> <option value="<%= cb.getCode() %>"><%= cb.getCname() %>[<%= cb.getCode() %>]</option>
						    <%  } 
						    } %>
						</select>
					</td>
				</tr>
				
				<tr>
					<td class = "m2">상품명</td>
					<td>
						<input type = "text" name = "pname">
					</td>
				</tr>
				
				<tr>
					<td class = "m2">상품코드</td>
					<td>
						<input type = "text" name = "pcode">
					</td>
				</tr>
				
				<tr>
					<td class = "m2">제조회사</td>
					<td>
						<input type = "text" name = "pcompany">
					</td>
				</tr>
				
				<tr>
					<td class = "m2">상품이미지</td>
					<td>
						<input type = "file" name = "pimage">
					</td>
				</tr>
				
				<tr>
					<td class = "m2">상품수량</td>
					<td>
						<input type = "text" name = "pqty">
					</td>
				</tr>
				
				<tr>
					<td class = "m2">상품 가격</td>
					<td>
						<input type = "text" name = "price">
					</td>
				</tr>
				
				<tr>
					<td class = "m2">상품 스펙</td>
					<td>
						<select name="pspec">
						    <% for (int i = 0; i < pspec.length; i++) { %>
						        <option value="<%= pspec[i] %>"><%= pspec[i] %></option>
						    <% } %>
						</select>
					</td>
				</tr>
				
				<tr>
					<td class = "m2">상품 소개</td>
					<td>
						<textarea name = "pcontents" rows="5" cols="30"></textarea>
					</td>
				</tr>
				
				<tr>
					<td class = "m2">상품 포인트</td>
					<td>
						<input type = "text" name = "point">
					</td>
				</tr>
				
				<tr>
					<td colspan = "2" align = "center" class = "m1">
						<input type = "submit" value = "상품등록">
						<input type = "reset" value = "취 소">
					</td>
				</tr>
			</table>
		</form>
	</td>
<%@ include file = "bottom.jsp" %>