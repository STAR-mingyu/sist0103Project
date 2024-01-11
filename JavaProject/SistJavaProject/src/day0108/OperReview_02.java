package day0108;

import java.util.Calendar;
import java.util.Scanner;

public class OperReview_02 {

	public static void main(String[] args) {
		// 띠 : 로직에서 사용하는 순서는 원숭이
		// 원숭이 닭 쥐 소 호랑이 토끼 용 뱀 말 양 개 돼지

		Scanner sc = new Scanner(System.in);
		Calendar cal = Calendar.getInstance();

		int mybirthYear, age;
		String name, ddi;

		System.out.println("이름입력");
		name = sc.nextLine();
		System.out.println("태어난 연도 입력");
		mybirthYear = sc.nextInt();

		age = cal.get(cal.YEAR) - mybirthYear;

		ddi = mybirthYear % 12 == 0 ? "원숭이"
				: mybirthYear
						% 12 == 1
								? "닭"
								: mybirthYear % 12 == 2 ? "개"
										: mybirthYear % 12 == 3 ? "돼지"
												: mybirthYear % 12 == 4 ? "쥐"
														: mybirthYear % 12 == 5 ? "소"
																: mybirthYear % 12 == 6 ? "호랑이"
																		: mybirthYear % 12 == 7 ? "토끼"
																				: mybirthYear % 12 == 8 ? "용"
																						: mybirthYear % 12 == 9 ? "뱀"
																								: mybirthYear % 12 == 10
																										? "말"
																										: "양";
		System.out.println("이름 : " + name);
		System.out.println("현대나이 : " + age + "세");
		System.out.println("띠 : " + ddi + "띠");
	}

}
