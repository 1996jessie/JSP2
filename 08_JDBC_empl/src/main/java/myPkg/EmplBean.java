package myPkg;

public class EmplBean { // dto, vo라고도 함
	private int eid;
	private String name;
	private int dept;
	private int salary;
	
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDept() {
		return dept;
	}
	public void setDept(int dept) {
		this.dept = dept;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	
	public EmplBean(int eid, String name, int dept, int salary) {
		super();
		this.eid = eid;
		this.name = name;
		this.dept = dept;
		this.salary = salary;
	}
	public EmplBean() {
		super();
	}
	
}
