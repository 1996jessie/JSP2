<%@page import="myPkg.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp<br>

<%
	String[] kind = {"유료","무료"};
	String[] bookstore = {"교보문고","알라딘","yes24","인터파크"};
	
	int no = Integer.parseInt(request.getParameter("no"));
%>

<jsp:useBean id="bdao" class = "myPkg.BookDao"/>

<%
	BookBean bb = bdao.getBookByNo(no);
	/* session.setAttribute("sno", bb.getNo()); */
%>

<h2>도서 정보 수정</h2>

<form name="myform" action="updateProc.jsp?no=<%=no%>"  method="post">
<%-- <input type="hidden" name="no" value="<%= bb.getNo()%>"> --%>
	<table border=1>
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="title" value = "<%= bb.getTitle() %>">
<!-- 			<input type = "button" id = "titleCheck" value = "중복체크">
				<span id = "titleMessage"></span> -->
			</td>
		</tr>
		<tr>
			<td>저자</td>
			<td><input type="text" name="author" value = "<%= bb.getAuthor() %>">
		</tr>
		<tr>
			<td>출판사</td>
			<td><input type="text" name="publisher" value = "<%= bb.getPublisher() %>">
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="price" value = "<%= bb.getPrice() %>">
		</tr>
		<tr>
			<td>입고일</td>
			<td><input type="date" name="day" value = "<%= bb.getDay() %>">
		</tr>

		<tr>
			<td>배송비</td>
			<td>
<%--  		
			<일반for문>
			<% for (int i=0;i<kind.length;i++) { %>
			    <%= kind[i] %><input type="radio" name="kind" value="<%= kind[i] %>" <% if(bb.getKind().equals(kind[i])) { %> checked <% } %>>
			<% } %>  --%>
			
			<% for (String k : kind) { %>
				<%= k %><input type="radio" name="kind" value="<%= k %>" <% if(bb.getKind().equals(k)) { %> checked <% } %>>
			<% } %> 
		</tr>
		<tr>
			<td>구입가능 서점</td>
			<td>
<%-- 		
			<일반for문>
			<%	for(int i=0;i<bookstore.length;i++) { %>
				<%=	bookstore[i] %><input type = "checkbox" name = "bookstore" value = "<%= bookstore[i] %>" <% if(bb.getBookstore().contains(bookstore[i])) { %> checked <% } %>>
			<%	} %> --%>
			
			<% for (String b : bookstore) { %>
				<%= b %><input type="checkbox" name="bookstore" value="<%= b %>" <% if(bb.getBookstore().contains(b)) { %> checked <% } %>>
			<% } %> 
		</tr>
		<tr>
			<td>보유수량</td>
			<td><select name="count" id="count">
					<option value="선택">선택
					<%	for(int i=1;i<=5;i++){ %>
							<option value = "<%= i %>"<% if(bb.getCount() == i) {%> selected <%}%>> <%= i %>
					<%	} %>
			</select></td>
		</tr>

	</table>
	<br> 
	<input type="submit" id = "sub" value="전송"> 
	<input type="reset" value="취소">
</form>