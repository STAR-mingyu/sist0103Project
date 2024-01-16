package day0116;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.StringTokenizer;

public class QuizFileException_15 {

	private int no, price = 0;

	public static void FileRead() {
		String fname = "C:\\sist0103\\file\\fruitshop.txt";
		FileReader fr = null;
		BufferedReader br = null;

		try {
			fr = new FileReader(fname);
			br = new BufferedReader(fr);

			System.out.println("**과일입고목록**");
			System.out.println();
			System.out.println("번호\t과일명\t수량\t단가\t총금액");
			System.out.println("-----------------------------------------");
			int cnt = 0;


			while (true) {

				String s = br.readLine();
				if (s == null) {
					break;
				}
				cnt++;

				StringTokenizer st = new StringTokenizer(s, ",");

				String a = (st.nextToken());
				String b = (st.nextToken());
				String c = (st.nextToken());
				
				int tot = Integer.parseInt(b) * Integer.parseInt(c);
	
				System.out.println(cnt + "\t" + a + "\t" + b + "\t" + c + "\t" + tot);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	public void write() {

	}

	public static void main(String[] args) {

		FileRead();
	}

}
