<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mall_top.jsp" %>    

<h3><b>Welcome to My Mall</b></h3>
<%
	ProductDao pdao = ProductDao.getInstance();
	DecimalFormat df = new DecimalFormat();
	String[] pspec = {"HIT","NEW","BEST","NORMAL"};
	for(int i=0;i<pspec.length;i++){ 
		ArrayList<ProductBean> plist = pdao.selectByPspec(pspec[i]);
%>
		<hr color="green" width="80%">
		<font color="red" size="3"><strong><%=pspec[i]%></strong></font>
		<hr color="green" width="80%">
<%
		if(plist.size() == 0) {
			out.println("<b>" + pspec[i] + " 상품이 없습니다.</b><br><br>");
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
							<img src="<%= request.getContextPath()+"/myshop/images/"+pb.getPimage()%>" width="120" height="80"><br>
						</a>
						<%= pb.getPname()%><br>
						<font color = "red"><b><%= df.format(pb.getPrice())%></font></b>원<br>
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
	}
	%>
	
<%@ include file="mall_bottom.jsp" %>