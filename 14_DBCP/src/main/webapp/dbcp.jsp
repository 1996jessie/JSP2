<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
dbcp.jsp<br>
<!-- 
Database Connection Pool 
context.xml과 3개의 jar 파일 필요
-->

<%
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = null;
	
	Context initContext = new InitialContext(); //초기 설정정보 가져올 때 InitialContext 객체 만듦(Context가 부모 : 다형성)
	Context envContext = (Context)initContext.lookup("java:comp/env"); //이 폴더 안에 OracleDB라는 이름으로 connection pool 있음 //loopup 메서드 : java:comp/env 가서 jdbc/OracleDB 찾아와라
	DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB"); //context.xml의 설정정보를 가져와라
	conn = ds.getConnection(); //jdbc/OracleDB 정보로 접속해라
	System.out.println("conn:" + conn);
	
	request.setCharacterEncoding("UTF-8");
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	
	if(username != null && email != null) {
		sql = "insert into tdbcp values (?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1,username);
		ps.setString(2,email);
		ps.executeUpdate();
	}

%>
	<h2>tdbcp</h2>
	<form name = "myform" method = "post" action = "dbcp.jsp">
		이름 : <input type = "text" name = "username"><br>
		이메일 : <input type = "text" name = "email"><br>
		<input type = "submit" value = "등록"><br>
	</form>
	
	<hr>
	
	<h2>목록보기</h2>
	
	<%
		sql = "select username, email from tdbcp";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		int i = 1;
		while(rs.next()){
			out.println(i + " : " + rs.getString(1) + ", " + rs.getString(2)+"<br>");
			i++;
		}
		rs.close();
		ps.close();
		conn.close();
	%>

<!-- 
커넥션풀(connection pool)
커넥션 객체를 미리 만들어 풀 속에 저장해두고 있다가 필요할 때마다 커넥션을 풀에서 가져다쓰고 다시 풀에 반환하는 기법
커넥션 생성하는데 드는 연결 시간이 소비되지 않는다
속도가 향상되고 접속자가 증가해도 웹 어플리케이션이 쉽게 다운되지 않는다
커넥션을 계속해서 재사용하기 때문에 생성되는 커넥션 수가 일정하게 유지된다
많이 만들면 메모리 소모가 커지고 적게 만들면 대기 시간이 길어짐 
-->