package day0105;

import java.util.Scanner;

public class QuizOper_20 {

	public static void main(String[] args) {
		/*
		 * 상품명:키보드
		 * 수량:5
		 * 가격:20000
		 * 
		 * =================
		 * **5개 이상 구매시 10%할인됩니다
		 * 키보드 5개는 총 90000원 입니다
		 * 할인된금액:10000원
		 */
		
		
		Scanner sc = new Scanner(System.in);
		String name;
		int count,price,discount,total;
		System.out.print("상품명 : ");
		name = sc.nextLine();
		System.out.print("수량 : ");
		count = sc.nextInt();
		System.out.print("가격 : ");
		price = sc.nextInt();
		total = price * count;

		
		if(count >= 5) {
          discount = total / 10;
		} else {
			discount = 0;
		}
		
		
		System.out.println("==================");
		System.out.println("5개 이상 구매시 10%할인됩니다");
		System.out.printf("키보드 %d개는 총 %d원입니다",count,total);
		System.out.printf("할인된금액:%d",discount);
		

	}

}
