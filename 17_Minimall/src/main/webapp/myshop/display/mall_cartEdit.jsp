<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mall_cartEdit.jsp<br>

<jsp:useBean id = "mallCart" class = "my.shop.mall.CartBean" scope="session"/>

<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	int oqty = Integer.parseInt(request.getParameter("oqty"));
	
	//System.out.println("<mall_cartEdit.jsp> pnum : " + pnum + ", oqty : " + oqty);
	String msg;
	String url;
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pb = pdao.getProductByPnum(pnum);
	if(pb.getPqty() < oqty) {
		msg = "주문 수량 초과";
		url = "mall_cartList.jsp";
	}else {
		mallCart.setEdit(pnum, oqty);
		msg = "주문 수정 성공";
		url = "mall_cartList.jsp";
	}
	
%>
	<script type="text/javascript">
		alert("<%= msg %>");
		location.href = "<%= url %>"
	</script> 