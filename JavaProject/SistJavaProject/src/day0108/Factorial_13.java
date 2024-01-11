package day0108;

import java.util.Scanner;

public class Factorial_13 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		// 1~10까지의 펙토리얼 구하기
		int result = 1;
		
		for(int i = 1; i <= 10; i++) {
			result*=i;
			System.out.println(i+"!"+result);
		}

		 
		//Q. 합계를 구할 숫자를 입력시 1부터 여렁분이 입력한 숫자까지 합을 구해주세요
		int sum = 0;
		int myNum ;
		System.out.println("숫자를 입력해주세요");
		myNum = sc.nextInt();
		
		for (int i = 1; i <= myNum; i++) {
			sum+=i;
			System.out.println("1부터 " + myNum + "까지의 합 = " + sum);
		}

	}

}
