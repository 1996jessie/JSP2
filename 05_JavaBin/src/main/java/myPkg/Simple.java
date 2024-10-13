package myPkg;

public class Simple {
	private String msg;
	
	public void setMsg(String msg) {
		this.msg = msg;  
		System.out.println("setMsg msg:" + msg);
	}

	public String getMsg() {
		System.out.println(msg);
		return msg; 
	}

}
