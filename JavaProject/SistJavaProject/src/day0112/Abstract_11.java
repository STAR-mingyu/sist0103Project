package day0112;

//추상클래스
//추상클래스는 new로 생성못함
//absract메서드는 absract클래스에서만 존재할 수 있다
//absract 클래스는 일반 메서드 추상메서드 둘다 포함 가능

abstract class Fruit {

	public static final String MESSAGE = "오늘은 추상클래스 배우는날~~";

	// 일반메서드
	public void showTitle() {
		System.out.println("일반메서드 입니다");
	}

	// 추상메서드(미완의 메서드,구현부가 없다)..오버라이딩이 목적
	abstract public void showMessage();

}

class Apple extends Fruit {

	@Override
	public void showMessage() {
		// TODO Auto-generated method stub
		System.out.println(Fruit.MESSAGE);
		System.out.println("Apple_Message");
	}

}

class Banana extends Fruit {

	@Override
	public void showMessage() {
		// TODO Auto-generated method stub
		System.out.println("Banana_Message");

	}

}

class Orange extends Fruit {

	@Override
	public void showMessage() {
		// TODO Auto-generated method stub
		System.out.println("Orange_Message");

	}

}

public class Abstract_11 {

	public static void main(String[] args) {
		
		//일반생성출력(자식으로 선언,자식으로 생성)
		Apple apple = new Apple();
		apple.showMessage();
		System.out.println();
		Banana banana = new Banana();
		banana.showMessage();
		System.out.println();
		Orange orange = new Orange();
		orange.showMessage();
		System.out.println();
		
		//다형성출력
		Fruit fruit;
		fruit = new Apple();
		fruit.showMessage();
		System.out.println();
		fruit = new Banana();
		fruit.showMessage();
		System.out.println();
		fruit = new Orange();
		fruit.showMessage();
		

	}

}
