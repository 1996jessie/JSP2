<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";
	
	
	Class.forName(driver);
	
	
	Connection conn = DriverManager.getConnection(url, dbid, dbpw);

	
	String sql2 = "select id, passwd form member where id = ?";
	
	PreparedStatement ps = conn.prepareStatement(sql2);
	
	ps.setString(1,id);
	
	ResultSet rs = ps.executeQuery();
	
	if(rs.next()) { //입력한 아이디가 있으면 true라서 if문 안으로 들어옴
		String dpw = rs.getString("passwd"); //해당 아이디의 passwd 가져와라
		if(dpw.equals(passwd)){ //내가 입력한 아이디와 비밀번호가 테이블에 있다는 뜻
			
			String sql = "update member set name = ? where id = ? and passwd = ?"; //수정해라
			ps =  conn.prepareStatement(sql);
			
			
			ps.setString(1, name);
			ps.setString(2, id);
			ps.setString(3, passwd);	
			
			
			int cnt = -1;
			cnt = ps.executeUpdate();
			if(cnt == -1) {
				out.print("레코드 수정 실패");
			}else if(cnt == 0){
				out.print("조건에 해당하는 값이 없습니다.");		
			}
			else{
				out.print("레코드 수정 성공");		
			}
			
		}else { //아이디는 일치하지만 비밀번호는 다른 경우
			out.print("비밀번호가 다릅니다.");		
		} 
		
	}else { //아이디 없음
		out.print("찾는 아이디가 없습니다.");		
	}
	
	conn.close(); //if ~~ 굳이 안해도 되긴 하지만 안전하게 하고 싶으면 try-catch 하면 좋음
	ps.close();
	
%>