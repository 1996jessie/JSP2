package my.shop;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.DataSource;

import my.shop.CategoryDao;

public class CategoryDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static CategoryDao instance;

	public static CategoryDao getInstance() {
		if (instance == null) {
			instance = new CategoryDao();
		}
		return instance;
	} //getInstance

	private CategoryDao() {
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
	}// CategoryDao
	
	public ArrayList<CategoryBean> getAllCategory() {
		ArrayList<CategoryBean> clist = new ArrayList<CategoryBean>();
		String sql = "select * from category order by cnum";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				CategoryBean cb = null;
				cb = getCategoryBean(rs);
				clist.add(cb);
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
		return clist;
	}
	
	public int insertCategory(CategoryBean cb) {
		int cnt = -1;
		String sql = "insert into category values (catseq.nextval, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, cb.getCode());
			ps.setString(2, cb.getCname());
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
	}
	
	public int deleteCategory(int cnum) {
		int cnt = -1;
		String sql = "delete from category where cnum = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cnum);
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
	}
	
	public CategoryBean getCategoryBean(ResultSet rs) throws SQLException {
		CategoryBean cb = new CategoryBean();
		cb.setCnum(rs.getInt("cnum"));
		cb.setCode(rs.getString("code"));
		cb.setCname(rs.getString("cname"));
		return cb;
	}
	
	
	public CategoryBean getCategoryByCnum(int cnum) {
		CategoryBean cb = null;
		try {
			String sql = "select * from category where cnum = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cnum);
			rs = ps.executeQuery();
			if(rs.next()) {
				cb = getCategoryBean(rs);
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
		return cb;
	}
	
	public int updateCategory(CategoryBean cb) {
		int cnt = -1;
		try {
			String sql = "update category set code = ?, cname = ? where cnum = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,cb.getCode());
			ps.setString(2, cb.getCname());
			ps.setInt(3, cb.getCnum());
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
	}
}
