<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
prod_proc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String pname = request.getParameter("pname");
	//System.out.println("pname:" + pname);
%>

<%
	String uploadDir = config.getServletContext().getRealPath("/myshop/images");
	//System.out.println("uploadDir:" + uploadDir);
	MultipartRequest mr = null;
	mr = new MultipartRequest(request, uploadDir, 1024*1024*10, "UTF-8", new DefaultFileRenamePolicy());
/* 	String pimage = mr.getFilesystemName("pimage");
	System.out.println(pimage); */
	
	String opimage = mr.getOriginalFileName("pimage");
	//System.out.println(opimage);
	
	String requestDir = request.getContextPath()+"/myshop/images";
	requestDir = requestDir + "/" + opimage;
	//System.out.println("requestDir:" + requestDir);

	ProductDao pdao = ProductDao.getInstance();
	int cnt = pdao.insertProduct(mr);
	
	String msg;
	String url;
	if(cnt > 0) {
		msg = "insert 성공";
		url = "prod_list.jsp";
	} else {
		msg = "insert 실패";
		url = "prod_input.jsp";
	}
	
%>
	<script type="text/javascript">
		alert("<%= msg %>");
		location.href = "<%= url %>"
	</script> 
