package day0108;

import java.util.Scanner;

public class Quiz_18 {

	public static void main(String[] args) {
		quiz_1();
		quiz_2();

	}

	public static void quiz_1() {
		/*
		 * Q. 반복해서 숫자를 입력하여 양수의 갯수와 음수의 갯수를 구하시오(0입력시 종료) while true 1 6 -10 88 120 -130
		 * 0 양수의 갯수 : 3개 음수의 갯수 : 2개
		 */

		Scanner sc = new Scanner(System.in);

		int plus = 0;
		int minus = 0;
		while (true) {
			System.out.println("숫자를 입력하세요");
			int num = sc.nextInt();

			if (num > 0) {
				plus++;
			} else if (num < 0) {
				minus++;
			} else {
				System.out.println("종료입니다");
				break;
			}

		}
		System.out.println("양수의 갯수 : " + plus);
		System.out.println("음수의 갯수 : " + minus);

	}

	public static void quiz_2() {

		// 반복해서 점수를 입력하고 (1~100) 0을 입력시 빠져나와 갯수와 합계와 평균을 구하시오 while true
		Scanner sc = new Scanner(System.in);
		double avg =0;
		int sum = 0;
		int count = 0;
		while (true) {
			System.out.println("점수를 입력하세요");
			int num = sc.nextInt();

			if (num == 0) {
				System.out.println("종료");
				break;
			}

			if (num < 1 || num > 100) {
				System.out.println("오류입니다");
				continue;
			}
			count++;
			sum += num;
			avg = sum / count;
		}

		System.out.printf("갯수는 %d 합계는 %d 평균은 %.2f", count, sum, avg);

	}

}
