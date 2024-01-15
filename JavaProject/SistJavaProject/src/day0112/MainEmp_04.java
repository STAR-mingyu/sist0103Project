package day0112;


//클래스를 객체 생성할때는 자동으로 부모=>자식순 그래야 자식이 부모의 멤버를 사용할 수 있기 때문
public class MainEmp_04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Manager_04 meanger = new Manager_04("김민규",2,"경영기획부");
		
		System.out.println(meanger.getEmployee());
		
		
	}

}
