<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");	
	//System.out.println("id_check_proc.jsp의 userId : " + userId);
%>
<%-- <jsp:useBean id="mdao" class="myPkg.MovieDao"/> --%>
	<%
		MovieDao mdao = MovieDao.getInstance();
		System.out.println("id_check_proc.jsp mdao : " + mdao);
	%>

<%
	boolean flag = mdao.searchId(userId);
	String str;
	if(flag == true) {
		//System.out.println("아이디 중복");
		str = "not allowed";
		out.print(str);
	}else {
		//System.out.println("아이디 중복 아님");
		str = "allowed";
		out.print(str);
	}
%>