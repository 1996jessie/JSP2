<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
%>	
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
	
	String sql = "select id, passwd from register where id = ?";
	
	ps = conn.prepareStatement(sql);

	ps.setString(1,id);
	
	rs = ps.executeQuery();
	
	if(rs.next()) { 
		String rpw = rs.getString("passwd"); 
		if(rpw.equals(passwd)){ 
			
			String sql2 = "delete from register where id = ? and passwd = ?";
			
			ps = conn.prepareStatement(sql2);
			
			ps.setString(1, id);
			ps.setString(2, passwd);
			
			int cnt = ps.executeUpdate();
			if(cnt>0) {
%>				<script type="text/javascript">
					alert("삭제 성공");
				</script>
				<meta http-equiv="refresh" content="0; url = select.jsp">		
		<% 	}else {
		%>		<script type="text/javascript">
					alert("삭제 실패");
				</script>
				<meta http-equiv="refresh" content="0; url = deleteForm.jsp">	
	<%		}
		}else { 
		
	%>		<script type="text/javascript">
				alert("비밀번호가 일치하지 않습니다.");
			</script>
			<meta http-equiv="refresh" content="0; url = deleteForm.jsp">
<%		} 
	}else {
%>	
	<script type="text/javascript">
		alert("찾는 아이디가 없습니다.");
	</script>		
	<meta http-equiv="refresh" content="0; url = deleteForm.jsp">
<%	}	
	
	if(rs != null) {
		rs.close();
	}
	if(ps != null) {
		ps.close();
	}
	if(conn != null) {
		conn.close();
	}
	
%>