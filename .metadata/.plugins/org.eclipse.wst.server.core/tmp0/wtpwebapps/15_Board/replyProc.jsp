<%@page import="board.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
replyProc.jsp<br>
<%

	request.setCharacterEncoding("UTF-8");
	
	int ref = Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = Integer.parseInt(request.getParameter("re_level"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	System.out.println("<replyProc.jsp> ref : " + ref + ", re_step : " + re_step + ", re_level : " + re_level);
	System.out.println("<replyProc.jsp>의 pageNum : " + pageNum);
%>

<jsp:useBean id = "bb" class = "board.BoardBean">
	<jsp:setProperty name = "bb" property="*"/>
</jsp:useBean>

<%
	bb.setReg_date(new Timestamp(System.currentTimeMillis())); 
	bb.setIp(request.getRemoteAddr()); 
		
   	BoardDao bdao = BoardDao.getInstance();
   	bdao.replyArticle(bb);
%>
<jsp:forward page="list.jsp?pageNum=<%= pageNum %>"/>