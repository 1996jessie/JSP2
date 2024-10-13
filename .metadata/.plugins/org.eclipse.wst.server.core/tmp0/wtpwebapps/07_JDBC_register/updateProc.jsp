<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");

	String sid = (String)session.getAttribute("sid"); 
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String uname = request.getParameter("uname");
	String dname = request.getParameter("dname");
	
%>	
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	
	Class.forName(driver);
	
	
	conn = DriverManager.getConnection(url, dbid, dbpw);

	String sql = "update register set name = ?, gender = ?, uname = ?, dname = ? where id = ? and passwd = ?";
	
	ps = conn.prepareStatement(sql);
	
	ps.setString(1, name);
	ps.setString(2, gender);
	ps.setString(3, uname);
	ps.setString(4, dname);
	ps.setString(5, sid);
	ps.setString(6, passwd);
	
	int cnt = -1;
	cnt = ps.executeUpdate();
	
	if(cnt == -1) {
		out.print("수정 실패");
	}else if(cnt == 0) {
		out.print("수정할 값 없음");
	}else {
		out.print("수정 성공");
	}
	
	if(ps != null) {
		ps.close();
	}
	if(conn != null) {
		conn.close();
	}

%>

<meta http-equiv="refresh" content="1; url = select.jsp">