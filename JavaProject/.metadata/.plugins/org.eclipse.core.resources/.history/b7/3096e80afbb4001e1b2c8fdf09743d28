package day0111;

class MyCarl {
	String carName;
	int carPrice;
	String carColor;
}


public class CallByReference_12 {
	
	public static void dataIn(MyCarl car1) {
		car1.carName = "미니쿠퍼";
		car1.carPrice = 42000;
		car1.carColor = "진주색";
	}

	public static void dataOut(MyCarl car1) {
		System.out.println("차종명 : " + car1.carName);
		System.out.println("차량가격 : " + car1.carName);
		System.out.println("색상 : " + car1.carColor);
	}
	
	
	//두 메서드 다 주소가 전달되므로 결국 메인의 car변수에 데이터가 들어가고 출력한다
	public static void main(String[] args) {
		MyCarl car = new MyCarl();
		
		dataIn(car);
		dataOut(car);

	}

}
