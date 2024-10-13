<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mall_cartList.jsp<br>
<%@ include file="mall_top.jsp" %>     
<jsp:useBean id = "mallCart" class = "my.shop.mall.CartBean" scope="session"/>
<!-- 한번 만든 객체를 계속 사용하고 싶으면 아이디가 동일해야 함 -->
<%
	Vector<ProductBean> cartList = mallCart.getAllProducts();
	DecimalFormat df = new DecimalFormat("###,###");
%>


<table border = 1>
	<tr>
		<td colspan = "6" align = "center">
			<h4>장바구니 보기</h4>
		</td>
	</tr>
	
	<tr class = "m1" align = "center">
		<td width = "10%">번호</td>
		<td width = "20%">상품명</td>
		<td width = "20%">수량</td>
		<td width = "20%">단가</td>
		<td width = "20%">금액</td>
		<td width = "10%">삭제</td>
	</tr>

<%
	int cartTotalPrice = 0;
	int cartTotalPoint = 0;
	if(cartList.size() == 0) {
%>		<tr align = "center">
			<td colspan = 6> 장바구니에 담긴 상품이 없습니다.</td>
		</tr>
<%	} else {
		for(ProductBean pb : cartList) {
%>			<tr align = "center">
			<td><%= pb.getPnum() %></td>
			<td>
				<img src="<%= request.getContextPath()+"/myshop/images/"+pb.getPimage()%>" width="120" height="80"><br>
				<%= pb.getPname() %>
			</td>
			<td>
				<form name = "f" method = "post" action = "mall_cartEdit.jsp">
					<input type = "hidden" name = "pnum" value = <%= pb.getPnum() %>>   
					<input type = "text" name = "oqty" value = "<%= pb.getPqty() %>" size = 2>개
					<input type = "submit" value = "수정">
				</form>
			</td>
			<td align = "right">
				<%= df.format(pb.getPrice()) %>원<br>
				[<%= df.format(pb.getPoint()) %>] point
			</td>
			<td align = "right">
			<%= df.format(pb.getPrice() * pb.getPqty()) %>원<br>
			[<%= df.format(pb.getPoint() * pb.getPqty()) %>] point
			</td>
			<td><a href = "mall_cartDel.jsp?pnum=<%= pb.getPnum() %>">삭제</a></td>
		</tr>
		
		<% 
		cartTotalPrice += pb.getPrice() * pb.getPqty();
		cartTotalPoint += pb.getPoint() * pb.getPqty();
		%>
<%		}
	}
%>		
	<tr class = m1>
		<td colspan = 4 align = "center">
			<b>장바구니 총액 : </b>
			<font color = "red"><%= df.format(cartTotalPrice) %> 원</font><br>
			<b>총 적립 포인트 : </b>
			<font color = "green">[<%= df.format(cartTotalPoint) %>] point</font>
		</td>
		<td colspan = 2 align = "center">
			<a href = "mall_order.jsp">[주문하기]</a>
			[계속 쇼핑]
		</td>
	</tr>

</table>

<%@ include file="mall_bottom.jsp" %>     