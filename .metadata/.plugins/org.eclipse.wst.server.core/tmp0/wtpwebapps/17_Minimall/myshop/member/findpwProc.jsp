<%@page import="my.member.MemberDTO"%>
<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findpwProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	MemberDao mdao = MemberDao.getInstance();
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String rrn1 = request.getParameter("rrn1");
	String rrn2 = request.getParameter("rrn2");
	
	//System.out.println("<findpwProc.jsp> id : " + id + ", name : " + name + ", rrn1 : " + rrn1  + ", rrn2 : " + rrn2);

	MemberDTO member  = mdao.findPw(id, name, rrn1, rrn2);
	String msg;
	if(member == null) {
		msg = "없는 정보";
	}else {
		msg = member.getPassword();
	}
%>

	<script type="text/javascript">
		alert("<%= msg %>"+"입니다");
		location.href = '<%=request.getContextPath()%>/main.jsp';
	</script> 