package myPkg;

import java.sql.*;
import java.util.*;

public class EmplDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public EmplDao() {
		try {
			Class.forName(driver);
			System.out.println("드라이버 로드");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void connect() {
		try {
			conn = DriverManager.getConnection(url, dbid, dbpw);
			System.out.println("접속 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<EmplBean> getAllEmpl() {
		connect();
		
		ArrayList<EmplBean> lists = new ArrayList<EmplBean>();
		try {
			String sql = "select * from empl order by eid";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while(rs.next()) {
				EmplBean eb = new EmplBean();
				eb.setEid(rs.getInt("eid"));
				eb.setName(rs.getString("name"));
				eb.setDept(rs.getInt("dept"));
				eb.setSalary(rs.getInt("salary"));

				lists.add(eb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return lists;
	}
	
	public int insertEmpl(EmplBean eb){
		connect();
		int cnt = -1;
		try {
			String sql = "insert into empl values (e_seq.nextval,?,?,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, eb.getName());
			ps.setInt(2, eb.getDept());
			ps.setInt(3, eb.getSalary());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public int deleteEmpl(int eid) {
		connect();
		int cnt = -1;
		
		try {
			String sql = "delete from empl where eid = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, eid);
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public EmplBean getEmplByEid(int eid) {
		connect();
		EmplBean eb = null;
		try {
			String sql = "select * from empl where eid = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, eid);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				eb = new EmplBean();

				eb.setEid(rs.getInt("eid"));
				eb.setName(rs.getString("name"));
				eb.setDept(rs.getInt("dept"));
				eb.setSalary(rs.getInt("salary"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return eb;
	}
	
	public int updateEmpl(EmplBean eb) {
		
		connect();
		
		int cnt = -1;
		
		System.out.println(eb.getEid());
		System.out.println(eb.getName());
		System.out.println(eb.getDept());
		System.out.println(eb.getSalary());
		
		try {
			String sql = "update empl set name = ?, dept = ?, salary = ? where eid = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, eb.getName());
			ps.setInt(2, eb.getDept());
			ps.setInt(3, eb.getSalary());
			ps.setInt(4, eb.getEid());
						
			cnt = ps.executeUpdate();
			
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			} finally {
				try {
					if(ps != null) {
						ps.close();
					}
					if(conn != null) {
						conn.close();
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		return cnt;
	}
	
	public int deleteCheckData(String[] rowcheck) {
		connect();
		int cnt = -1;

		try {
			String sql = "delete from empl where eid = ?";
			
			for(int i=1;i<rowcheck.length;i++) {
				sql += " or eid = ?";
			}
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			
			for(int i=0;i<rowcheck.length;i++) {
				ps.setInt(i+1, Integer.parseInt(rowcheck[i]));
			}
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cnt;
	}
}