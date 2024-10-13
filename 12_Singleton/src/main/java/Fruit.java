
public class Fruit {
	
	private static Fruit instance; //null에 주소가 들어옴(Fruit@6f2b958e)
	//static 메서드 안에서는 static 변수만 사용 가능함
	public static Fruit getInstance() { //static으로 정의된 메서드는 객체를 만들지 않고 클래스 이름만으로도 호출할 수 있음
		if(instance == null) {
			instance = new Fruit(); //같은 클래스 안에서 private 접근 가능
		}
		return instance;//Fruit@6f2b958e 리턴
	}
	private Fruit() {
		System.out.println("Fruit 생성자");
	}
	
	public void apple() {
		System.out.println("apple");
	}
	public void banana() {
		System.out.println("banana");
	}
	public void orange() {
		System.out.println("orange");
	}
}
