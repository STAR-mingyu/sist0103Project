package day0108;

import java.util.Scanner;

public class QuizForWhile_15 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		test1();
		test2();
		test3();
		test4();
	}

	public static void test1() {

		// 문제: 1~100까지의 3의 배수 갯수 구하기
		int n = 0;
		int cnt = 0;
		while (true) {
			n++;

			// 3의 배수이면 cnt변수 1증가
			if (n % 3 == 0) {
				cnt++;

			}
			// n이 100이면 while문 종료
			if (n == 100) {
				break;
			}
		}
		System.out.println("3의 배수 갯수 : " + cnt + " 개");

	}

	public static void test2() {
		// 1~100까지의 짝수 합구하기 (while(true))

		int a = 0;
		int sum = 0;

		while (true) {
			a++;
			if (a % 2 == 0) {
				sum += a;
			}

			if (a == 100) {
				break;
			}
		}

		System.out.println("1~100까지의 짝수 합은 : " + sum);

	}

	public static void test3() {
		// for문 이용 1~100까지의 홀수합 구하기

		int i = 0;
		int sum = 0;
		for (; i < 100; i++) {
			if (i % 2 == 1) {
				sum += i;
			}

			if (i == 100) {
				break;
			}
		}
		System.out.println("1~100까지의 홀수 합은 : " + sum);
	}

	public static void test4() {
		/*
		 * (1~100까지만 입력 가능) 총 5개의 점수를 입력 받아 합계 구하기 1번 점수 : 90 2번 점수 : -90 잘못입력했어요 2번 점수
		 * : 85 3번 점수 : 120 잘못입력했어요 3번 점수 : 88 4번 점수 : 98 5번 점수 : 75 총점 : ***점
		 */

		int count = 1;
		int sum = 0;

		Scanner sc = new Scanner(System.in);


		System.out.println("점수를 적어보세요");
		for (; count <= 5; count++) {
			System.out.print(count + "번 점수 : ");
			int score = sc.nextInt();
			sum += score;
			if (score < 0 || score > 100) {
				System.out.print("잘못입력했어요\n");
				count--;
				continue;
			}
		}
		System.out.println("점수의 합계는 " + sum);

	}

}
