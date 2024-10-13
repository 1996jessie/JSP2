
public class Ex02 {
	public static void main(String[] args) {
		//Fruit f1 = new Fruit();//생성자 private이라 다른 클래스에서 객체 만들 수 없음
		//f1.getInstance();
		Fruit f1 = Fruit.getInstance(); //Fruit@6f2b958e 주소 리턴받음
		//static으로 정의된 메서드는 객체를 만들지 않고 클래스 이름만으로도 호출할 수 있음
		f1.apple();
		f1.banana();
		f1.orange();
		
		Fruit f2 = Fruit.getInstance();
		//null이 아니라서 객체를 또 만들지 않음 //Fruit@6f2b958e 리턴됨
		f2.apple();
		f2.banana();
		f2.orange();
		
		System.out.println("f1 : " + f1);
		System.out.println("f2 : " + f2);
	}
}

/*
singleton 패턴으로 객체 생성
1. public static 메서드 정의 : static으로 정의된 메서드는 객체를 만들지 않고 클래스 이름만으로도 호출할 수 있음
2. private static 참조변수 : static 메서드 안에서는 static 변수만 사용 가능함
3. 생성자는 private
 */
