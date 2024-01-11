package day0111;

class Shop {
	private String sangpum;
	private int price;
	private String sangColor;

	public Shop(String s, int p, String c) {
		sangpum = s;
		price = p;
		sangColor = c;
	}

	public static void showIitle() {
		System.out.println("상품명\t가격\t색상");
		System.out.println("=================");
	}

	// 생성한 갯수만큼 출력
	public void showShop() {
		System.out.println(sangpum + "\t" + price + "원\t" + sangColor);
	}
}

public class ArrObTest_11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Shop.showIitle();
		Shop [] sp = {
				new Shop("자전거",10000,"주황색"),
				new Shop("선풀기",20000,"빨강색"),
				new Shop("책상",30000,"갈색")
		};
		
		
		for(int i = 0;i<sp.length;i++) {
			sp[i].showShop();
		}
		
	}

}
