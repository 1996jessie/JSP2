<%@page import="myPkg.EmplBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
/* 
	String name = request.getParameter("name");
	int dept = Integer.parseInt(request.getParameter("dept"));
	int salary = Integer.parseInt(request.getParameter("salary"));
	
	EmplBean eb = new EmplBean();
	
	eb.setName(name);
	eb.setDept(dept);
	eb.setSalary(salary);
*/
%>
<!-- jsp로 하면 한번에 해결 가능 -->
<jsp:useBean id = "eb" class = "myPkg.EmplBean">
	<jsp:setProperty name = "eb" property = "*"/>
</jsp:useBean>

<jsp:useBean id = "edao" class = "myPkg.EmplDao"/>

<% 
	int cnt = edao.insertEmpl(eb);
	String msg;
	String url;
	if(cnt != -1) {
%>		<script type="text/javascript">
			alert("삽입 성공");
		</script>
		<meta http-equiv="refresh" content="1; url = select.jsp">
<%	} else {
%>		<script type="text/javascript">
			alert("삽입 실패");
		</script>
		<meta http-equiv="refresh" content="1; url = insertForm.jsp">
<%	}
%>
<%-- 
	int cnt = edao.insertEmpl(eb);
	String msg;
	String url;
	if(cnt != -1) {
		msg = "삽입 성공";
		url = "select.jsp";
	} else {
		msg = "삽입 실패";
		url = "insertForm.jsp";
	}
--%>
<%-- 
<script type="text/javascript">
	alert("<%= msg %>");
	location.href = '<%= url %>';
</script> 
--%>

