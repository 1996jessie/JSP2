<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	//System.out.println("userId : " + userId);
	
	MemberDao mdao = MemberDao.getInstance();
	boolean flag = mdao.searchId(userId);
	 
	if(flag){
		out.print("NO");
	}
	else{
		out.print("YES");
	}
%>
