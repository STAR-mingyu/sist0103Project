package day0125;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class QuizJdbcFoodOrder {

	static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";

	public void foodOrder() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select order_num  ,f.fno fno ,order_name ,food_name ,price ,f_shopname ,shop_loc ,order_addr  from foodshop f,jumun j where f.fno = j.fno order by order_name desc";

		try {
			conn = DriverManager.getConnection(URL, "stu", "a1234");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println("연결성공!");
			while (rs.next()) {
				int orderNum = rs.getInt("order_num");
				int foodNum = rs.getInt("fno");
				String orderName = rs.getString("order_name");
				String foodName = rs.getString("food_name");
				int foodPrice = rs.getInt("price");
				String shopName = rs.getString("f_shopname");
				String shopAddr = rs.getString("shop_loc");
				String orderAddr = rs.getString("order_addr");

				System.out.println(orderNum + "\t" + foodNum + "\t" + orderName + "\t" + foodName + "\t" + foodPrice
						+ "\t" + shopName + "\t" + shopAddr +  "\t" + orderAddr);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
//				e.printStackTrace();
			System.out.println("연결실패!");
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		QuizJdbcFoodOrder quiz = new QuizJdbcFoodOrder();
		quiz.foodOrder();
	}

}
