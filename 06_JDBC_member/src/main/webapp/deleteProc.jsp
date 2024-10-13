<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");


	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";
	

	Class.forName(driver);
	
	
	Connection conn = DriverManager.getConnection(url, dbid, dbpw);

	
	String sql = "delete from member where id = ? and passwd = ?";
	PreparedStatement ps =  conn.prepareStatement(sql);
	
	
	ps.setString(1, id);
	ps.setString(2, passwd);

	
	int cnt = -1;
	cnt = ps.executeUpdate();
	if(cnt == -1) {
		out.print("삭제 실패");
	}
	else if(cnt == 0) {
		out.print("삭제 값 없음");
	}
	else {
		out.print("레코드 삭제 성공");		
	}
	
	ps.close();
	conn.close();
	
%>