package crud;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class FitnessDbConn {

	static final String ORACLE_DB = "jdbc:oracle:thin:@localhost:1521:XE";

	public Connection getOracle() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(ORACLE_DB, "fitness", "a1234");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;

	}

	public static void main(String[] args) {

	}

}