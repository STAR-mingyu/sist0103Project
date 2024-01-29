package day0126;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class QuizStuInfo {

	static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";

	public void insert() {
		Scanner sc = new Scanner(System.in);
		String name, gender, phone;
		int age;
		String sql = "";
		System.out.println("학생명을 입력해주세요");
		name = sc.nextLine();
		System.out.println("성별을 입력해주세요");
		gender = sc.nextLine();
		System.out.println("나이를 입력해주새요");
		age = Integer.parseInt(sc.nextLine());
		System.out.println("연락처를 입력해주세요");
		phone = sc.nextLine();

		sql = "insert into stuinfo values(seq_info.nextval,'" + name + "','" + gender + "','" + age + "','" + phone
				+ "',sysdate)";
		System.out.println(sql);

		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DriverManager.getConnection(URL, "dragon", "a1234");
			stmt = conn.createStatement();
			stmt.execute(sql);
			System.out.println("**데이타 추가됨**");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public void select() {
		String sql = "";
		System.out.println("번호\t이름\t성별\t나이\t연락처\t가입날짜");
		System.out.println("---------------------------------");

		sql = "select * from stuinfo";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection(URL, "dragon", "a1234");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				System.out.println(rs.getInt("no") + "\t" + rs.getString("s_name") + "\t" + rs.getString("s_gender")
						+ "\t" + rs.getInt("s_age") + "\t" + rs.getString("s_hp") + "\t" + rs.getDate("gaipday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void delete() {
		Scanner sc = new Scanner(System.in);
		String name, gender, phone;
		int age;
		String sql = "";
		String no;

		System.out.println("삭제할 번호 입력");
		no = sc.nextLine();
		sql = "delete from stuinfo where no =" + no;
		System.out.println(sql);
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DriverManager.getConnection(URL, "dragon", "a1234");
			stmt = conn.createStatement();
			int a = stmt.executeUpdate(sql);

			if (a == 0) {
				System.out.println("없는데이타입니다");
			} else {
				System.out.println("삭제되었습니다");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void update() {
		Scanner sc = new Scanner(System.in);
		String name, gender, phone, day, num;
		System.out.println("수정할 번호 입력");
		num = sc.nextLine();
		if (!this.gerOneDate(num)) {
			System.out.println("해당번호는 존재하지 않습니다");
			return;
		}
		int age;
		String sql = "";
		System.out.println("수정할 이름을 변경해주세요");
		name = sc.nextLine();
		System.out.println("수정할 성별을 변경해주세요");
		gender = sc.nextLine();
		System.out.println("수정할 나이를 변경해주세요");
		age = Integer.parseInt(sc.nextLine());
		System.out.println("수정할 핸드폰번호을 변경해주세요");
		phone = sc.nextLine();

		sql = "update stuinfo set s_name ='" + name + "',s_gender= '" + gender + "',s_age ='" + age + "',s_hp='" + phone
				+ "' where no =" + num;

		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DriverManager.getConnection(URL, "dragon", "a1234");
			stmt = conn.createStatement();
			int a = stmt.executeUpdate(sql);
			if (a == 0) {
				System.out.println("수정할 데이타가 없습니다");
			} else {
				System.out.println("수정되었습니다");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public boolean gerOneDate(String num) {
		boolean flag = false;
		String sql = "select * from stuinfo where no=" + num;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection(URL, "dragon", "a1234");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return flag;
		}
	}

	public void search() {
      String sql = "";
      String name;
      Scanner sc = new Scanner(System.in);
      System.out.println("이름을 입력하세요");
      name = sc.nextLine();
      
      
      sql = "select * from stuinfo where Like";
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		QuizStuInfo quiz = new QuizStuInfo();
		Scanner sc = new Scanner(System.in);
		int n;
		while (true) {
			System.out.println("1.insert 2.select 3delete 4.update 5.search");

			n = Integer.parseInt(sc.nextLine());
			if (n == 1) {
				quiz.insert();
			} else if (n == 2) {
				quiz.select();
			} else if (n == 3) {
				quiz.delete();
			} else if (n == 4) {
				quiz.update();
			} else if (n == 5) {
				quiz.search();
			}
		}
	}

}
