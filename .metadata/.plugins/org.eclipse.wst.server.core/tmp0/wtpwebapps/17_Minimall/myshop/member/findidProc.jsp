<%@page import="my.member.MemberDTO"%>
<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findidProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	MemberDao mdao = MemberDao.getInstance();
	
	String name = request.getParameter("name");
	String rrn1 = request.getParameter("rrn1");
	String rrn2 = request.getParameter("rrn2");
	
	//System.out.println("<findidProc.jsp> name : " + name + ", rrn1 : " + rrn1  + ", rrn2 : " + rrn2);

	MemberDTO member  = mdao.findId(name, rrn1, rrn2);
	String msg;
	String url;
	if(member == null) {
		msg = "없는 회원";
	}else {
		msg = member.getId();
	}
%>

	<script type="text/javascript">
		alert("<%= msg %>"+"입니다");
		location.href = '<%=request.getContextPath()%>/main.jsp';
	</script> 