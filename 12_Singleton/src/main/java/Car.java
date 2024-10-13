
public class Car {
	
	private static Car instance;
	public static Car getInstance() {
		if(instance == null) {
			instance = new Car();
		}
		return instance;
	}
	public void morning() {
		System.out.println("morning");
	}
	public void genesis() {
		System.out.println("genesis");
	}
	public void sonata() {
		System.out.println("sonata");
	}
}
