package day0112;

//부모
class Work {

	public void goodmorning() {
		System.out.println("안녕하세요~~");
	}

	public void process() {
		System.out.println("아무것도 안하고 있음!!");
	}
}

////////////////자식들
class Food1 extends Work {
	@Override
	public void process() {
		// TODO Auto-generated method stub
		System.out.println("***움식당담***");
	}
}

class Clean extends Work {
	@Override
	public void process() {
		// TODO Auto-generated method stub
		System.out.println("***청소당담***");
	}
}

class Sing extends Work {
	@Override
	public void process() {
		// TODO Auto-generated method stub
		System.out.println("***노래당담***");
	}
}

public class Inherit_10 {

	public static void main(String[] args) {
		//다형성
		//부모클래스 선언하고 자식클래스로 생성하는 경우
		Work work = null; //선언
		work = new Food1();
		
		work.goodmorning();
		work.process();
		System.out.println();
		
		work=new Clean();
		work.goodmorning();
		work.process();
		System.out.println();
		
		System.out.println();
		work=new Sing();
		work.goodmorning();
		work.process();
		

	}

}
