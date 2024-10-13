<%@page import="myPkg.MovieDao"%>
<%@page import="myPkg.MovieBean"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
select.jsp<br>
<script type="text/javascript">
	function insert() {		
		location.href = "insertForm.jsp";
	}
	
	function allCheck(obj) {
		//alert('1');
		var rowcheck = document.getElementsByName("rowcheck");
		var check = obj.checked;
 		if(check){
			for(var i=0;i<rowcheck.length;i++) {
				rowcheck[i].checked = true; 
			}
		} else {
			for(var i=0;i<rowcheck.length;i++) {
				rowcheck[i].checked = false; 
			}			
		} 
	}//allCheck
	
	function selectDelete(){
		var rowcheck = document.getElementsByName("rowcheck");
		var flag = false;
		for(var i=0;i<rowcheck.length;i++) {
			if(rowcheck[i].checked) {
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
		width: 900px;
	}
	tr:first-child{
		background-color : yellow;
	}
	td,th{
		border: 1px solid blue;
		padding: 3px;
	}
</style>

<form name = "myform" action = "deleteAll.jsp" method = "post">

<input type = "button" value = "추가" onClick = "insert()">
<input type = "button" value = "삭제" onClick = "selectDelete()"> 
<br>
	<table border = 1>
		<tr>
			<th><input type = "checkbox" name = "allcheck" onClick = "allCheck(this)"></th>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>나이</th>
			<th>좋아하는 장르</th>
			<th>즐겨보는 시간대</th>
			<th>동반관객수</th>
			<th>개선사항</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>

		<%-- <jsp:useBean id = "mdao" class = "myPkg.MovieDao"/>	 --%>
		<%
			MovieDao mdao = MovieDao.getInstance();
			System.out.println("select.jsp mdao : " + mdao);
		%>
		

<!-- 	myPkg.MovieDao mdao = new myPkg.MovieDao();	 -->
	
	
	
	<%
		ArrayList<MovieBean> lists = mdao.getAllMovies();   
	
		for(MovieBean mb : lists) {
	%>	<tr>
			<td><input type = "checkbox" name = "rowcheck" value = "<%= mb.getNum() %>"></td>
			<td><%= mb.getNum() %></td>
			<td><%= mb.getId() %></td>
			<td><%= mb.getName() %></td>
			<td><%= mb.getAge() %></td>
			<td><%= mb.getGenre() %></td>
			<td><%= mb.getTime() %></td>
			<td><%= mb.getPartner() %></td>
			<td><%= mb.getMemo() %></td>
			<td><a href = "updateForm.jsp?num=<%= mb.getNum() %>">수정</a></td>
			<td><a href = "deleteProc.jsp?num=<%= mb.getNum() %>">삭제</a></td>
		</tr>
	<%	} %>
	</table>
</form>

