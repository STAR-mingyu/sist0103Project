package day0111;

class MyInfo {

	private String name;
	private String mbti;
	private int age;

	public MyInfo(String name, String mbti, int age) {
		this.name = name;
		this.mbti = mbti;
		this.age = age;
	}
	
	public static void myinfo1() {
		System.out.println("이름\tMBTI\t나이");
		System.out.println("====================");
	}
	
	public void myinfo2() {
		System.out.println(name+"\t" + mbti + "\t" + age);
	}
}

public class QuizArrObTest_12 {

	public static void main(String[] args) {
		MyInfo.myinfo1();
		
		MyInfo [] arry = {
			new MyInfo("이효리","entj",22),
			new MyInfo("이상순","intj",30),
			new MyInfo("박명수","infj",52)
		};
		
		for(int i = 0;i <arry.length;i++ ) {
			arry[i].myinfo2();
		}
		
	}

}
