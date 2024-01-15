package day0112;

class Shop {
	private String name;
	private String color;
	private int price;
	private int no = 0;

	public Shop(String name, String color, int price) {
		this.name = name;
		this.color = color;
		this.price = price;
	}

	public static void shopOut() {
		System.out.println("번호\t상품명\t가격\t색상");
		System.out.println("===================");

	}

	public void shopInfo() {
		no++;
		System.out.println(no + "\t" + name + "\t" + price + "\t" + color);
	}

}

public class ArrRevuew_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Shop.shopOut();

		Shop shop1 = new Shop("요가매트", "핑크", 25000);
		Shop shop2 = new Shop("아령", "블랙", 30000);
		Shop shop3 = new Shop("레깅스", "연두", 40000);
		Shop shop4 = new Shop("나시", "노랑", 17000);

		Shop[] sh = new Shop[4];
		sh[0] = new Shop("요가매트", "핑크", 25000);
		sh[1] = new Shop("아령", "블랙", 30000);
		sh[2] = new Shop("레깅스", "연두", 40000);
		sh[3] = new Shop("나시", "노랑", 17000);

		for (int i = 1; i < sh.length; i++) {
			sh[i].shopInfo();
		}
		
		for (Shop s : sh) {
			s.shopInfo();
		}

	}

}
