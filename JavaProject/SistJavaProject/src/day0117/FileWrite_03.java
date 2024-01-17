package day0117;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

public class FileWrite_03 {

	public static void fileWrite() {
		FileWriter fw = null;
		String fileNmae = "C:\\sist0103\\file\\test1.txt";

		try {
			fw = new FileWriter(fileNmae); // 파일새로생성(같은이름이 있어도 새로생성)
			// 파일에 내용추가
			fw.write("Have a Nice Day~~\n"); // 메모장 줄넘김
			fw.write("오늘은 수요일\n");
			fw.write(new Date().toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void fileWriter2() {
		FileWriter fw = null;
		String fileName = "C:\\sist0103\\file\\test1.txt";

		try {
			fw = new FileWriter(fileName,true); //true로 하면 추가모드
			
			fw.write("내이름은 김민규\n");
			fw.write("--------------------\n");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		fileWrite();
		fileWriter2();
	}

}
