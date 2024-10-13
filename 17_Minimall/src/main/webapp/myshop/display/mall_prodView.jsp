<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
mall_prodView.jsp<br>

<%@ include file="mall_top.jsp" %>    

<script type="text/javascript">
	function goCart(pnum){
		//alert(pnum);
		oqty = document.f.oqty.value;
		if(oqty == "" || oqty < 1) {
			alert('수량 누락 또는 1보다 작은 수 입력했습니다.');
			location.href = "mall.jsp";
			return;
		}
		location.href = "<%=request.getContextPath()%>/myshop/display/mall_cartAdd.jsp?pnum=" + pnum + "&oqty=" + oqty;
	}
	
	function goOrder(pnum) {
		//alert(pnum);
		oqty = document.f.oqty.value;
		if(oqty == "" || oqty < 1) {
			alert('수량 누락 또는 1보다 작은 수 입력했습니다.');
			location.href = "mall.jsp";
			return;
		}
		location.href = "<%=request.getContextPath()%>/myshop/display/mall_order.jsp?pnum=" + pnum + "&oqty=" + oqty;
	}
</script>


<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	//System.out.println("<mall_prodView.jsp> pnum : " + pnum);
	
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pb = pdao.getProductByPnum(pnum);
	
%>


<table align = "center" class = "outline">
	<tr align = "center" class = "m1">
		<td colspan = "2"><font color="green">[<%= pb.getPname() %>] 상품 정보</font></td>
	</tr>
	
	<tr>
		<td align = "center" class = "m3">
			<img src="<%= request.getContextPath()+"/myshop/images/"+pb.getPimage()%>" width="240" height="160">
		</td>
		<td class = "m3">
			<form name = "f">
				상품번호 : <%= pb.getPnum() %><br>
				상품이름 : <%= pb.getPname() %><br>
				상품가격 : <%= pb.getPrice() %><br>
				상품포인트 : <%= pb.getPoint() %><br>
				상품갯수 : <input type = "text" name = "oqty" value = "1">개<br>
				
				<table align = "center">
					<tr>
						<td>
							<a href = "javascript:goCart('<%= pb.getPnum() %>')">
								<img src = "<%= contextPath %>/img/cartbtn.gif" width = "100" height = "40">
							</a>
						</td>
						<td>
							<a href = "javascript:goOrder('<%= pb.getPnum() %>')">
								<img src = "<%= contextPath %>/img/orderbtn.gif" width = "100" height = "40">
							</a>
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	
	<tr height = "300" valign = "top">
		<td colspan = 2>
			<b>상품 상세 설명</b><br>
			<%= pb.getPcontents() %>
		</td>
	</tr>




</table>

<%@ include file="mall_bottom.jsp" %>    