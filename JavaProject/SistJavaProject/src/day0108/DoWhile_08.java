package day0108;

public class DoWhile_08 {

	public static void main(String[] args) {
		// 선조건 조건 차이
		
		int n = 1;
		System.out.println("**while문 결과**");
		while(n<5) { //조건이 맞지 않으면 한 번도 출력 안 될 수 있다
			System.out.print(n + "  ");
			n++;
		}
		
		System.out.println("");
		System.out.println("**do~while문 결과**");
		
		n=1;
		
		do {
			System.out.print(n++ + "  ");
		} while(n>=5);  //조건이 맞지 않아도 do부분 먼저 실행되므로 한 번은 수행을 한다

	}

}
