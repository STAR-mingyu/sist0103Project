package day0105;

import java.util.Scanner;

public class QuizOper_19 {

	public static void main(String[] args) {
		/*
		 * (평가는 90점 이상은 참잘함!! 80점 이상은 좀더 노력하세요~~ 80점미만:불합격) 이름을 입력하세요 손흥민 국,영,수 점수를
		 * 입력하세요 88 99 77
		 * 
		 * ====================== [손흥민 님의 기말고사 성적] 총점: ** 점 평균: **,*점 평가: 좀더 노력하세요~~
		 */

		Scanner sc = new Scanner(System.in);
		String name, eval;
		eval = "";
		int a, b, c, tot, avg;
		System.out.println("이름을 입력하세요");
		name = sc.nextLine();
		System.out.println("국,영,수 점수를 입력하세요");
		a = sc.nextInt();
		b = sc.nextInt();
		c = sc.nextInt();
		tot = a + b + c;
		avg = tot / 3;

//		if ( avg >= 90) {
//			eval = "참잘함";
//		} else if (avg >= 80) {
//			eval = "좀더노력하세요";
//		} else {
//			eval = "불합격";
//		}

		switch (avg / 10) {
		case 10:
		case 9:
			eval = "참잘함";
			break;
		case 8:
			eval = "좀더노력하세요";
			break;
		default:
			eval = "불합격";

		}

		System.out.println("======================");
		System.out.printf("[%s님의 기말고사 성적]", name);
		System.out.printf("총점: %d점", tot);
		System.out.printf("평균: %d점", avg);
		System.out.printf("평가: %s점", eval);

	}

}
