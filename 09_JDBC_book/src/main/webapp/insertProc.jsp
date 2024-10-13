<%@page import="myPkg.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
/* 

	BookBean bb = new BookBean();
	int no = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String author = request.getParameter("author");;
	String publisher = request.getParameter("publisher");;
	int price = Integer.parseInt(request.getParameter("price"));
	String day = request.getParameter("day");
	String kind = request.getParameter("kind");
	String bookstore = request.getParameter("bookstore");
	int count = Integer.parseInt(request.getParameter("count"));
	
	bb.setNo(no);
	bb.setTitle(title);
	bb.setAuthor(author);
	bb.setPublisher(publisher);
	bb.setPrice(price);
	bb.setDay(day);
	bb.setKind(kind);
	bb.setBookstore(bookstore);
	bb.setCount(count); */
%>
<jsp:useBean id="bdao" class="myPkg.BookDao"/>
<jsp:useBean id = "bb" class = "myPkg.BookBean">
	<jsp:setProperty name = "bb" property = "*"/>
</jsp:useBean>

<%
	String [] arr = request.getParameterValues("bookstore");
	String bookstore = "";
	for(int i=0;i<arr.length;i++) {
		bookstore += arr[i] + " ";
	}
	bb.setBookstore(bookstore); //다시 호출해서 덮어쓰기
	
	int cnt = bdao.insertBook(bb);
	
	if(cnt == 1) {
		response.sendRedirect("select.jsp");
	} else {
		response.sendRedirect("insertForm.jsp");
	}
%>
