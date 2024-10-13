<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mall_calculate.jsp<br>

<jsp:useBean id = "mallCart" class = "my.shop.mall.CartBean" scope="session"/>
<jsp:useBean id = "order" class = "my.shop.mall.OrdersDao" scope="session"/>

<%
	int memno = (Integer)session.getAttribute("memno");
	Vector<ProductBean> cartList = mallCart.getAllProducts();
	int cnt = order.insertOrders(memno, cartList);
	
	String url;
	String msg;
	if(cnt>0) {
		msg = "결제 성공";
		mallCart.removeAllProduct();
		url = "mall.jsp";
		
	} else {
		msg = "결제 실패";
		url = "mall.jsp";
	}

%>
	<script type="text/javascript">
		alert("<%= msg %>");
		location.href = "<%= url %>"
	</script> 