
public class Ex01 {
	public static void main(String[] args) {
		Fruit f1 = new Fruit();
		f1.apple();
		//f1.banana();
		//f1.orange();
		
		
		Fruit f2 = new Fruit();
		f2.banana();
		
		Fruit f3 = new Fruit();
		f3.orange();
		
		System.out.println("f1 : " + f1);
		System.out.println("f2 : " + f2);
		System.out.println("f3 : " + f3);
	}
}
