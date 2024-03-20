package memgaip.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DbConnect;
import oracle.jdbc.logging.annotations.Blind;

public class MemgaipDao {
	DbConnect db = new DbConnect();

	// 아이디가 존재하면 true 리턴
	public boolean isIdCheck(String m_id) {
		boolean b = false; // 있을 경우에만 true로 변경

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from memgaip where m_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				b = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return b;

	}

	// insert
	public void insertMemgaip(MemgaipDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into memgaip values (null,?,?,?,?,?,now())";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getM_id());
			pstmt.setString(2, dto.getM_pass());
			pstmt.setString(3, dto.getM_name());
			pstmt.setString(4, dto.getM_hp());
			pstmt.setString(5, dto.getM_photo());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	// list
	public List<MemgaipDto> dataList() {
		List<MemgaipDto> list = new ArrayList<MemgaipDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from memgaip order by m_num";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemgaipDto dto = new MemgaipDto();
				dto.setM_hp(rs.getString("m_hp"));
				dto.setM_id(rs.getString("m_id"));
				dto.setM_name(rs.getString("m_name"));
				dto.setM_num(rs.getString("m_num"));
				dto.setM_pass(rs.getString("m_pass"));
				dto.setM_photo(rs.getString("m_photo"));
				dto.setGaipday(rs.getTimestamp("gaipday"));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// 비밀번호 check
	public boolean passCheck(String passWord) {

		boolean pass = false;

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from memgaip where m_pass = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, passWord);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pass = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return pass;
	}

	// delete
	public void delete(String m_num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM memgaip WHERE m_num = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	// num값 얻기
	public MemgaipDto getData(String m_num) {
		MemgaipDto dto = new MemgaipDto();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from memgaip where m_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setM_hp(rs.getString("m_hp"));
				dto.setM_id(rs.getString("m_id"));
				dto.setM_name(rs.getString("m_name"));
				dto.setM_num(rs.getString("m_num"));
				dto.setM_pass(rs.getString("m_pass"));
				dto.setM_photo(rs.getString("m_photo"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}

	// update
	public void update(MemgaipDto dto) {
	    Connection conn = db.getConnection();
	    PreparedStatement pstmt = null;

	    String sql = "UPDATE memgaip SET m_name=?, m_pass=?, m_hp=?, m_photo=? WHERE m_num=?";
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, dto.getM_name());
	        pstmt.setString(2, dto.getM_pass());
	        pstmt.setString(3, dto.getM_hp());
	        pstmt.setString(4, dto.getM_photo());
	        pstmt.setString(5, dto.getM_num());
	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        db.dbClose(pstmt, conn);
	    }
	}

}
