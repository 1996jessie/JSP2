<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	function checkDel(pnum, pimage) {
		var isDel = confirm("정말 삭제하시겠습니까?");
		//alert(choice);
		if(isDel) {
			location.href = "prod_delete.jsp?pnum="+pnum+"&pimage="+pimage;
		} else {
			location.href = "prod_list.jsp";
		}
	}
</script>

<%@ include file = "top.jsp" %>
	<td colspan = "6" align = "center" valign = "top">
		<table width = "80%" class = "outline">
			<caption> 상품 목록(prod_list.jsp) </caption>
			<tr bgcolor = "yellow">
				<th>번호</th>
				<th>상품 코드</th>
				<th>상품명</th>
				<th>이미지</th>
				<th>가격</th>
				<th>제조사</th>
				<th>수량</th>
				<th>수정|삭제</th>
			</tr>
			<%
				ProductDao pdao = ProductDao.getInstance();
				ArrayList<ProductBean> plist = pdao.getAllProducts();
				if(plist.size() == 0) {
			%>		<tr align = "center" >
						<td colspan = "8">등록된 상품이 없습니다.</td>
					</tr>
			<%	} else {
					for(ProductBean pb : plist) {
						String requestDir = request.getContextPath()+"/myshop/images";
			%>	
					<tr align = "center">
						<td align = "right"><%= pb.getPnum() %></td>
						<td><%= pb.getPcategory_fk() %></td>
						<td><%= pb.getPname() %></td>
						<td>
							<a href = "prod_view.jsp?pnum=<%= pb.getPnum() %>">
								<img src = "<%= requestDir + "/" + pb.getPimage() %>" width = "50" height = "50">
							</a>
						</td>
						<td align = "right"><%= pb.getPrice() %></td>
						<td><%= pb.getPcompany() %></td>
						<td align = "right"><%= pb.getPqty() %></td>
						<td>
							<a href = "prod_update.jsp?pnum=<%= pb.getPnum() %>"> 수정 </a> |
							<a href = "javascript:checkDel('<%= pb.getPnum() %>','<%= pb.getPimage() %>')"> 삭제 </a>
						</td>
					</tr>
				<%	}	
				} %>
		</table>
	</td>
<%@ include file = "bottom.jsp" %>