<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
myshop\member\registerPro.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	MemberDao mdao = MemberDao.getInstance();
%>

<jsp:useBean id="md" class="my.member.MemberDTO">
	<jsp:setProperty name="md" property="*"/>
</jsp:useBean>

<%
	int cnt = mdao.insertMember(md);
	System.out.println("<myshop\\member\\registerPro.jsp> insert 성공 개수 : " + cnt);
	String msg;
	String url;
	
	if(cnt > 0) {
		msg = "insert 성공";
		url = "../../main.jsp"; /* 상대경로 */
	} else {
		msg = "insert 실패";
		url = "register.jsp";
	}
%>

	<script type="text/javascript">
		alert("<%= msg %>");
		location.href = '<%= url %>';
	</script> 
