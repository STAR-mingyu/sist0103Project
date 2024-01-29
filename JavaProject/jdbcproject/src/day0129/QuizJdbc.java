package day0129;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class QuizJdbc {

	Scanner sc = new Scanner(System.in);
	static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";

	// insert
	public void insertMember() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("사원명을 입력하세요");
		String name = sc.nextLine();
		System.out.println("부서 입력하세요");
		String buseo = sc.nextLine();
		System.out.println("직급 입력하세요");
		String rank = sc.nextLine();
		System.out.println("성별 입력하세요");
		String gender = sc.nextLine();
		System.out.println("급여를 입력하세요");
		int pay = Integer.parseInt(sc.nextLine());
		System.out.println("보너스를 입력하세요");
		int bouns = Integer.parseInt(sc.nextLine());

		String sql = "insert into sawonmember(s_no,s_name,buseo,position,gender,pay,bonus,ipsaday) values(seq_smem.nextval,?,?,?,?,?,?,sysdate)";
		try {
			conn = DriverManager.getConnection(DB_URL, "dragon", "a1234");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, buseo);
			pstmt.setString(3, rank);
			pstmt.setString(4, gender);
			pstmt.setInt(5, pay);
			pstmt.setInt(6, bouns);
			pstmt.execute();

			System.out.println("추가되었습니다");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	// select
	public void writeMember() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select s_no,s_name,buseo,position,gender,to_char(pay,'L999,999,999'),bonus,ipsaday from sawonmember";
		System.out.println("학생 점수 출력");
		System.out.println("====================================");
		System.out.println("사원번호\t사원명\t부서\t직급\t성별\t월급여\t보너스");
		try {
			conn = DriverManager.getConnection(DB_URL, "dragon", "a1234");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println(rs.getInt("s_no") + "\t" + rs.getString("s_name") + "\t" + rs.getString("buseo")
						+ "\t" + rs.getString("position") + "\t" + rs.getString("gender") + "\t"
						+ rs.getString("to_char(pay,'L999,999,999')") + "\t" + rs.getInt("bonus") + "\t"
						+ rs.getString("ipsaday"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// delete
	public void deleteMember() {
		Connection conn = null;
		PreparedStatement pstmt = null;

		System.out.println("삭제할 번호를 입력하세요");
		int no = Integer.parseInt(sc.nextLine());
		String sql = "delete from sawonmember where s_no = ?";
		try {
			conn = DriverManager.getConnection(DB_URL, "dragon", "a1234");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.execute();
			System.out.println("삭제되었습니다");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// update
	public void updateMember() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("수정할 사원번호를 입력하세요");
		int no = Integer.parseInt(sc.nextLine());
		String sql = "update sawonmember set buseo = ?,position = ?,pay = ?,bonus = ? where s_no = ?";
		System.out.println("수정할 부서를 입력하세요");
		String buseo = sc.nextLine();
		System.out.println("수정할 직급을 입력하세요");
		String position = sc.nextLine();
		System.out.println("수정할 급여를 입력하세요");
		int pay = Integer.parseInt(sc.nextLine());
		System.out.println("수정할 보너스를 입력하세요");
		int bonus = Integer.parseInt(sc.nextLine());
		System.out.println("수정되었습니다");
		try {
			conn = DriverManager.getConnection(DB_URL, "dragon", "a1234");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buseo);
			pstmt.setString(2, position);
			pstmt.setInt(3, pay);
			pstmt.setInt(4, bonus);
			pstmt.setInt(5, no);
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// search
	public void searchMember() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("검색할 이름을 기입하시오");
		String name = sc.nextLine();
		String sql = "select s_no,s_name,buseo,position,gender,to_char(pay,'L999,999,999'),bonus,ipsaday from sawonmember where s_name like ?";

		try {
			conn = DriverManager.getConnection(DB_URL, "dragon", "a1234");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + name + "%");
			rs = pstmt.executeQuery();
			System.out.println("이름이 검색되었습니다");
			while (rs.next()) {
				System.out.println(rs.getInt("s_no") + "\t" + rs.getString("s_name") + "\t" + rs.getString("buseo")
						+ "\t" + rs.getString("position") + "\t" + rs.getString("gender") + "\t"
						+ rs.getString("to_char(pay,'L999,999,999')") + "\t" + rs.getInt("bonus") + "\t"
						+ rs.getString("ipsaday"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// process
	public void process() {

		while (true) {
			System.out.println("1.사원정보입력  2.전체사원출력  3.사원삭제  4.사원수정  5.이름검색 9.시스템종료");
			int no = Integer.parseInt(sc.nextLine());
			if (no == 1) {
				insertMember();
			} else if (no == 2) {
				writeMember();
			} else if (no == 3) {
				deleteMember();
			} else if (no == 4) {
				updateMember();
			} else if (no == 5) {
				searchMember();
			} else if (no == 9) {
				System.exit(0);
				System.out.println("끝");
			}
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		QuizJdbc quiz = new QuizJdbc();
		quiz.process();

	}

}
