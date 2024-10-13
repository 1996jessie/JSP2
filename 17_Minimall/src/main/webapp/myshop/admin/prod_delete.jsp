<%@page import="java.io.File"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
prod_delete.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	String pimage = request.getParameter("pimage");
	
	//System.out.println("<prod_delete.jsp> pnum : " + pnum + ", pimage : " + pimage);
 
 	ProductDao pdao = ProductDao.getInstance();
 	int cnt = pdao.deleteProduct(pnum);
 	
	String msg;
	String url;
 	String configFolder = config.getServletContext().getRealPath("/myshop/images");
 	
 	if(cnt > 0) {
 		File delFile = new File(configFolder, pimage);
 		if(delFile.exists()) {
 			delFile.delete();
%>
 		 	<script type="text/javascript">
 		 		alert('<%= pimage %> 이미지 삭제 성공');
			</script> 
<% 
 		}
		msg = "delete Product 성공";
		url = "prod_list.jsp";
 	} else {
		msg = "delete Product 실패";
		url = "prod_list.jsp";
 	}
 %>  
 
 	<script type="text/javascript">
		alert("<%= msg %>");
		location.href = "<%= url %>"
	</script> 