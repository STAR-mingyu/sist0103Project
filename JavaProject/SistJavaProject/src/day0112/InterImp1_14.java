package day0112;

interface InterA {
	public void singasong();

	public void draw();
}

//////////////////////
interface InterB extends InterA {
	public void playgame();

	public void write();
}

//////////////////////
class Imple implements InterB {

	@Override
	public void singasong() {
		// TODO Auto-generated method stub

		System.out.println("노래");
	}

	@Override
	public void draw() {
		// TODO Auto-generated method stub
		System.out.println("그림");

	}

	@Override
	public void playgame() {
		// TODO Auto-generated method stub
		System.out.println("게임");
	}

	@Override
	public void write() {
		// TODO Auto-generated method stub
		System.out.println("글쓰기");

	}

}
//////////////////////

public class InterImp1_14 {

	public static void main(String[] args) {
		
		//하위클래스 생성
		Imple imple = new Imple();
		imple.singasong();
		imple.draw();
		imple.playgame();
		imple.write();
		
		System.out.println();
		InterB inb = new Imple();
		inb.singasong();
		inb.draw();
		inb.playgame();
		inb.write();

	}

}
