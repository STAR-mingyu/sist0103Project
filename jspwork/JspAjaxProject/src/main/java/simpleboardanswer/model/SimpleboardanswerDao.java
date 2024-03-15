package simpleboardanswer.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DbConnect;

public class SimpleboardanswerDao {
	DbConnect db = new DbConnect();

	// insert
	public void insertAnswer(SimpleboardanswerDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into simpleboardanswer values (null,?,?,?,now())";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNum());
			pstmt.setString(2, dto.getNickname());
			pstmt.setString(3, dto.getContent());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	// list
	public List<SimpleboardanswerDto> list(String num) {
		List<SimpleboardanswerDto> list = new ArrayList<SimpleboardanswerDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from simpleboardanswer where num = ? order by idx desc";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SimpleboardanswerDto dto = new SimpleboardanswerDto();
				dto.setContent(rs.getString("content"));
				dto.setIdx(rs.getString("idx"));
				dto.setNickname(rs.getString("nickname"));
				dto.setNum(rs.getString("num"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	// 삭제
	public SimpleboardanswerDto delete(String idx) {
		SimpleboardanswerDto dto = new SimpleboardanswerDto();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM simpleboardanswer WHERE idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

		return dto;
	}

	// 업데이트
	public void update(SimpleboardanswerDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE simpleboardanswer SET nickname = ?, content = ? WHERE idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "nickname");
			pstmt.setString(2, "content");
			pstmt.setString(3, "idx");
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}
