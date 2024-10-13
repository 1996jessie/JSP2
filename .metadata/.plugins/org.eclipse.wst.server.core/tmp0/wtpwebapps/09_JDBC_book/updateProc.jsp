<%@page import="myPkg.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>


<%
	request.setCharacterEncoding("UTF-8");
%>
<%--
	int no = (Integer)session.getAttribute("sno");
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	int price = Integer.parseInt(request.getParameter("price"));
	String day = request.getParameter("day");
	String kind = request.getParameter("kind");
	String bookstore1 = request.getParameter("bookstore");
	int count = Integer.parseInt(request.getParameter("count"));

	BookBean bb = new BookBean();
	bb.setNo(no);
	bb.setTitle(title);
	bb.setAuthor(author);
	bb.setPublisher(publisher);
	bb.setPrice(price);
	bb.setDay(day);
	bb.setKind(kind);
	bb.setBookstore(bookstore1);
	bb.setCount(count);
	
--%>

<jsp:useBean id = "bdao" class = "myPkg.BookDao"/>
<jsp:useBean id = "bb" class = "myPkg.BookBean">
	<jsp:setProperty name = "bb" property = "*"/>
</jsp:useBean>

<%
	String[] barr = request.getParameterValues("bookstore");
	String bookstore2 = "";
	
	for(int i=0;i<barr.length;i++) {
		bookstore2 += barr[i] + " ";
	}
	bb.setBookstore(bookstore2); 

	int cnt = bdao.updateBook(bb);
	String url;
	if(cnt > 0) {
		response.sendRedirect("select.jsp");
	} else {
		response.sendRedirect("updateForm.jsp?no="+bb.getNo()); 
	}
%>
