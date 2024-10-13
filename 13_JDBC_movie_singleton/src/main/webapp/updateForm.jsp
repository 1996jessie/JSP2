<%@page import="myPkg.MovieDao"%>
<%@page import="myPkg.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp<br>
<h2>영화 선호도 수정</h2>



<style type="text/css">
	table {
		width: 700px;
	}
	tr:last-child{
		text-align : center;
	}
</style>

<%-- <jsp:useBean id="mdao" class = "myPkg.MovieDao"/> --%>
	<%
		MovieDao mdao = MovieDao.getInstance();
		System.out.println("updateForm.jsp mdao : " + mdao);
	%>

<%
	request.setCharacterEncoding("UTF-8");
	String[] genre = {"공포","다큐","액션","애니메이션"};
	String[] time = {"8-10","10-12","12-14","14-16","16-18","18-20","20-22","22-24"};
	Integer[] partner = {1,2,3,4,5};
	int i;
	int num = Integer.parseInt(request.getParameter("num"));
	
	MovieBean mb = mdao.getMovieByNum(num);
	
%>

<form name = "myform" action = "updateProc.jsp?num=<%= num %>" method = "post">
	<table border = 1>
	<tr>
		<th>아이디</th>
		<td>
			<input type = "text" name = "id2" value = <%= mb.getId() %> disabled>
			<input type = "hidden" name = "id" value = <%= mb.getId() %>>
		</td> 
		<!-- disabled 쓰면 칸이 비활성화됨(값도 안 넘어감) -->
	</tr>
	<tr>
		<th>이름</th>
		<td><input type = "text" name = "name" value = <%= mb.getName() %>></td>
	</tr>
	<tr>
		<th>나이</th>
		<td><input type = "text" name = "age" value = <%= mb.getAge() %>></td>
	</tr>	
	<tr>
		<th>좋아하는 장르</th>
		<td>
			<%	for(i=0;i<genre.length;i++) { %>
				<input type = "checkbox" name = "genre" value = "<%= genre[i] %>" <% if(mb.getGenre().contains(genre[i])) { %> checked <% } %>><%=	genre[i] %>
			<%	} %>	
		</td>
	</tr>
	<tr>
		<th>좋아하는 시간대</th>
		<td>
			<select name = "time">
			<%	for(i=0;i<time.length;i++) { %>
					<option value="<%= time[i] %>" <% if(mb.getTime().equals(time[i])) { %> selected <% } %>> <%= time[i] %>
			<%	} %>
			</select>
		</td>
	</tr>
	<tr>
		<th>동반 관객수</th>
		<td>
			<%	for(i=0;i<partner.length;i++) { %>
				<input type = "radio" name = "partner" value = "<%= partner[i] %>" <% if(mb.getPartner()== partner[i]) { %> checked <% } %>><%= partner[i] %>
			<%	} %>		
		</td>
	</tr>
	<tr>
		<th>영화관 개선사항</th>
		<td><textarea name="memo" rows="3" cols="30"><%= mb.getMemo() %></textarea></td>
	</tr>	
	<tr>
		<td colspan = "2"><input type="submit" id = "sub" value = "수정하기"> </td>
	</tr>
	</table>
</form>