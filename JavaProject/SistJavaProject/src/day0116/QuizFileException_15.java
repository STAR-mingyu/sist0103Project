package day0116;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.StringTokenizer;

public class QuizFileException_15 {


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

				//분리방법1
//				StringTokenizer st = new StringTokenizer(s, ",");
				//배열의 갯수만큼 반복해서 출력
//				String a = (st.nextToken());
//				String b = (st.nextToken());
//				String c = (st.nextToken());
//				int tot = Integer.parseInt(b) * Integer.parseInt(c);
	
				//분리방법2
				String [] data = s.split(",");
				String a = data[0];
				int b = Integer.parseInt(data[1].trim());
				int c = Integer.parseInt(data[2].trim());
				int tot = b * c;
				//출력
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


	public static void main(String[] args) {

		FileRead();
	}

}
