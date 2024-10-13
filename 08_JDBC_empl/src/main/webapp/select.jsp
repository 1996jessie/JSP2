<%@page import="myPkg.EmplBean"%>
<%@page import="myPkg.EmplDao"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
select.jsp<br>

<style type="text/css">
	table{
		text-align: center;
	}
	tr:first-child{
		background-color: pink;
	}
</style>
<script type="text/javascript">
	function allDelete(obj) {
		var rcheck = document.getElementsByName("rowcheck");
		var check = obj.checked;
		if(check) {
			for(var i=0;i<rcheck.length;i++) {
				rcheck[i].checked  = true;
			}
		}else {
			for(var i=0;i<rcheck.length;i++) {
				rcheck[i].checked  = false;
			}
		}
	}
	
	function selectDelete(){
		var rcheck = document.getElementsByName("rowcheck");
		var flag = false;
		for(var i=0;i<rcheck.length;i++) {
			if(rcheck[i].checked == true) {
				flag = true;
			}
		}
		if(flag == false) {
			alert("삭제할 항목을 1개 이상 선택하세요");
		}else {
			document.myform.submit();
		}
	}
	
	function insert() {
		location.href = "insertForm.jsp";
	}

</script>

<%--
	EmplDao edao = new EmplDao();
	edao.connect();
--%>

<!-- 1단계 -->
<jsp:useBean id="edao" class = "myPkg.EmplDao"/> 

<form name = "myform" action = "deleteAll.jsp">
	<input type = "button" value = "삭제" onClick = "selectDelete()">
	<input type = "button" value = "추가" onClick = "insert()">

	<table border = "1">
		<tr>
			<th><input type = "checkbox" name = "allcheck" onClick = "allDelete(this)"></th>
			<th>아이디</th>
			<th>이름</th>
			<th>부서번호</th>
			<th>급여</th>
			<th>수정</th>
			<th>삭제</th>		
		</tr>
	
	<%
		ArrayList<EmplBean> lists = edao.getAllEmpl();
	
		for(EmplBean eb : lists) {
	%>
		<tr>
			<td><input type = "checkbox" name = "rowcheck" value = "<%= eb.getEid() %>"></td>
			<td><%= eb.getEid() %></td>
			<td><%= eb.getName() %></td>
			<td><%= eb.getDept() %></td>
			<td><%= eb.getSalary() %></td>
			<th><a href = "updateForm.jsp?eid=<%= eb.getEid() %>">수정</a></th>
			<td><a href = "deleteProc.jsp?eid=<%= eb.getEid() %>">삭제</a></td>		
		</tr>
	<% 
		}//for
	%>
	</table>

</form>

