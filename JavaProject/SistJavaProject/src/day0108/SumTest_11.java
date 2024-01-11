package day0108;

public class SumTest_11 {

	public static void main(String[] args) {
		// 반복문에서 합계 구하기
		
		int sum = 0;
		
		for(int i = 1; i <= 5; i++) {
			
			//sum = sum + i;
			sum += i ;
		}
		
		System.out.println("1 + 10까지의 합 : " + sum + "입니다");
		
		//while
		int n = 1;
		int tot = 0;
		
		while(n <= 10) {
			tot += n; //합계변수 tot에 n을 누적시킨다
			n++;
		}
		
		System.out.println("1 + 10까지의 합 : " + tot + "입니다");
		
		System.out.println("for문으로 1~10까지중 2씩 증가할 경우의 합계를 구하시오");
		int sum2 = 0;
		for (int a = 1; a <= 10; a+=2) {
			sum2 += a;
		}
		System.out.println("총합계는 " + sum2);

	}

}
