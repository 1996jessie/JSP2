package my.member;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class MemberDao {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static MemberDao instance;

	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
		}
		return instance;
	} //getInstance

	private MemberDao() {
		//DBCP
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env"); 
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB"); 
			conn = ds.getConnection(); 
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}// MemberDao
	
	public int insertMember(MemberDTO md) {
		int cnt = -1;
		try {
			String sql = "insert into members values (memseq.nextval,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, md.getName());
			ps.setString(2, md.getId());
			ps.setString(3, md.getPassword());
			ps.setString(4, md.getRrn1());
			ps.setString(5, md.getRrn2());
			ps.setString(6, md.getEmail());
			ps.setString(7, md.getHp1());
			ps.setString(8, md.getHp2());
			ps.setString(9, md.getHp3());
			ps.setString(10, md.getJoindate());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cnt;
	}//insertMember
	
	public boolean searchId(String userId) {
		boolean flag = false;
		try {
			String sql = "select * from members where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			if(rs.next()) {
				flag = true;
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
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	public MemberDTO findId(String name, String rrn1, String rrn2) {
		MemberDTO member =  null;
		String sql = "select * from members where name = ? and rrn1 = ? and rrn2 = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, rrn1);
			ps.setString(3, rrn2);
			rs = ps.executeQuery();
			if(rs.next()) {
				member = getMemberBean(rs);
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
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return member;
	}
	
	public MemberDTO findPw(String id, String name, String rrn1, String rrn2) {
		MemberDTO member =  null;
		String sql = "select * from members where id = ? and name = ? and rrn1 = ? and rrn2 = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, rrn1);
			ps.setString(4, rrn2);
			rs = ps.executeQuery();
			if(rs.next()) {
				member = getMemberBean(rs);
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
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return member;
	}
	
	public MemberDTO getMemberBean(ResultSet rs) throws SQLException {
		MemberDTO member =  new MemberDTO();
		member.setNo(rs.getInt("no"));
		member.setName(rs.getString("name"));
		member.setId(rs.getString("id"));
		member.setPassword(rs.getString("password"));
		member.setRrn1(rs.getString("rrn1"));
		member.setRrn2(rs.getString("rrn2"));
		member.setEmail(rs.getString("email"));
		member.setHp1(rs.getString("hp1"));
		member.setHp2(rs.getString("hp2"));
		member.setHp3(rs.getString("hp3"));
		member.setJoindate(rs.getString("joindate"));
		return member;
	}
	
	public MemberDTO memberCheck(String id, String password) {
		MemberDTO member =  null;
		try {
			String sql = "select * from members where id = ? and password = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if(rs.next()) {
				member = getMemberBean(rs);
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
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return member;
	}
}