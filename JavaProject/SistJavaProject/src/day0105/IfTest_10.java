package day0105;

import java.util.Scanner;

public class IfTest_10 {

	public static void main(String[] args) {
		// TODO 숫자하나를 입력하여 결과를 출력하시오
		/*
		 * 당신이 좋아하는 숫자는? 99
		 * 
		 * 그숫자를 홀수입니다 다음에 만나요!!!
		 */

		Scanner sc = new Scanner(System.in);
		System.out.println("당신이 좋아하는 숫자는?");
		int num = sc.nextInt();
		String msg;

		if (num % 2 == 0) {
			System.out.println(num);
		} else {
			System.out.println("그숫자를 홀수입니다");
		}
		System.out.println("다음에 만나요!!");
		
		
		System.out.println("***switch문***");
		
		switch(num%2) {
		case 0:
			System.out.println("짝수");
			break;
		case 1:
			System.out.println("홀수");
			break;
		}
		
	}

}
