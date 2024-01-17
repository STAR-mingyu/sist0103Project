package day0112;

class Food_test {
	private int no;
	private String name, price;

	public Food_test(String name, String price) {
		// TODO Auto-generated constructor stub
		this.name = name;
		this.price = price;

	}

	public void write() {

		no++;
		System.out.println("[메뉴_ +" + no);
		System.out.println("음식명_" + name);
		System.out.println("가격_" + price);
	}

}

public class Test {

	public static void main(String[] args) {

		Food_test [] food = {
			 new Food_test("피자","12000")
		};
	
		
	

}
}
