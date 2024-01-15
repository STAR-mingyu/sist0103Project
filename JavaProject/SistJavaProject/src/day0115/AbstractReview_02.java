package day0115;

abstract class Game {
	abstract public void play();

	abstract public void stop();
}

/////////////////////////
class Kim extends Game {

	@Override
	public void play() {
		System.out.println("kim게임시작");

	}

	@Override
	public void stop() {
		System.out.println("kim게임중단");

	}

}

/////////////////////////
class Lee extends Game {

	@Override
	public void play() {
		System.out.println("Lee게임시작");

	}

	@Override
	public void stop() {
		System.out.println("Lee게임중단");

	}

}

/////////////////////////
class choi extends Game {

	@Override
	public void play() {
		System.out.println("choi게임시작");

	}

	@Override
	public void stop() {
		System.out.println("choi게임중단");

	}

}

public class AbstractReview_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*Game game = null;
		game=new Kim();
		game.play();
		game.stop();
		System.out.println();
		game=new Lee();
		game.play();
		game.stop();
		System.out.println();
		game=new choi();
		game.play();
		game.stop();
		System.out.println();
		*/
		
		Game[] game = new Game[3]; //선언
		game[0] = new Kim(); //생성
		game[1] = new Lee();
		game[2] = new choi();
		
		for(int i =0;i<game.length;i++) {
			game[i].play();
		}
		System.out.println("====================");
		for(int i=game.length-1;i>=0;i--) {
			game[i].stop();
		}

	}

}
