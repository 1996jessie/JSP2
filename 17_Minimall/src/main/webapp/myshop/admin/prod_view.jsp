<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
prod_view.jsp<br>
<%@ include file = "top.jsp" %>

	<td colspan = "6" align = "center">
	<%
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		ProductDao pdao = ProductDao.getInstance();
		ProductBean pb = pdao.getProductByPnum(pnum);
		String requestDir = request.getContextPath()+"/myshop/images";
	
	%>
		<table border = 1 width = "80%" class = "outline">
		<caption>상품 상세보기</caption>
			<tr>
				<td class = "m2" align = "center">카테고리</td>
				<td><%= pb.getPcategory_fk() %></td>
				<td class = "m2" align = "center">상품번호</td>
				<td><%= pb.getPnum() %></td>
			</tr>
			
			<tr>
				<td class = "m2" align = "center">상품명</td>
				<td><%= pb.getPname() %></td>
				<td class = "m2" align = "center">제조회사</td>
				<td><%= pb.getPcompany() %></td>
			</tr>
					
			<tr>
				<td class = "m2" align = "center">상품이미지</td>
				<td colspan = "3" align = "center"><img src = "<%= requestDir + "/" + pb.getPimage() %>" width = "100" height = "100"></td>
			</tr>
			
			<tr>
				<td class = "m2" align = "center">상품 수량</td>
				<td><%= pb.getPqty() %></td>
				<td class = "m2" align = "center">상품 가격</td>
				<td><%= pb.getPrice() %></td>
			</tr>
			
			<tr>
				<td class = "m2" align = "center">상품 스펙</td>
				<td><%= pb.getPspec() %></td>
				<td class = "m2" align = "center">상품 포인트</td>
				<td><%= pb.getPoint() %></td>
			</tr>
			
			<tr>
				<td class = "m2" align = "center">상품 소개</td>
				<td colspan = "3"><%= pb.getPcontents() %></td>
			</tr>	
			
			<tr>
				<td colspan = "4" class = "m1" align = "center">
					<a href = "prod_list.jsp"> 
						<input type = "button" value = "돌아가기"> 
					</a>
				</td>
			</tr>				
		</table>
	
	</td>
<%@ include file = "bottom.jsp" %>