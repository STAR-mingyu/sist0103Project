package day0111;

class Strudent1 {
	private String stuName;
	private String hp;
	private int score;

	// 생성자3개짜리
	public Strudent1(String name, String hp, int socre) {
		this.stuName = name;
		this.hp = hp;
		this.score = score;
	}
	
	//출력메서드
	public void writeData() {
		System.out.println("이름 : " + stuName);
		System.out.println("전화번호 : " + hp);
		System.out.println("점수 : " + score);
	}

}

public class ArrobTest_10 {

	public static void main(String[] args) {
		
//		Strudent1 [] stu = new Strudent1[3];
//		
//		stu[0] = new Strudent1("이민호", "010-111-2222", 88);
//		stu[1] = new Strudent1("이영자", "010-888-9999", 77);
//		stu[2] = new Strudent1("김민정", "010-777-8888", 98);
		
		//생성과 동시에 최기화
		
		Strudent1 [] stu = {
				new Strudent1("이민호", "010-111-2222", 88),
				new Strudent1("이영자", "010-888-9999", 77),
				new Strudent1("이영자", "010-888-9999", 77)
		};
		
		//배열출력 (방법#1)
		for(int i = 0;i<stu.length;i++) {
//			Strudent1 s = stu[i];
//			s.writeData();
			stu[i].writeData();
			System.out.println("----------------------------");
		}
		
		//배열출력 (방법#2)
		System.out.println("=================================");
		for(Strudent1 s1:stu) {
			s1.writeData();
			System.out.println("----------------------------");
		}
		

	}

}
