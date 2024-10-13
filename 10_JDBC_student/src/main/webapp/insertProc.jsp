<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="sdao" class="myPkg.StudentDao"/>
<jsp:useBean id = "sb" class = "myPkg.StudentBean">
	<jsp:setProperty name = "sb" property = "*"/>
</jsp:useBean>

<%
	String [] arr = request.getParameterValues("hobby");
	String hobby = "";
	if(arr == null) {
		hobby += "선택사항없음";
	} else {
		for(int i=0;i<arr.length;i++) {
			hobby += arr[i] + " ";
		}
	}
	sb.setHobby(hobby); 
	
	int cnt = sdao.insertStudent(sb);
	
	if(cnt == 1) {
		response.sendRedirect("select.jsp");
	} else {
		response.sendRedirect("insertForm.jsp");
	}
%>