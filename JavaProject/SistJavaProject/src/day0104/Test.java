package day0104;

import java.util.Scanner;

public class Test {

	public static void main(String[] args) {

		/*
		 * 상품명을 입력하세요==>아이폰15 가격은 얼마입니까?==>1200000 수량은 몇개입니까==>5
		 * 
		 * 상품입고 ======================== 입고상품명 : 아이폰13 수량:5개 가격:1200000원
		 * ======================== 총가격:6000000원
		 */

		Scanner sc = new Scanner(System.in);
		System.out.println("상품명을 입력해");
		String name = sc.nextLine();
		System.out.println("가격 얼마");
		int price = sc.nextInt();
		System.out.println("수량 몇개");
		int count = sc.nextInt();
		System.out.printf("입고상품명 : %s 수량 %d개 가격:%d원", name, price, count);
		int total = price * count;
		System.out.println(total);

	}

}
