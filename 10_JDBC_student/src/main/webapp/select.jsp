<%@page import="myPkg.StudentBean"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
select.jsp<br>

<script type="text/javascript">
	function insert() {		
		location.href = "insertForm.jsp";
	}
	
	function allSelect(obj) {
		//alert('1');
		var rcheck = document.getElementsByName("rowcheck");
		var check = obj.checked;
 		if(check){
			for(var i=0;i<rcheck.length;i++) {
				rcheck[i].checked = true; 
			}
		} else {
			for(var i=0;i<rcheck.length;i++) {
				rcheck[i].checked = false; 
			}			
		} 
	}//allSelect
	
	function selectDelete(){
		var rcheck = document.getElementsByName("rowcheck");
		var flag = false;
		for(var i=0;i<rcheck.length;i++) {
			if(rcheck[i].checked) {
				flag = true;
			}
		}
		if(flag == false) {
			alert("삭제할 항목을 1개 이상 선택하세요.");
			return;
		}
		document.myform.submit();
	}//selectDelete
	
</script>

<style type="text/css">
	table {
		text-align: center;
		margin: auto;
		width: 800px;
	}
	tr:first-child{
		background-color : yellow;
	}
	td,th{
		border: 1px solid black;
		padding: 3px;
	}
</style>
<jsp:useBean id="sdao" class="myPkg.StudentDao"/>

<form name = "myform" action = "deleteAll.jsp" method = "post">

	<table border = 1>
		<tr>
			<th><input type = "checkbox" name = "allcheck" onClick = "allSelect(this)"></th>
			<th>번호</th>
			<th>아이디</th>
			<th>비번</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>취미</th>
			<th>C언어</th>
			<th>JAVA</th>
			<th>JSP</th>
			<th>합계</th>
			<th>수정</th>
			<th>삭제</th>	
		</tr>
		
	<%
		ArrayList<StudentBean> lists = sdao.getAllStudents();
	
		for(StudentBean sb : lists) {
	%>		<tr>
				<td><input type = "checkbox" name = "rowcheck" value = "<%= sb.getNum() %>"></td>
				<td><%= sb.getNum() %></td>
				<td><%= sb.getId() %></td>
				<td><%= sb.getPasswd() %></td>
				<td><%= sb.getName() %></td>
				<td><%= sb.getYear() %>-<%= sb.getMonth() %>-<%= sb.getDay() %></td>
				<td><%= sb.getHobby() %></td>
				<td><%= sb.getC() %></td>
				<td><%= sb.getJava() %></td>
				<td><%= sb.getJsp() %></td>
				<td><%= sb.getSum() %></td>
				<td><a href = "updateForm.jsp?num=<%= sb.getNum() %>">수정</a></td>
				<td><a href = "deleteProc.jsp?num=<%= sb.getNum() %>">삭제</a></td>
			</tr>
	<%	}
	%>
	
	</table>
<input type = "button" value = "추가" onClick = "insert()">
<input type = "button" value = "삭제" onClick = "selectDelete()">

</form>