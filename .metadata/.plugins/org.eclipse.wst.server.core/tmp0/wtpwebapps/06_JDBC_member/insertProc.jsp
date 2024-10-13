<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	Timestamp reg_date = new Timestamp(System.currentTimeMillis());

	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";
	
	
	Class.forName(driver);
	
	
	Connection conn = DriverManager.getConnection(url, dbid, dbpw);

	
	String sql = "insert into member values(?,?,?,?)";
	PreparedStatement ps =  conn.prepareStatement(sql);
	
	
	ps.setString(1, id);
	ps.setString(2, passwd);
	ps.setString(3, name);
	ps.setTimestamp(4, reg_date);		
	
	
	int cnt = ps.executeUpdate();
	if(cnt == 0)
		out.print("레코드 삽입 실패");
	else
		out.print("레코드 삽입 성공");
	
	
	conn.close();
	ps.close();
	
%>

<!-- servlet : jsp가 시랭될 때 자동으로 jsp를 변형해서 java 파일을 만듦. 굳이 예외처리하지 않아도 자동으로 처리됨 -->


