package day0112;

//부모클래스
class Car {

	private String carCompany; // 제조회사
	private String carKind; // 종류

	public Car() {
		this("현대", "전기차");
	}

	public Car(String company, String carKind) {
		this.carCompany = company;
		this.carKind = carKind;
	}

	public void carWrite() {
		System.out.println("회사명 : " + this.carCompany);
		System.out.println("종류 : " + this.carKind);
	}

}
///////

//자식클래스
class MyCar extends Car {
	private String carName;
	private String carColor;
	private int carPrice;

	public MyCar() {
		this("현대", "전기차", "아이오닉5", "블랙", 35000000);
	}

	public MyCar(String company, String carKind, String name, String color, int price) {
		super(company, carKind);
		this.carName = name;
		this.carColor = color;
		this.carPrice = price;
	}

	@Override
	public void carWrite() {
		// TODO Auto-generated method stub
		super.carWrite();
		System.out.println("자동차명 : " + this.carName);
		System.out.println("색상 : " + this.carColor);
		System.out.println("가격 : " + this.carPrice);
	}
}

public class Inherit_08 {

	public static void main(String[] args) {
		MyCar car1 = new MyCar();
		System.out.println("**디폴트 생성자로 생성**");
		car1.carWrite();
		
		System.out.println();
		
		System.out.println("**명시적 생성자로 생성**");
		MyCar car2 = new MyCar("기아","가솔린","코나","화이트",25000000);
		car2.carWrite();
		System.out.println();
		
		System.out.println("**부모 메서드 출력**");
		
		Car c1 = new Car();
		c1.carWrite();
		

	}

}
