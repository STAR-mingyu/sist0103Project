package day0110;

import java.util.Scanner;

public class ArraySearchName_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String[] name = { "홀길동", "김길동", "박길동", "최길동", "나길동", "가길동", "나나나", "가나다" };

		Scanner sc = new Scanner(System.in);
		boolean flag;
		String nameIn;

		while (true) {
			System.out.println("이름을 입력해보세요");
			nameIn = sc.nextLine();
			
			
		   if(nameIn.equalsIgnoreCase("q")) {
			   System.out.println("종료");
			   break;
		   }
		   
		   flag = false;
		   
		   for(int i = 0; i<name.length;i++) {
			   if (nameIn.equals(name[i])) {
				   flag = true;
				   System.out.println(i+1 + " 번째에서 검색됨");
			   }
		   }
		   
		   if(!flag) {
			   System.out.println(nameIn + "님은 데이타에 없음");
		   }

		}

	}

}
