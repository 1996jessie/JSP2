<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateVia.jsp<br>

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

	
	String sql = "select * from register where id = ?";
	
	ps = conn.prepareStatement(sql);

	ps.setString(1,id);
	
	rs = ps.executeQuery();
	
	if(rs.next()) { 
		String spw = rs.getString("passwd"); 
		if(spw.equals(passwd)){ 
			session.setAttribute("sid", id);
%>
			<FORM METHOD="post" ACTION="updateProc.jsp">
		<%--<FORM METHOD="post" ACTION="updateProc.jsp?id=<%= rs.getString("id")%>"> --%>
		  
			아이디 : <%= rs.getString("id") %><p>
		    <%-- <INPUT TYPE="hidden" NAME="id" value = <%= rs.getString("id") %>><p> --%>
		    
		    패스워드 : <INPUT TYPE="password" NAME="passwd"><p>
		    
		    이름 : <INPUT TYPE="text" NAME="name" value = <%= rs.getString("name")%>><p>
		    
		    성별 : <input type="radio" name="gender" value="남" checked>남
		    	   <input type="radio" name="gender" value="여">여<p>
		  	
		  	e-mail : <input type="text" name="uname" value = <%= rs.getString("uname") %>>@
		  			<select name="dname">
			  			<option value="daum.net">daum.net</option>
			  			<option value="naver.com">naver.com</option>
			  			<option value="nate.com">nate.com</option>
			  			<option value="google.com">google.com</option>
			  			<option value="yahoo.com">yahoo.com</option> 		
		  			</select><p>
		  <INPUT TYPE="submit" VALUE="보내기">
		  </FORM>
<%		}else { 
%>		
<script type="text/javascript">
	alert("비밀번호가 다릅니다.");
</script>
<meta http-equiv="refresh" content="0; url = updateForm.jsp">
<%		} 
	}else {
%>	
<script type="text/javascript">
	alert("아이디가 없습니다.");
</script>		
<meta http-equiv="refresh" content="0; url = updateForm.jsp">
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