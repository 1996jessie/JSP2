<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>

<%
	int eid = Integer.parseInt(request.getParameter("eid"));
	System.out.print(eid);
%>
<jsp:useBean id = "edao" class = "myPkg.EmplDao"/>

<%
	int cnt = edao.deleteEmpl(eid);
	String msg;
	String url;
	if(cnt != -1) {
		msg = "삭제 성공";
		url = "select.jsp";
	} else {
		msg = "삭제 실패";
		url = "select.jsp";
	}

%>

<script type="text/javascript">
	alert("<%= msg %>");
	location.href = '<%= url %>';
</script>  