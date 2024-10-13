<%@page import="myPkg.EmplBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp<br>

<%
	int eid = Integer.parseInt(request.getParameter("eid"));
%>

<jsp:useBean id = "edao" class = "myPkg.EmplDao"/>

<%
	EmplBean eb = edao.getEmplByEid(eid);

	System.out.println(eb.getEid());
	System.out.println(eb.getName());
	System.out.println(eb.getDept());
	System.out.println(eb.getSalary());
	
	session.setAttribute("seid", eb.getEid());

%>


<h2>회원 수정</h2>
<form action="updateProc.jsp" method="post">

	이름 : <input type="text" name="name" value = <%= eb.getName() %>><br>
	부서번호 : <select name="dept">
<!-- 			<option value="1" <% if(eb.getDept() == 1) {%> selected <%}%>>1</option>
				<option value="2" <% if(eb.getDept() == 2) {%> selected <%}%>>2</option>
				<option value="3" <% if(eb.getDept() == 3) {%> selected <%}%>>3</option> -->
				
		<% 		for(int i=1;i<=3;i++) {
		%>			<option value = "<%= i %>" <% if(eb.getDept() == i) {%> selected <%}%>> <%= i %> </option>
		<%		}
		%>
		

		<%--
			for(int i=1;i<=3;i++) {
				out.print("<option value = '" + i + "'>" + i + "</option>");
			}
		--%>
			</select> <br>
	급여 : <input type="text" name="salary" value = <%= eb.getSalary() %>> <br>
	<input type="submit" value="수정하기">

</form>

eb.set