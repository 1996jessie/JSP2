package board;

import java.sql.*;
import java.util.ArrayList;

import board.BoardDao;

public class BoardDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static BoardDao instance;

	public static BoardDao getInstance() {
		if (instance == null) {
			instance = new BoardDao();
		}
		return instance;
	} //getInstance

	private BoardDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// BoardDao

	public ArrayList<BoardBean> getArticles(int start, int end) {
		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();
		String sql = "select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip " ;		        
		sql += "from (select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from board  ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setEmail(rs.getString("email"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd")); 
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));				
				bb.setRef(rs.getInt("ref")); 
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
				
				lists.add(bb);
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
		return lists;
	}//getArticles
	
	public int getArticleCount() {
		int count = 0;
		try {
			String sql = "select count(*) from board";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count(*)");
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
		return count;
	} //getArticleCount
	
	public BoardBean getArticle(int num) {
		BoardBean bb = null;
		try {
			String sql2 = "update board set readcount = readcount + 1 where num = ?"; //조회수 먼저 증가시키기
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, num);
			ps.executeUpdate();
			
			String sql = "select * from board where num = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setEmail(rs.getString("email"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd")); 
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));				
				bb.setRef(rs.getInt("ref")); 
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
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
		return bb;
	}//getArticle
	
	public int insertArticle(BoardBean bb) { //원글쓰기(원글만 board_seq.nextval = board_seq.currval)
		int cnt = -1;
		try {
			String sql = "insert into board values (board_seq.nextval, ?, ?, ?, ?, ?, default, board_seq.currval, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getEmail());
			ps.setString(3, bb.getSubject());
			ps.setString(4, bb.getPasswd());
			ps.setTimestamp(5, bb.getReg_date());
			ps.setInt(6, 0);
			ps.setInt(7, 0);
			ps.setString(8,bb.getContent());
			ps.setString(9, bb.getIp());
			
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
	}//insertArticle
	
	public int deleteArticle(int num, String passwd) {
		int cnt = -1;
		//String sql3 = "delete from board where num = ? and passwd = ?";
		try {
			String sql = "select passwd from board where num = ?";
			String sql2 = "delete from board where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				String dpw = rs.getString("passwd");
				if(dpw.equals(passwd)) {
					ps = conn.prepareStatement(sql2);
					ps.setInt(1, num);
					cnt = ps.executeUpdate();
				} else {
					cnt = 0;
				}
			}
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
	}//deleteArticle
	
	public void replyArticle(BoardBean bb) {
		int updateCnt = -1;
		int insertCnt = -1;
		try {
			String updateSql = "update board set re_step = re_step + 1 where ref = ? and re_step > ?";
			String insertSql = "insert into board values (board_seq.nextval, ?, ?, ?, ?, ?, default, ?, ?, ?, ?, ?)";
			
			ps = conn.prepareStatement(updateSql);
			ps.setInt(1, bb.getRef());
			ps.setInt(2, bb.getRe_step());
			
			updateCnt = ps.executeUpdate();
			if(updateCnt >= 0) {
				ps = conn.prepareStatement(insertSql);
				ps.setString(1, bb.getWriter());
				ps.setString(2, bb.getEmail());
				ps.setString(3, bb.getSubject());
				ps.setString(4, bb.getPasswd());
				ps.setTimestamp(5, bb.getReg_date());
				ps.setInt(6, bb.getRef());
				ps.setInt(7, bb.getRe_step()+1);
				ps.setInt(8, bb.getRe_level()+1);
				ps.setString(9, bb.getContent());
				ps.setString(10, bb.getIp());
				
				insertCnt = ps.executeUpdate();
			}
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
	} //replyArticle
	
	public BoardBean updateGetArticle(int num) {
		BoardBean bb = null;
		try {
			String sql = "select * from board where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setEmail(rs.getString("email"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd")); 
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));				
				bb.setRef(rs.getInt("ref")); 
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
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
		return bb;
	}//updateGetArticle
	
	public int updateArticle(BoardBean bb) {
		int cnt = -1;
		try {
			String selectSql = "select passwd from board where num = ?";
			String updateSql = "update board set writer = ?, subject = ?, email = ?, content = ? where num = ?";
			ps = conn.prepareStatement(selectSql);
			ps.setInt(1, bb.getNum());
			rs = ps.executeQuery();
			if(rs.next()) {
				String dpw = rs.getString("passwd");
				if(dpw.equals(bb.getPasswd())) {
					ps = conn.prepareStatement(updateSql);
					ps.setString(1, bb.getWriter());
					ps.setString(2, bb.getSubject());
					ps.setString(3, bb.getEmail());
					ps.setString(4, bb.getContent());
					ps.setInt(5, bb.getNum());
					cnt = ps.executeUpdate();
				} else {
					cnt = 0;
				}
			}
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
	}//updateArticle
}
