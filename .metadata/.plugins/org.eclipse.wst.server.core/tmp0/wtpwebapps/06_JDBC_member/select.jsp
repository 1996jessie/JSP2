<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
select.jsp
<br>

<%

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";

	
	Class.forName(driver);

	
	Connection conn = DriverManager.getConnection(url, dbid, dbpw);

%>

<h2> member 테이블의 레코드 조회 </h2>
<table width = "600" border= "1">
	<tr>
		<th width = "100">아이디</th>
		<th width = "100">패스워드</th>
		<th width = "100">이름</th>
		<th width = "100">가입일자</th>
	</tr>
	<%
	
	/* C:\JSP_ywl\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\06_JDBC_member */
	/* servket >> C:\JSP_ywl\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\06_JDBC_member\org\apache\jsp */
		String sql = "select * from member";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			String id = rs.getString("id");
			String passwd = rs.getString("passwd");
			String name = rs.getString("name");
			String reg_date = String.valueOf(rs.getDate("reg_date"));

			
		%>
		<tr>
			<td><%= id %></td>
			<td><%= passwd %></td>
			<td><%= name %></td>
			<td><%= reg_date %></td>
		</tr>	
		<%
		}//while
			
			
		rs.close();
		ps.close();
		conn.close();
	%>
</table>