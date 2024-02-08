package day0110;

import java.util.Scanner;

public class day0110Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int[] arr1 = { 234, 45, 234, 76, 87, 54, 76 };
		boolean flag;
		int su;

		Scanner sc = new Scanner(System.in);

		while (true) {
			System.out.println("검색할 숫자 입력");
			su = Integer.parseInt(sc.nextLine());

			if (su == 0) {
				System.out.println("종료!!");
				break;
			}

			flag = false;

			for (int i = 0; i < arr1.length; i++) {
				if (su == arr1[i]) {
					flag = true;
					System.out.println("찾았습니다");
				}

			}
			if (!flag) {
				System.out.println("못찾았습니다");
			}
		}
	}

}
