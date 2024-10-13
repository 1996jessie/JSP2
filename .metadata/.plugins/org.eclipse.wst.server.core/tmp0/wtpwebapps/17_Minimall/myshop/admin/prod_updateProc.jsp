<%@page import="java.io.File"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
prod_updateProc.jsp<br>

<%
    String configFolder = config.getServletContext().getRealPath("/myshop/images");
	MultipartRequest mr = new MultipartRequest(request, configFolder, 1024*1024*10, "UTF-8", new DefaultFileRenamePolicy());
	
    String newimage = mr.getFilesystemName("pimage");
    String orgimg = mr.getParameter("pimage2");
    String img = null;
    if(orgimg == null) {
    	if(newimage != null) { 
    		//System.out.println("새 이미지 업로드");
    		img = newimage;
    	}else {
    		 //System.out.println("딱히 할 일 없음");
    	}
    } else {
    	if(newimage != null) {
    		//System.out.println("기존 파일 삭제 & 새 이미지 업로드");
    		img = newimage;
    		File delFile = new File(configFolder, orgimg);
    		delFile.delete();
    	}else {
    		//System.out.println("기존 이미지 그대로 사용");
    		img = orgimg;
    	}
    }
    
	ProductDao pdao = ProductDao.getInstance();
	int cnt = pdao.updateProduct(mr,img);
    
	String msg;
	String url;
	if(cnt > 0) {
		msg = "update Product 성공";
		url = "prod_list.jsp";
	} else {
		msg = "update Product 실패";
		url = "prod_update.jsp?pnum="+mr.getParameter("pnum");
	}
%>

	<script type="text/javascript">
		alert("<%= msg %>");
		location.href = "<%= url %>"
	</script> 