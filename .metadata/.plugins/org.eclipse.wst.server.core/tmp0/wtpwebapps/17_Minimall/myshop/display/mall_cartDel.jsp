<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mall_cartDel.jsp<br>
<jsp:useBean id = "mallCart" class = "my.shop.mall.CartBean" scope="session"/>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	System.out.println("<mall_cartDel.jsp> pnum :" + pnum);
	mallCart.removeProduct(pnum);

%>

	<script type="text/javascript">
		alert("삭제 성공");
		location.href = 'mall_cartList.jsp';
	</script> 
