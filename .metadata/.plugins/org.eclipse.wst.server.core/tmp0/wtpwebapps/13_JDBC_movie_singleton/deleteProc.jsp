<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>

<%-- <jsp:useBean id="mdao" class="myPkg.MovieDao"/> --%>

	<%
		MovieDao mdao = MovieDao.getInstance();
		System.out.println("deleteProc.jsp mdao : " + mdao);
	%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int cnt = mdao.deleteMovie(num);
	
	String msg;
	String url;
	if(cnt > 0) {
		msg = "delete 성공";
		url = "select.jsp";
	}else {
		msg = "delete 실패";
		url = "select.jsp";		
	}
%>
	<script type="text/javascript">
		alert("<%= msg %>");
		location.href = '<%= url %>';
	</script> 