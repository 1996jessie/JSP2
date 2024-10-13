<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
%>

<jsp:useBean id="sdao" class="myPkg.StudentDao"/>

<%
	boolean flag = sdao.searchId(userId);
	String str;
	if(flag == true) {
		str = "중복";
		out.print(str); 
	} else {
		str = "중복 아님";
		out.print(str);
	}
%>