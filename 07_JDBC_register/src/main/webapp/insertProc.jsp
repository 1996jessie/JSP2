<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
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

	
	String sql = "insert into register values (?,?,?,?,?,?)";
	
	ps = conn.prepareStatement(sql);
	
	ps.setString(1,id);
	ps.setString(2,passwd);
	ps.setString(3,name);
	ps.setString(4,gender);
	ps.setString(5,uname);
	ps.setString(6,dname);
	
	int cnt = 0;
	cnt = ps.executeUpdate();
	
	if(cnt == 0) {
		out.print("삽입 실패");
	}else {
		out.print("삽입 성공");
	}
	
	if(ps != null) {
		ps.close();
	}
	if(conn != null) {
		conn.close();
	}
	
	
%>

<!-- <meta http-equiv="refresh" content="2; url = select.jsp"> -->
<!-- insert 2초 뒤 select.jsp 새로고침 -->
<jsp:forward page="select.jsp"/>
<%--
	response.sendRedirect("select.jsp");
--%> 

<!-- forward : request 객체 공유/response : 안함 -->
<!-- forward : 주소가 거쳐가는 페이지 주소/response : 최종 결과의 주소 -->