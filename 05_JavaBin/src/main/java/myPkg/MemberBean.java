package myPkg;

public class MemberBean {
	private String id;
	private String pw;
	private String name;
	private String mclass;
	private String phone1;
	private String phone2;
	private String phone3;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		System.out.println("setId");
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		System.out.println("setPw");
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		System.out.println("setName");
		this.name = name;
	}
	public String getMclass() {
		return mclass;
	}
	public void setMclass(String mclass) {
		System.out.println("setMclass");
		this.mclass = mclass;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		System.out.println("setPhone1");
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		System.out.println("setPhone2");
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		System.out.println("setPhone3");
		this.phone3 = phone3;
	}
	public MemberBean() {
		super();
	}
	
	
	
}
