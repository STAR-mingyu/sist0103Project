package quiz.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
	static final String ORACLEDRIVER = "oracle.jdbc.OracleDriver";
	static final String ORACLEURL = "jdbc:oracle:thin:@localhost:1521:XE";

	public DbConnect() {
		try {
			Class.forName(ORACLEDRIVER);
			System.out.println("드라이버 성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("오라클드라이버 실패" + e.getMessage());
		}
	}

	public Connection dbConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(ORACLEURL, "dragon", "a1234");
			System.out.println("오라클 계정 연결 성공");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("오라클 연결 실패" + e.getMessage());
		}
		return conn;
	}

	public void dbclose(ResultSet rs, Statement stmt, Connection conn) {

		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public void dbclose(Statement stmt, Connection conn) {
		
		try {

			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void dbclose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		
		try {
			if (rs != null) {
				rs.close();
			}
			
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void dbclose(PreparedStatement pstmt, Connection conn) {
		
		try {
		
			
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
