package day0111;

class Artist {
	// 변수명
	private String company;
	private String name;
	private String song;
	int cnt = 0;

	// 명시적생성자

	public Artist() {
		// TODO Auto-generated constructor stub
	}

	public Artist(String company, String name, String song) {
		this.company = company;
		this.name = name;
		this.song = song;
		
		//출력메서드 한번에 만들기
	}
	
	public void Artist2() {
		cnt++;
		System.out.println("**아티스트 정보_" + cnt+"***");
		System.out.println("소속기획사 : " + this.company);
		System.out.println("그룹명 : " + this.name);
		System.out.println("대표곡 : " + this.song);
	}

}

public class QuizInstance_06 {

	public static void main(String[] args) {
		Artist artist1 = new Artist("하이브", "BTS", "버터");
		Artist artist2 = new Artist("뉴진스","뉴진스","어텐션");
		
		artist1.Artist2();
		System.out.println();
		artist2.Artist2();

	}

}
