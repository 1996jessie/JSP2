<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mall_order.jsp<br>
<%@ include file="mall_top.jsp" %>   

<jsp:useBean id = "mallCart" class = "my.shop.mall.CartBean" scope="session"/>
<%
	Vector<ProductBean> cartList = mallCart.getAllProducts();	
	DecimalFormat df = new DecimalFormat("###,###");
	
	String pnum = request.getParameter("pnum");
	String oqty = request.getParameter("oqty");

	//System.out.println("<mall_order.jsp> pnum : " + pnum + ", oqty : " + oqty);
	
	if(pnum != null || oqty != null) { //즉시 구매하기
		mallCart.addProduct(Integer.parseInt(pnum), Integer.parseInt(oqty));
	}

%>

<table border = 1 width = "90%" align = "center" class = "outline">
	<tr align = "center" class = "m2">
		<td colspan = 3> <h4>결제 내역서 보기</h4> </td>
	</tr>
	
	<tr align = "center" class = "m1">
		<td width = "40%"> 상품명 </td>
		<td width = "20%"> 수량 </td>
		<td width = "40%"> 금액 </td>
	</tr>
	
	<%
	int cartTotalPrice = 0;
	for(ProductBean pb : cartList) {
	%>	
		<tr>
			<td align = "center"><%= pb.getPname() %></td>
			<td align = "right"><%= pb.getPqty() %>개</td>
			<td align = "right"><%= df.format(pb.getPrice() * pb.getPqty())%>원</td>
		</tr>
	<%
		cartTotalPrice += pb.getPrice() * pb.getPqty();
	}
	%>
	
	<tr align = "center" class = "m1">
		<td colspan = 3 >결제하실 총액은 : <font color = "red"><%= cartTotalPrice %>원</font></td>
	</tr>

</table>
<br>
<input type = "button" value = "결제하기" onClick = "location.href='mall_calculate.jsp'"/>

<%@ include file="mall_bottom.jsp" %>   
