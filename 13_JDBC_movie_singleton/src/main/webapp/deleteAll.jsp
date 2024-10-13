<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteAll.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String rowcheck[] = request.getParameterValues("rowcheck");
/* 	for(int i=0;i<rowcheck.length;i++) {
		System.out.print(rowcheck[i]+" ");
	}   */
%>
<%-- <jsp:useBean id="mdao" class="myPkg.MovieDao"/> --%>
<jsp:useBean id = "mb" class = "myPkg.MovieBean">
	<jsp:setProperty name="mb" property="*"/>
</jsp:useBean>
	<%
		MovieDao mdao = MovieDao.getInstance();
		System.out.println("deleteAll.jsp mdao : " + mdao);
	%>

<%	
	int cnt = mdao.deleteAllMovie(rowcheck);
	
	String msg;
	String url;
	if(cnt > 0) {
		msg = "allDelete 성공";
		url = "select.jsp";
	}else {
		msg = "allDelete 실패";
		url = "select.jsp";		
	}
%>
	<script type="text/javascript">
		alert("<%= msg %>");
		location.href = '<%= url %>';
	</script> 