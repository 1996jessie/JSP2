<%@page import="myPkg.Ex06_Bean_이예원"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex06_result_이예원.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String price = request.getParameter("price");
	String date = request.getParameter("date");
	String kind = request.getParameter("kind");
	String[] bookstore = request.getParameterValues("bookstore");
	String count = request.getParameter("count");
%>

<table border = 1>
	<tr>
		<th>제목</th>
		<td><%= title %></td>
	</tr>
	<tr>
		<th>저자</th>
		<td><%= author %></td>
	</tr>

	<tr>
		<th>출판사</th>
		<td><%= publisher %></td>
	</tr>

	<tr>
		<th>가격</th>
		<td><%= price %></td>
	</tr>

	<tr>
		<th>입고일</th>
		<td><%= date %></td>
	</tr>

	<tr>
		<th>배송비</th>
		<td><%= kind %></td>
	</tr>

	<tr>
		<th>구입가능 서점</th>
		<td>
		<%
		if(bookstore == null) {
				out.print("없음");
		} else {
			for (int i = 0; i < bookstore.length; i++) {
				out.print(bookstore[i] + " ");
			}
		}
		%>
		</td>
	</tr>
	<tr>
		<th>보유수량</th>
		<td><%= count %></td>
	</tr>	
</table>

<hr>

<%
	Ex06_Bean_이예원 ex = new Ex06_Bean_이예원();
	ex.setTitle(title);
	ex.setAuthor(author);
	ex.setPublisher(publisher);
	ex.setPrice(price);
	ex.setDate(date);
	ex.setKind(kind);
	ex.setBookstore(bookstore);
	ex.setCount(count);
	
%>
<table border = 1>
	<tr>
		<th>제목</th>
		<td><%= ex.getTitle() %></td>
	</tr>
	<tr>
		<th>저자</th>
		<td><%= ex.getAuthor() %></td>
	</tr>

	<tr>
		<th>출판사</th>
		<td><%= ex.getPublisher() %></td>
	</tr>

	<tr>
		<th>가격</th>
		<td><%= ex.getPrice() %></td>
	</tr>

	<tr>
		<th>입고일</th>
		<td><%= ex.getDate() %></td>
	</tr>

	<tr>
		<th>배송비</th>
		<td><%= ex.getKind() %></td>
	</tr>

	<tr>
		<th>구입가능 서점</th>
		<td>
		<%
		if(bookstore == null) {
				out.print("없음");
		} else {
			for (int i = 0; i < bookstore.length; i++) {
				out.print(bookstore[i] + " ");
			}
		}
		%>
		</td>
	</tr>
	<tr>
		<th>보유수량</th>
		<td><%= ex.getCount() %></td>
	</tr>	

</table>

<hr>

<jsp:useBean id="ex2" class = "myPkg.Ex06_Bean_이예원">
	<jsp:setProperty name = "ex2" property = "title"/>
	<jsp:setProperty name = "ex2" property = "author"/>
	<jsp:setProperty name = "ex2" property = "publisher"/>
	<jsp:setProperty name = "ex2" property = "price"/>
	<jsp:setProperty name = "ex2" property = "date"/>
	<jsp:setProperty name = "ex2" property = "kind"/>
	<jsp:setProperty name = "ex2" property = "bookstore"/>
	<jsp:setProperty name = "ex2" property = "count"/>
</jsp:useBean>

<table border = 1>
	<tr>
		<th>제목</th>
		<td><jsp:getProperty name = "ex2" property = "title"/></td>
	</tr>
	<tr>
		<th>저자</th>
		<td><jsp:getProperty name = "ex2" property = "author"/></td>
	</tr>

	<tr>
		<th>출판사</th>
		<td><jsp:getProperty name = "ex2" property = "publisher"/></td>
	</tr>

	<tr>
		<th>가격</th>
		<td><jsp:getProperty name = "ex2" property = "price"/></td>
	</tr>

	<tr>
		<th>입고일</th>
		<td><jsp:getProperty name = "ex2" property = "date"/></td>
	</tr>

	<tr>
		<th>배송비</th>
		<td><jsp:getProperty name = "ex2" property = "kind"/></td>
	</tr>

	<tr>
		<th>구입가능 서점</th>
		<td>
		<%
		if(bookstore == null) {
				out.print("없음");
		} else {
			for (int i = 0; i < bookstore.length; i++) {
				out.print(bookstore[i] + " ");
			}
		}
		%>
		</td>
	</tr>
	<tr>
		<th>보유수량</th>
		<td><jsp:getProperty name = "ex2" property = "count"/></td>
	</tr>	

</table>