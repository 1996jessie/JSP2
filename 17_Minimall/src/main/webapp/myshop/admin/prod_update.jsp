<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "top.jsp" %>

<%
	String[] pspec = {"NORMAL", "HIT", "NEW", "BEST"};
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pb = pdao.getProductByPnum(pnum);
	String requestDir = request.getContextPath()+"/myshop/images";
%>
	<td colspan = "6" align = "center">
		<form action = "prod_updateProc.jsp?pnum=<%= pb.getPnum() %>&pcategory_fk=<%= pb.getPcategory_fk() %>" method = "post" enctype = "multipart/form-data">
			<table border = "1">
				<caption>상품 수정(prod_update.jsp)</caption>
				<tr>
					<td class = "m2" width = "15%">카테고리</td>
					<td>
						<select name = "pcategory_fk" disabled>
							<%
						        CategoryDao cdao = CategoryDao.getInstance();
						        ArrayList<CategoryBean> clist = cdao.getAllCategory();
						        if(clist.size() == 0) {
							%>   	 <option value="카테고리 없음">카테고리 없음</option>
							<% } else {
									for(CategoryBean cb : clist) {					
						    %> <option value="<%= cb.getCode() %>" <% if(pb.getPcategory_fk().contains(cb.getCode())) { %> selected <% } %>><%= cb.getCname() %>[<%= cb.getCode() %>]</option>
						    <%  } 
						    } %>
						</select>
					</td>
				</tr>
				
				<tr>
					<td class = "m2">상품번호</td>
					<td><%= pb.getPnum() %></td>
				</tr>
								
				<tr>
					<td class = "m2">상품명</td>
					<td>
						<input type = "text" name = "pname" value = "<%= pb.getPname() %>">
					</td>
				</tr>
				
				
				<tr>
					<td class = "m2">제조회사</td>
					<td>
						<input type = "text" name = "pcompany" value = "<%= pb.getPcompany() %>">
					</td>
				</tr>
				
				<tr>
					<td class = "m2">상품이미지</td>
					<td>
						
						<img src = "<%= requestDir + "/" + pb.getPimage() %>" width = "100" height = "100">
						<input type = "file" name = "pimage">
						<input type = "text" name = "pimage2" value = "<%=  pb.getPimage() %>">
					</td>
				</tr>
				
				<tr>
					<td class = "m2">상품수량</td>
					<td>
						<input type = "text" name = "pqty" value = "<%=  pb.getPqty() %>">
					</td>
				</tr>
				
				<tr>
					<td class = "m2">상품 가격</td>
					<td>
						<input type = "text" name = "price" value = "<%= pb.getPrice() %>">
					</td>
				</tr>
				
				<tr>
					<td class = "m2">상품 스펙</td>
					<td>
						<select name="pspec">
						    <% for (int i = 0; i < pspec.length; i++) { %>
						        <option value="<%= pspec[i] %>" <% if(pb.getPspec().equals(pspec[i])) { %> selected <% } %>><%= pspec[i] %></option>
						    <% } %>
						</select>
					</td>
				</tr>
				
				<tr>
					<td class = "m2">상품 소개</td>
					<td>
						<textarea name = "pcontents" rows="5" cols="30"> <%= pb.getPcontents() %></textarea>
					</td>
				</tr>
				
				<tr>
					<td class = "m2">상품 포인트</td>
					<td>
						<input type = "text" name = "point" value = "<%= pb.getPoint() %>">
					</td>
				</tr>
				
				<tr>
					<td colspan = "2" align = "center" class = "m1">
						<input type = "submit" value = "상품 수정">
						<input type = "reset" value = "취 소">
					</td>
				</tr>
			</table>
		</form>
	</td>
<%@ include file = "bottom.jsp" %>