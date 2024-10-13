<%@page import="myPkg.EmplBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	int eid = (Integer)session.getAttribute("seid");
	String name = request.getParameter("name");
	int dept = Integer.parseInt(request.getParameter("dept"));
	int salary = Integer.parseInt(request.getParameter("salary"));

	EmplBean eb = new EmplBean();
	
	eb.setEid(eid);
	eb.setName(name);
	eb.setDept(dept);
	eb.setSalary(salary);
%>

<jsp:useBean id = "edao" class = "myPkg.EmplDao"/>

<%
	int cnt = edao.updateEmpl(eb);
	String msg;
	String url;
	if(cnt != -1) {
		msg = "수정 성공";
		url = "select.jsp";
	} else {
		msg = "수정 실패"; 
		url = "updateForm.jsp?eid=" + eid; //eid 가져와야 value로 넣어줄 수 있음
	}
%>

	<script type="text/javascript">
		alert("<%= msg %>");
		location.href = '<%= url %>';
	</script>



