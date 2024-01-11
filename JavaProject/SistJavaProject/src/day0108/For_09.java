package day0108;

public class For_09 {

	public static void main(String[] args) {
		// 가로로 1~10까지 출력
		for (int a = 1; a <= 10; a++) {
			System.out.print(a + "  ");
		}
		System.out.println();
		// 10~1까지 출력
		for (int b = 10; b >= 1; b--) {
			System.out.print(b + "  ");
		}
		System.out.println();
		// 5씩 증가
		for (int i = 0; i <= 50; i += 5) {
			System.out.print(i + " ");
		}

		System.out.println();
		// continue
		for (int c = 1; c <= 20; c++) {
			// 1 2 3 4 5 6 7 8 9 ....20
			// 5의 배수 출력
			if (c % 5 == 0) {
				continue; // continue아래 문장은 수행하지 않고 i++로 이동

			}
			System.out.print(c + "  ");
		}

	}

}
