package my.shop;

import java.sql.*;
import java.text.NumberFormat;
import java.util.*;
import javax.naming.*;
import javax.sql.DataSource;
import com.oreilly.servlet.MultipartRequest;

public class ProductDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static ProductDao instance;

	public static ProductDao getInstance() {
		if (instance == null) {
			instance = new ProductDao();
		}
		return instance;
	} //getInstance

	private ProductDao() {
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
	}// ProductDao
	
	public int insertProduct(MultipartRequest mr) {
		int cnt = -1;

		String sql = "insert into product values (catprod.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		try {
			ps = conn.prepareStatement(sql);
			//System.out.println(mr.getParameter("pcode"));
			String pcategory_fk = mr.getParameter("pcategory_fk");
			pcategory_fk += mr.getParameter("pcode"); // pcategory_fk = 카테고리코드+상품코드
			ps.setString(1, mr.getParameter("pname"));
			ps.setString(2, pcategory_fk);
			ps.setString(3, mr.getParameter("pcompany"));
			ps.setString(4, mr.getOriginalFileName("pimage"));
			ps.setString(5, mr.getParameter("pqty"));
			ps.setString(6, mr.getParameter("price"));
			ps.setString(7, mr.getParameter("pspec"));
			ps.setString(8, mr.getParameter("pcontents"));
			ps.setString(9, mr.getParameter("point"));
			
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
	}//insertProduct
	
	public ArrayList<ProductBean> getAllProducts() {
		ArrayList<ProductBean> plist = new ArrayList<ProductBean>();
		try {
			String sql = "select * from product order by pnum";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			plist = makeArrayList(rs);

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
		return plist;
	}//getAllProduct

	public ProductBean getProductByPnum(int pnum) {
		ArrayList<ProductBean> plist = new ArrayList<ProductBean>();
		try {
			String sql = "select * from product where pnum = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pnum);
			rs = ps.executeQuery();
			plist =	makeArrayList(rs);
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
		return plist.get(0);
	}//getProductByPnum
	

	public int updateProduct(MultipartRequest mr, String img) {
		int cnt = -1;
		try {
			String sql = "update product set pname = ?, pcompany = ?, pimage = ?, pqty = ?, price = ?, pspec = ?, pcontents = ?, point = ? where pnum = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("pname"));
			ps.setString(2, mr.getParameter("pcompany"));
			ps.setString(3, img);
			ps.setString(4, mr.getParameter("pqty"));
			ps.setString(5, mr.getParameter("price"));
			ps.setString(6, mr.getParameter("pspec"));
			ps.setString(7, mr.getParameter("pcontents"));
			ps.setString(8, mr.getParameter("point"));
			ps.setInt(9, Integer.parseInt(mr.getParameter("pnum")));
			
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
	}//updateProduct
	
	public int deleteProduct(int pnum) {
		int cnt = -1;
		String sql = "delete from product where pnum = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pnum);
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
	
	public ArrayList<ProductBean> selectByPspec(String pspec) {
		ArrayList<ProductBean> plist = null;
		try {
			String sql = "select * from product where pspec = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, pspec);
			rs = ps.executeQuery();
			plist =	makeArrayList(rs);
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
		return plist;
	}
	
	public ArrayList<ProductBean> getProductByCategory(String code) {
		ArrayList<ProductBean> plist = null;
		try {
	        String sql = "select * from product where pcategory_fk like ?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, code + "%"); 
	        rs = ps.executeQuery();
	        plist = makeArrayList(rs);
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
		return plist;
	}
	
	
	
	private ArrayList<ProductBean> makeArrayList(ResultSet rs) throws SQLException {
		ArrayList<ProductBean> plist = new ArrayList<ProductBean>();
		while(rs.next()) {
			ProductBean pb = new ProductBean();
			
			pb.setPnum(rs.getInt("pnum"));
			pb.setPname(rs.getString("pname"));
			pb.setPcategory_fk(rs.getString("pcategory_fk"));
			pb.setPcompany(rs.getString("pcompany"));
			pb.setPimage(rs.getString("pimage"));
			pb.setPqty(rs.getInt("pqty"));
			pb.setPrice(rs.getInt("price"));
			pb.setPspec(rs.getString("pspec"));
			pb.setPcontents(rs.getString("pcontents"));
			pb.setPoint(rs.getInt("point"));
			pb.setPinputdate(rs.getString("pinputdate"));
			
			plist.add(pb);
		}
		return plist;
	}//makeArrayList
	
}
