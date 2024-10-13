package myPkg;

import java.sql.*;
import java.util.*;

public class BookDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public BookDao() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void connect() {
		try {
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BookBean> getAllBooks() {
		connect();
		ArrayList<BookBean> lists = new ArrayList<BookBean>();
		try {
			String sql = "select * from book order by no";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				BookBean bb = new BookBean();
				
				bb.setNo(rs.getInt("no"));
				bb.setTitle(rs.getString("title"));
				bb.setAuthor(rs.getString("author"));
				bb.setPublisher(rs.getString("publisher"));
				bb.setPrice(rs.getInt("price"));
				bb.setDay(String.valueOf(rs.getDate("day")));
				bb.setKind(rs.getString("kind"));
				bb.setBookstore(rs.getString("bookstore"));
				bb.setCount(rs.getInt("count"));
				
				lists.add(bb);
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
	
	public int insertBook(BookBean bb) {
		connect();
		int cnt = -1;
		try {
			String sql = "insert into book values (bseq.nextval,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, bb.getTitle());
			ps.setString(2, bb.getAuthor());
			ps.setString(3, bb.getPublisher());
			ps.setInt(4, bb.getPrice());
			ps.setString(5, bb.getDay());
			ps.setString(6, bb.getKind());
			ps.setString(7, bb.getBookstore());
			ps.setInt(8, bb.getCount());
			
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
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public int deleteBook(int no) {
		connect();
		int cnt = -1;
		try {
			String sql = "delete from book where no = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, no);
			
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
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public boolean searchTitle(String usertitle) {
		connect();
		boolean flag = false;
		try {
			String sql = "select * from book where title = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, usertitle);
			rs = ps.executeQuery();
			
			if(rs.next()) { //있으면
				flag = true; //사용 못함
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
		return flag;
	}
	
	public BookBean getBookByNo(int no) {
		connect();
		BookBean bb = null;
		
		try {
			String sql = "select * from book where no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				bb = new BookBean();
				
				bb.setNo(rs.getInt("no"));
				bb.setTitle(rs.getString("title"));
				bb.setAuthor(rs.getString("author"));
				bb.setPublisher(rs.getString("publisher"));
				bb.setPrice(rs.getInt("price"));
				bb.setDay(String.valueOf(rs.getDate("day")));
				bb.setKind(rs.getString("kind"));
				bb.setBookstore(rs.getString("bookstore"));
				bb.setCount(rs.getInt("count"));
			}
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
				e.printStackTrace();
			}
		}
		return bb;
	}
	
	public int updateBook(BookBean bb) {
		connect();
		int cnt = -1;
		try {
			String sql = "update book set title = ?, author = ?, publisher = ?, price = ?, day = ?, kind = ?, bookstore = ?, count = ? where no = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, bb.getTitle());
			ps.setString(2, bb.getAuthor());
			ps.setString(3, bb.getPublisher());
			ps.setInt(4, bb.getPrice());
			ps.setString(5, bb.getDay());
			ps.setString(6, bb.getKind());
			ps.setString(7, bb.getBookstore());
			ps.setInt(8, bb.getCount());
			ps.setInt(9, bb.getNo());
			
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
	        String sql = "delete from book where no = ?";
	        for(int i=1;i<rowcheck.length;i++) {
	            sql += " or no = ?";
	        }
	        ps = conn.prepareStatement(sql);
	        for(int i=0;i<rowcheck.length;i++) {
	            ps.setInt(i+1,Integer.parseInt(rowcheck[i]));
	        }
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
	            e.printStackTrace();
	        }
	    }
	    return cnt;
	}
	
}