package com.lec.dental.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.dental.dto.MedicalDto;

public class MedicalDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;

	private static MedicalDao instance = new MedicalDao();

	public static MedicalDao getInstance() {
		return instance;
	}

	private MedicalDao() {
	}

	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	// (1) 글 목록
	public ArrayList<MedicalDto> listBoard(int startRow, int endRow) {
		ArrayList<MedicalDto> dtos = new ArrayList<MedicalDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT A. *," + 
				"    (SELECT MNAME FROM MEMBER WHERE A.MID=MID) MNAME," + 
				"    (SELECT ANAME FROM ADMIN WHERE A.AID=AID) ANAME" + 
				"        FROM (SELECT ROWNUM RN, B.*" + 
				"            FROM (SELECT * FROM MRBOARD ORDER BY MRRDATE DESC) B) A" + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dtos.add(new MedicalDto(mrno, mid, aid, mrtitle, mrcontent, mrrdate, mrhit, mrgroup, mrstep, mrindent, mrip))
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;

	}

}