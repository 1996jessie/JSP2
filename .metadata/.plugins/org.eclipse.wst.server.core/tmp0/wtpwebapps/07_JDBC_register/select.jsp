<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
select.jsp<br>
<style type="text/css">
	table{
		text-align: center;
	}
</style>

<%

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, dbid, dbpw);

%>

<h2>register 테이블의 레코드를 화면에 표시하는 예제</h2>

<table border = "1">
	<tr>
		<th width = "100">아이디</th>
		<th width = "100">패스워드</th>
		<th width = "100">이름</th>
		<th width = "100">성별</th>
		<th width = "100">email</th>
	</tr>

	<% 
	String sql = "select * from register order by id";
	ps = conn.prepareStatement(sql);
	
	rs = ps.executeQuery();
	while(rs.next()) {
		String id = rs.getString("id");
		String passwd = rs.getString("passwd");
		String name = rs.getString("name");
		String gender = rs.getString("gender");
		String uname = rs.getString("uname");
		String dname = rs.getString("dname");
	%>	
	<tr>
		<td><%= id %></td>
		<td><%= passwd %></td>
		<td><%= name %></td>
		<td><%= gender %></td>
		<td><%= uname + '@' + dname %></td>
	</tr>
	<%
	}

	if(rs != null) {
		rs.close();
	}
	if(ps != null){
		ps.close();
	}
	if(conn != null) {
		conn.close();		
	}

	%>
</table>