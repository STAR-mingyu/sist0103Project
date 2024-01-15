package day0112;

import java.nio.file.spi.FileSystemProvider;
import java.util.Scanner;

class Quiz {
	private String name;
	private int java;
	private int oracle;
	private int html;
	private int tot;
	private int avg;
	private String eval;

	static final String SCHOLLTITLE = "쌍용고육센터";

	public Quiz() {

	}

	public Quiz(String name, int java, int oracle, int html, int tot, int avg, String eval) {
		this.name = name;
		this.java = java;
		this.oracle = oracle;
		this.html = html;
		this.tot = tot;
		this.avg = avg;
		this.eval = eval;
	}

	public void schoolName() {
		System.out.println("학교명 : " + SCHOLLTITLE);
	}

	public void name(String name) {
		this.name = name;

	}

	public void java(int java) {
		this.java = java;
	}

	public void oracle(int oracle) {
		this.oracle = oracle;
	}

	public void html(int html) {
		this.html = html;
	}

	public void getTotal() {
		tot = this.java + this.oracle + this.html;

	}

	public void getAverage() {
		avg = tot / 3;

	}

	public void getPyungga() {

		if (avg >= 90) {
			System.out.println("장학생");
		} else if (avg >= 80) {
			System.out.println("합격");
		} else {
			System.out.println("불합격");
		}

	}
}

public class QuizMain {

	public static void main(String[] args) {
		Quiz quiz = new Quiz();
		Scanner sc = new Scanner(System.in);
		System.out.println("이름을 입력하세요");
		quiz.name(sc.nextLine());
		System.out.println("java 입력하세요");
		quiz.java(Integer.parseInt(sc.nextLine()));
		System.out.println("oracle 입력하세요");
		quiz.oracle(Integer.parseInt(sc.nextLine()));
		System.out.println("html 입력하세요");
		quiz.html(Integer.parseInt(sc.nextLine()));
		System.out.println("html 입력하세요");
	


	}

}
