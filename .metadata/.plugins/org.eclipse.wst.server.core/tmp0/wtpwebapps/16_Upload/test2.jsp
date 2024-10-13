<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
test2.jsp<br>

<%
	int maxSize = 1024 * 1024 * 10;
	String saveFolder = "test";
	String encoding = "UTF-8";
	
	String configFolder = config.getServletContext().getRealPath("test");
	String requestFolder = request.getContextPath() + "/" + saveFolder;
	
	MultipartRequest multi = new MultipartRequest(request, configFolder, maxSize, encoding, new DefaultFileRenamePolicy());
	
	String file = (String)multi.getFileNames().nextElement();
	String orgname = multi.getOriginalFileName(file);
	String path = requestFolder + "\\" + orgname;
%>

이름 : <%= multi.getParameter("name") %><br><br>
이미지 : <br>
<img src = "<%= path %>"/><br><br>