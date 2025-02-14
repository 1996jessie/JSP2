package my.shop.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import my.shop.ProductBean;

public class OrdersDao {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public OrdersDao(){
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
		}catch (NamingException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}//OrdersDao

	public int insertOrders(int memno, Vector<ProductBean> cartList) {
		int cnt = -1;
		try {
			String sql = "insert into orders values (orderseq.nextval, ?, ?, ?, ?)";
			for(int i=0;i<cartList.size();i++) {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, memno);
				ps.setInt(2, cartList.get(i).getPnum());
				ps.setInt(3, cartList.get(i).getPqty());
				ps.setInt(4, cartList.get(i).getPrice()*cartList.get(i).getPqty());

				cnt += ps.executeUpdate();
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
	}

	public Vector<OrderBean> getOrderList(String memid) {
		Vector<OrderBean> orderList = new Vector<OrderBean>();
		String sql = "select m.name mname, m.id mid, p.pname, o.qty, o.amount from (members m inner join orders o on m.no = o.memno) inner join product p on o.pnum = p.pnum where m.id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, memid);
			rs = ps.executeQuery();
			while(rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setMid(rs.getString("mid"));
				ob.setMname(rs.getString("mname"));
				ob.setPname(rs.getString("pname"));
				ob.setQty(rs.getInt("qty"));
				ob.setAmount(rs.getInt("amount"));
				
				orderList.add(ob);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderList;
	}

}
