package myPkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentDao {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public StudentDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbid, dbpw);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//StudentDao

	public ArrayList<StudentBean> getAllStudents(){
		ArrayList<StudentBean> lists = new ArrayList<StudentBean>();
		String sql = "select * from student order by num";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				StudentBean sb = new StudentBean();
				sb.setNum(rs.getInt("num"));
				sb.setId(rs.getString("id"));
				sb.setPasswd(rs.getString("passwd"));
				sb.setName(rs.getString("name"));
				sb.setYear(rs.getInt("year"));
				sb.setMonth(rs.getInt("month"));
				sb.setDay(rs.getInt("day"));
				sb.setHobby(rs.getString("hobby"));
				sb.setC(rs.getInt("c"));
				sb.setJava(rs.getInt("java"));
				sb.setJsp(rs.getInt("jsp"));
				sb.setSum(rs.getInt("sum"));

				lists.add(sb);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}if(ps != null) {
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
		return lists;	
	}//getAllStudent
	
	public int insertStudent(StudentBean sb){
		int cnt = -1;
		try {
			String sql = "insert into student values (stu_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, sb.getId());
			ps.setString(2, sb.getPasswd());
			ps.setString(3, sb.getName());
			ps.setInt(4, sb.getYear());
			ps.setInt(5, sb.getMonth());
			ps.setInt(6, sb.getDay());
			ps.setString(7, sb.getHobby());
			ps.setInt(8, sb.getC());
			ps.setInt(9, sb.getJava());
			ps.setInt(10, sb.getJsp());
			ps.setInt(11,sb.getC()+sb.getJava()+sb.getJsp());
			
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
	} //insertStudent
	
	public boolean searchId(String userId) { 
		boolean flag = false;
		try {
			String sql = "select * from student where upper(id) = upper(?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			while(rs.next()) { // true=>이미=>사용X
				flag = true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}
				if(ps!=null) {
					ps.close();
				}
				if(rs!=null) {
					rs.close();
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}//searchId
	
	public StudentBean getStudentByNum(int num) {
		StudentBean sb = null;
		try {
			String sql = "select * from student where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				sb = new StudentBean();
				sb.setNum(rs.getInt("num"));
				sb.setId(rs.getString("id"));
				sb.setPasswd(rs.getString("passwd"));
				sb.setName(rs.getString("name"));
				sb.setYear(rs.getInt("year"));
				sb.setMonth(rs.getInt("month"));
				sb.setDay(rs.getInt("day"));
				sb.setHobby(rs.getString("hobby"));
				sb.setC(rs.getInt("c"));
				sb.setJava(rs.getInt("java"));
				sb.setJsp(rs.getInt("jsp"));
				sb.setSum(rs.getInt("sum"));
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
		return sb;
	}//getStudentByNum
	
	public int updateStudent(StudentBean sb) {
		int cnt = -1;
		try {
			conn.setAutoCommit(false);//자동커밋 안되게 하자
			String sql = "update student set id = ?, passwd = ?, name = ?, year = ?, month = ?, day = ?, hobby = ?, c = ?, java = ?, jsp = ?, sum = ? where num = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, sb.getId());
			ps.setString(2, sb.getPasswd());
			ps.setString(3, sb.getName());
			ps.setInt(4, sb.getYear());
			ps.setInt(5, sb.getMonth());
			ps.setInt(6, sb.getDay());
			ps.setString(7, sb.getHobby());
			ps.setInt(8, sb.getC());
			ps.setInt(9, sb.getJava());
			ps.setInt(10, sb.getJsp());
			ps.setInt(11, sb.getC()+sb.getJava()+sb.getJsp());
			ps.setInt(12,sb.getNum());
			
			cnt = ps.executeUpdate();
			
			conn.commit(); //이때 commit(완벽하게 다 끝나야 commit하겠다)
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				conn.rollback(); //마지막 커밋 상태로 돌아가겠다
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
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
		return cnt;
	} //updateStudent
	
	public int deleteStudent(int num) {
		int cnt = -1;
		try {
			String sql = "delete from student where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			cnt = ps.executeUpdate();			
		} catch (SQLException e) {
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
	}//deleteStudent
	
	public int deleteAllStudent(String[] rowcheck) {
		int cnt = -1;

		try {
			String sql = "delete from student where num = ?";
			for(int i=1;i<rowcheck.length;i++) {
				sql += " or num = ?";
			}
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
	            e.printStackTrace();
	        }
	    }
	    return cnt;
	}//deleteCheckStudent
}
