<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id = "sdao" class = "myPkg.StudentDao"/>
<jsp:useBean id = "sb" class = "myPkg.StudentBean">
	<jsp:setProperty name = "sb" property = "*"/>
</jsp:useBean>

<%
	String[] harr = request.getParameterValues("hobby");
	String hobby = "";
	
	if(harr == null) {
		hobby += "선택사항없음";
	}else {
		for(int i=0;i<harr.length;i++) {
			hobby += harr[i] + " ";
		}
	}

	sb.setHobby(hobby); 

	int cnt = sdao.updateStudent(sb);  
	String url;
	if(cnt > 0) {
		response.sendRedirect("select.jsp");
	} else {
		response.sendRedirect("updateForm.jsp?num="+sb.getNum()); 
	}
%>