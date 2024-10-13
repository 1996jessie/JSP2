package my.shop.mall;

import java.util.Vector;

import my.shop.ProductBean;
import my.shop.ProductDao;

public class CartBean {
	//장바구니에는 상품이 여러개 담긴다.
	private Vector<ProductBean> cartList;
	
	public CartBean() {
		cartList = new Vector<ProductBean>();
		System.out.println("CartBean 생성자");
	}
	
	public void addProduct(int pnum,int oqty) { 
		ProductDao pdao = ProductDao.getInstance();
		ProductBean pb = pdao.getProductByPnum(pnum);
		pb.setPqty(oqty); // 주문수량

		System.out.println("cartList 갯수:" + cartList.size());

		int totalPrice = 0;
		int totalPoint = 0;
		for(int i=0;i<cartList.size();i++) {
			if(cartList.get(i).getPnum() == pnum) {
				oqty = cartList.get(i).getPqty() + oqty;
				cartList.get(i).setPqty(oqty);

				totalPrice += cartList.get(i).getPrice() * oqty;
				totalPoint += cartList.get(i).getPoint() * oqty;
				System.out.println("totalPrice :" + totalPrice + ", totalPoint : " + totalPoint);
				pb.setTotalPrice(totalPrice);
				pb.setTotalPoint(totalPoint);
				return;	
			}
		}//for
		
		totalPrice += pb.getPrice() * pb.getPqty();
		totalPoint += pb.getPoint() * pb.getPqty();
		pb.setTotalPrice(totalPrice);
		pb.setTotalPoint(totalPoint);
		cartList.add(pb);
	}//addProduct

	public Vector<ProductBean> getAllProducts() {
		return cartList;
	}
	
	public void setEdit(int pnum, int oqty) {
		for(int i=0;i<cartList.size();i++) {		
			if(pnum == cartList.get(i).getPnum()) {
				cartList.get(i).setPqty(oqty);
				break;
			}
		}	
	}
	
	public void removeProduct(int pnum) {
		for(ProductBean pb : cartList) {
			if(pb.getPnum() == pnum) {
				cartList.removeElement(pb);
				break;
			}
		}
		
		/*
	    for (int i = 0; i < cartList.size(); i++) {
	        ProductBean pb = cartList.get(i);
	        if (pb.getPnum() == pnum) {
	            cartList.remove(i);
	        }
	    }
	    */
	}
	
	public void removeAllProduct() {
		cartList.removeAllElements();
	}
	
	
}
