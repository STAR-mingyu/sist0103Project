package day0105;

import java.util.Scanner;

public class QuizOper_14 {

	public static void main(String[] args) {
		/*
		 * (점수에 대한 조건은 90점이상:매우잘함 80점 이상 : 잘함 70점 이상 : 좀더노력할것 70점미안 : 꽝)
		 * 이름을 입력해주세요
		 * 김민아
		 * 자바시험점수를 입력해주세요
		 * 88
		 * 
		 * 
		 * ==================
		 * 김민아님의 시험결과는 잘함 입니다
		 * 
		 */
		
		Scanner sc = new Scanner(System.in);
		
		int result;
		String name,p_msg;
	    System.out.println("이름을 입력해주세요");
	    name = sc.nextLine();
	    System.out.println("자바시험점수를 입력해주세요");
	    result = sc.nextInt();
	    
//	    if (result >= 90) {
//	    	p_msg = "매우 잘함";
//	    } else if (result >= 80) {
//	    	p_msg = "잘함";
//	    } else if (result >= 70) {
//	    	p_msg = "좀더노력할것";
//	    } else {
//	    	p_msg = "꽝";
//	    }
	    
	    p_msg = result >= 90 ? "매우잘함" : result >= 80 ? "잘함" : result >= 70 ? "노력할것" : "꽝";
 	    
	    
	    System.out.println(name + "님의 자바점수에대한 평가는 " + p_msg +  "입니다");
	    

		 
		

	}

}
