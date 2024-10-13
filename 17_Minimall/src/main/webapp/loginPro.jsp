<%@page import="my.member.MemberDao"%>
<%@page import="my.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
loginPro.jsp<br>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	//System.out.println("<loginPro.jsp> id : " + id + ", password : " + password);
	
	MemberDao mdao = MemberDao.getInstance();
	MemberDTO member = mdao.memberCheck(id, password);
	
	String viewPage;
	
	if(member != null) {
		if(member.getId().equals("admin")) {
			viewPage = "myshop/admin/main.jsp";
		}else {
			viewPage = "myshop/display/mall.jsp";
		}
		session.setAttribute("memid", id);
		session.setAttribute("memno", member.getNo());
		
	} else {
		viewPage = "main.jsp";
%>		
		<script type="text/javascript">
			alert("존재하지 않는 회원입니다.");
		</script> 
<% 
	}
%>

<script type="text/javascript">
	location.href = "<%= viewPage %>";
</script>

