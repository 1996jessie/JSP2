<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteAll.jsp<br>

<%
	String[] rowcheck = request.getParameterValues("rowcheck");

	for(int i=0;i<rowcheck.length;i++) {
		System.out.print(rowcheck[i]+" ");
	} 
%>

<jsp:useBean id = "edao" class = "myPkg.EmplDao"/>

<%
	int cnt = edao.deleteCheckData(rowcheck);
	
	String msg;
	if(cnt > 0) {
		msg = "삭제 성공";
	} else {
		msg = "삭제 실패";
	}

%>

<script type="text/javascript">
	alert("<%= msg %>");
	location.href = 'select.jsp';
</script>  