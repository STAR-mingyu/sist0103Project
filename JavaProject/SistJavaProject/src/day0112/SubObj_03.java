package day0112;

public class SubObj_03 extends SuperObj_03{

	public SubObj_03(String name, int age,String addr) {
		super(name, age); //반드시 첫줄,부모생성자 호출
		this.addr = addr;
		// TODO Auto-generated constructor stub
	}
	
	public SubObj_03() {
		
	}
	
	
	public void writeDate() {
		System.out.println("이름 : " + this.name);
		System.out.println("나이 : " + this.age);
		System.out.println("주소 : " + this.addr);
	}

	String addr;
	
}
