package day0110;

class Korean {
	//인스턴스 final필드 선언
	final String nation = "대한민국";
	final String ssn;
	
	
	//인스턴스 필드 선언
	String name;
	
	//생성자 선언
	
	public Korean (String ssn,String name) {
		this.ssn = ssn;
		this.name = name;
	}
}

public class Book253_18 {

	public static void main(String[] args) {
		// 객체 생성 시 주민등록번호와 이름 전달
		Korean k1 = new Korean("123456-123456", "감자바");
		
		//필드값
		System.out.println(k1.nation);
		System.out.println(k1.ssn);
		System.out.println(k1.name);
		
		//fianl 필드는 값을 변경할 수 없음
		//k1.nation = "USA"
		//K1.SSN = "123-12-1234"
		k1.name = "김자바";

	}

}
