package day0105;

import java.util.Scanner;

public class OperTest_08 {

	public static void main(String[] args) {
		// 신체검사를 하는데 이름과 키,몸무게 입력하면
		// 표준몸무게를 출력해(키-110)*0.9... 표준몸무게는 소수점한자리로 출력해주세요
		/*
		 * 당신의 이름? 이효리 키? 165 몸무게? 55
		 * 
		 * 
		 * 이효리님의 표준몸무게는 55키로 입니다
		 * 
		 */

		Scanner sc = new Scanner(System.in);
		String name;
		double weight, height,standardWeight;
		System.out.println("당신의 이름?");
		name = sc.nextLine();
		System.out.println("키?");
		height = sc.nextDouble();
		System.out.println("몸무게?");
		weight = sc.nextDouble();
		standardWeight = (height - 100) * 0.9;
	

		System.out.println("===================================================");
		System.out.printf("%s님의 권장 표준몸무게는 %.1fkg입니다.", name,standardWeight);

	}

}
