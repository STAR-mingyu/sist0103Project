package day0105;

import java.util.Calendar;
import java.util.Scanner;

public class QuizMyAgeInOut_02 {

	public static void main(String[] args) {
		/* 
		 * 당신의 이름은?==> 김민규
		 * 당신이 태어난 연도는 ==> 1998
		 * 당신이 사는 지역은?==> 경기
		 * 
		 * ===========================
		 * [김민규 님의 개인정보]
		 * ===========================
		 * 이름: 김민규
		 * 태어난년도 : 1998
		 * 나이: 27세
		 * 지역: 경기
		 * 
		 * */
		
		Calendar cal = Calendar.getInstance();
		Scanner sc = new Scanner(System.in);
		
		String name,area;
		int curYear,myBirthYear,myAge;
		System.out.print("당신의 이름은?==>");
		name = sc.nextLine();
		System.out.print("당신이 태어난 연도는?==>");
		myBirthYear = Integer.parseInt(sc.nextLine());   
		System.out.print("당신이 사는 지역은?==>");
		area = sc.nextLine();
		curYear = cal.get(cal.YEAR);
		myAge = curYear - myBirthYear; 
		System.out.println("====================");
		System.out.println("김민규 님의 개인정보");
		System.out.println("====================");
		System.out.printf("이름: %s\n",name);
		System.out.printf("태어난년도: %d\n",myBirthYear);
		System.out.printf("나이: %d세\n",myAge);
		System.out.printf("지역: %s",area);
		

	}

}
