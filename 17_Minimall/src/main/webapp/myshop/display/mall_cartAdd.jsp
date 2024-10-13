<%@page import="java.util.Vector"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mall_cartAdd.jsp<br>
<jsp:useBean id = "mallCart" class = "my.shop.mall.CartBean" scope="session"/>
<%
	request.setCharacterEncoding("UTF-8");
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	int oqty = Integer.parseInt(request.getParameter("oqty"));
	
	System.out.println("<mall_cartAdd.jsp> pnum : " + pnum + ", oqty : " + oqty);
	
%>

<!-- 기본값이 scope="page" : 페이지로 올 때마다 객체 만들기 -->
<!-- session : 한번만 만들고 계속 객체 사용 -->
<%
ProductDao pdao = ProductDao.getInstance();
ProductBean pb = pdao.getProductByPnum(pnum); 
if(pb.getPqty() < oqty){ 
%>
	<script type="text/javascript">
		alert('주문 수량이 초과되었습니다.');
		//history.back();
		location.href="mall.jsp";
	</script>
<%		
		return;
	}
	mallCart.addProduct(pnum,oqty);
	response.sendRedirect("mall_cartList.jsp");
%>

