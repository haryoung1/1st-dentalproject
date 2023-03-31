package com.lec.dental.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.dental.dto.NoticeDto;

public class NoticeDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;

	private static NoticeDao instance = new NoticeDao();

	public static NoticeDao getInstance() {
		return instance;
	}

	private NoticeDao() {
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

	// (1) 공지사항 글 목록
	public ArrayList<NoticeDto> listBoard(int startRow, int endRow) {
		ArrayList<NoticeDto> dtos = new ArrayList<NoticeDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * " + 
				"    FROM (SELECT ROWNUM RN, A.*" + 
				"    FROM (SELECT N.*, ANAME FROM NOTICEBOARD N, ADMIN A  WHERE N.AID = A.AID" + 
				"    ORDER BY NBNO DESC) A)" + 
				"    WHERE RN BETWEEN ? AND ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int nbno = rs.getInt("nbno");
				String aid = rs.getString("aid");
				String nbtitle = rs.getString("nbtitle");
				String nbcontent = rs.getString("nbcontent");
				Timestamp nbrdate = rs.getTimestamp("nbrdate");
				String nbip = rs.getString("nbip");
				dtos.add(new NoticeDto(nbno, aid, nbtitle, nbcontent, nbrdate, nbip));
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

	// (2) 전체 글 갯수
	public int getNoticeCnt() {
		int totCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM NOTICEBOARD";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totCnt = rs.getInt(1);
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
		return totCnt;
	}

	// (3) 공지사항 등록 (원글쓰기)
	public int writeNotice(NoticeDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO NOTICEBOARD (NBNO, aID, NBTITLE, NBCONTENT, NBIP)"
				   + "VALUES (NOTICEBOARD_SEQ.NEXTVAL, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getAid());
			pstmt.setString(2, dto.getNbtitle());
			pstmt.setString(3, dto.getNbcontent());
			pstmt.setString(4, dto.getNbip());
			result = pstmt.executeUpdate();
			System.out.println("공지 등록 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " 공지사항 등록 실패 : " + dto);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	// (4) NBNO (글번호)로 DTO 가져오기
	public NoticeDto content(int nbno) {
		NoticeDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT N.*, ANAME FROM NOTICEBOARD N, ADMIN A WHERE N.AID=A.AID AND NBNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nbno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String aid = rs.getString("aid");
				String nbtitle = rs.getString("nbtitle");
				String nbcontent = rs.getString("nbcontent");
				Timestamp nbrdate = rs.getTimestamp("nbrdate");
				String nbip = rs.getString("nbip");
				String aname = rs.getString("aname");
				dto = new NoticeDto(nbno, aid, nbtitle, nbcontent, nbrdate, nbip);
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
		return dto;
	}

	// (5) 글번호 (nbno)로 글 전체내용 가져오기 - 수정용 View
	public NoticeDto modifyNoticeView(int nbno) {
		NoticeDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT N.*, ANAME FROM NOTICEBOARD N, ADMIN A WHERE N.AID=A.AID AND NBNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nbno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String aid = rs.getString("aid");
				String nbtitle = rs.getString("nbtitle");
				String nbcontent = rs.getString("nbcontent");
				Timestamp nbrdate = rs.getTimestamp("nbrdate");
				String nbip = rs.getString("nbip");
				dto = new NoticeDto(nbno, aid, nbtitle, nbcontent, nbrdate, nbip);
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
		return dto;
	}

	// (6) 공지글 수정
	public int modifyNotice(NoticeDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE NOTICEBOARD SET " + " NBTITLE =?," + " NBCONTENT =?,"
				   + "NBRDATE = SYSDATE," + " NBIP = ?" + " WHERE NBNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNbtitle());
			pstmt.setString(2, dto.getNbcontent());
			pstmt.setString(3, dto.getNbip());
			pstmt.setInt(4, dto.getNbno());
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "공지사항 수정 성공" : "공지사항 수정 실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "글 수정 실패 ");
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}

		return result;
	}

	// (7) 공지사항 삭제
	public int deleteNotice(int nbno) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM NOTICEBOARD WHERE NBNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nbno);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "공지글 삭제성공" : "공지글 삭제실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
}