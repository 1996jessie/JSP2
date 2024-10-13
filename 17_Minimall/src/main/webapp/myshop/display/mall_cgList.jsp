<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.CategoryDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mall_top.jsp" %>     
<h3><b>Welcome to My Mall</b></h3>  
mall_cgList.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	String cname = request.getParameter("cname");
	//System.out.println("<mall_cgList.jsp> code : " + code + ", cname : " + cname);

	ProductDao pdao = ProductDao.getInstance();
	DecimalFormat df = new DecimalFormat();
	
	ArrayList<ProductBean> plist = pdao.getProductByCategory(code);
%>
		<hr color="green" width="80%">
		<font color="red" size="3"><strong><%= cname %></strong></font>
		<hr color="green" width="80%">
		
<%
		if(plist.size() == 0) {
			out.println("<b>" + cname + " 상품이 없습니다.</b><br><br>");
		}else{
%>
		<table width="90%" border="0" align="center">
			<tr> 
			<%
				int count = 0;
				for(ProductBean pb : plist) {
					count++;
			%>
					<td align="center">
						<a href = "mall_prodView.jsp?pnum=<%=pb.getPnum()%>">
							<img src="<%= request.getContextPath()+"/myshop/images/"+pb.getPimage()%>" width="120" height="80">
						</a><br>
						<%= pb.getPname()%><br>
						<font color = "red"><b><%= df.format(pb.getPrice())%></b></font></b>원<br>
						<font color = "blue">[<%= df.format(pb.getPoint())%>]point</font>							
					</td>
			<%
					if(count % 3 == 0){
						out.println("</tr><tr>");
					}					
				}
			%>
			</tr>
		</table>
		<%
		}
	
	%>		
				
<%@ include file="mall_bottom.jsp" %>