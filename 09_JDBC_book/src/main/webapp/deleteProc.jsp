<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>

<%
	int no = Integer.parseInt(request.getParameter("no"));
%>

<jsp:useBean id="bdao" class="myPkg.BookDao"/>

<%
	int cnt = bdao.deleteBook(no);
	
	if(cnt > 0) {
		response.sendRedirect("select.jsp");
	}else {
		response.sendRedirect("select.jsp");
	}

%>

