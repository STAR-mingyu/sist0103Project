package day0112;

class Food {

	private String foodName;
	private int fPrice;
	static int no;

	// 명시적생성자(2개)
	public Food(String name, int price) {
		foodName = name;
		fPrice = price;
	}

	// 출력문
	public void foodOut1() {
		no++;
		System.out.println("[메뉴_" + no + "]");
		System.out.println("[음식명_" + foodName + "]");
		System.out.println("[가격_" + fPrice + "]");
		System.out.println("-------------------------");
	}


}

/////////////////////////////////
public class ArrReview_01 {

	public static void main(String[] args) {
		
//		Food food1 = new Food("마르게리타 피자",12000);
//		food1.foodOut1();
//		Food food2 = new Food("까르보나라 스파게티",15000);
//		food2.foodOut1();
//		Food food3 = new Food("리코타 샐러드",9000);
//		food2.foodOut1();
		
		Food [] food = new Food[3];
		
		food[0] = new Food("마르게리타 피자",12000);
		food[1] = new Food("까르보나라 스파게티",15000);
		food[2] = new Food("리코타 샐러드",9000);
		
		for(int i = 0; i<food.length;i++) {
//			i.foodOut1();
			
			food[i].foodOut1();
		}
		
		for(Food f : food) {
			f.foodOut1();
		}
		
		
	}

}
