<%@page import="java.util.Vector"%>
<%@page import="my.shop.mall.OrderBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "top.jsp" %>

<jsp:useBean id = "order" class = "my.shop.mall.OrdersDao" scope="session"/>

	<td colspan = "6" align = "center" valign = "top">
		<table border = 1 width = 90% align = "center">
			<tr>
				<td colspan = 5 align = "center" height = >
					<form action = "shopping_list.jsp" method = "post">
						조회할 회원 아이디 입력 : 
						<input type = "text" name = "memid">
						<input type = "submit" value = "내역 조회">
					</form>
				</td>
			</tr>
	
			<tr class = m1 align = "center">
				<td>고객명</td>
				<td>아이디</td>
				<td>상품명</td>
				<td>수량</td>
				<td>금액</td>
			</tr>
			
			<%
			String memid = request.getParameter("memid");
			Vector<OrderBean> orderList = order.getOrderList(memid);
			DecimalFormat df = new DecimalFormat("###,###");
			int totalAmount = 0;
			if(orderList.size() > 0) {
				for(OrderBean ob : orderList) {
					totalAmount += ob.getAmount();
					%>
					<tr>
						<td align = "center"><%= ob.getMname() %></td>
						<td align = "center"><%= ob.getMid() %></td>
						<td align = "center"><%= ob.getPname() %></td>
						<td align = "right"><%= ob.getQty() %></td>
						<td align = "right">&#8361;<%= df.format(ob.getAmount()) %></td>
					</tr>
					<%
				}
			} else{
			%>
				<tr>
					<td colspan = 5 align = "center">주문 내역이 없습니다.</td>
				</tr>
			<%	
			}
			%>
			<tr>
				<td colspan = 4 align = "center">총합</td>
				<td colspan = 2 align = "right">&#8361;<%= df.format(totalAmount) %></td>
			</tr>
		</table>
	</td>
<%@ include file = "bottom.jsp" %>