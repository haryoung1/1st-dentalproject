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

import com.lec.dental.dto.ReviewDto;

public class ReviewDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;

	private static ReviewDao instance = new ReviewDao();

	public static ReviewDao getInstance() {
		return instance;
	}

	private ReviewDao() {

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
	public ArrayList<ReviewDto> listBoard(int startRow, int endRow) {
		ArrayList<ReviewDto> dtos = new ArrayList<ReviewDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT A. *," + "    (SELECT MNAME FROM MEMBER WHERE A.MID=MID) MNAME,"
				+ "    (SELECT ANAME FROM ADMIN WHERE A.AID=AID) ANAME" + "        FROM (SELECT ROWNUM RN, B.*\r\n"
				+ "            FROM (SELECT * FROM RVBOARD ORDER BY RVNO DESC) B) A" + "    WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int rvno = rs.getInt("rvno");
				String mid = rs.getString("mid");
				String aid = rs.getString("aid");
				String rvtitle = rs.getString("rvtitle");
				String rvcontent = rs.getString("rvcontent");
				String rvfilename = rs.getString("rvfilename");
				Timestamp rvrdate = rs.getTimestamp("rvrdate");
				int rvhit = rs.getInt("rvhit");
				String rvip = rs.getString("rvip");
				dtos.add(new ReviewDto(rvno, mid, aid, rvtitle, rvcontent, rvfilename, rvrdate, rvhit, rvip));
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
	public int getReviewCnt() {
		int totCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM RVBOARD";
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

	// (3) 글쓰기 원글
	public int writeReview(ReviewDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO RVBOARD (RVNO, MID, AID, RVTITLE, RVCONTENT, RVFILENAME, RVIP)"
				+ "    VALUES (RVBOARD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getAid());
			pstmt.setString(3, dto.getRvtitle());
			pstmt.setString(4, dto.getRvcontent());
			pstmt.setString(5, dto.getRvfilename());
			pstmt.setString(6, dto.getRvip());
			result = pstmt.executeUpdate();
			System.out.println("원글 쓰기 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "원글 쓰기 실패 : " + dto);
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

	// (4) 조회수 올리기 (hit)
	public void rvhitUp(int rvno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE RVBOARD SET RVHIT = RVHIT + 1 WHERE RVNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " 조회수 up 실패");
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
	}

	// (5) 글번호 (RVNO)로 글 전체 내용 (RVboardDto) 가져오기
	public ReviewDto content(int rvno) {
		ReviewDto dto = null;
		rvhitUp(rvno);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM RVBOARD WHERE RVNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String mid = rs.getString("mid");
				String aid = rs.getString("aid");
				String rvtitle = rs.getString("rvtitle");
				String rvcontent = rs.getString("rvcontent");
				String rvfilename = rs.getString("rvfilename");
				Timestamp rvrdate = rs.getTimestamp("rvrdate");
				int rvhit = rs.getInt("rvhit");
				String rvip = rs.getString("rvip");
				dto = new ReviewDto(rvno, mid, aid, rvtitle, rvcontent, rvfilename, rvrdate, rvhit, rvip);
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

	// (6) 글번호(RVNO)로 글전체 내용(RVboardDto) 가져오기 - 글수정VIEW, 답변글VIEW 용
	public ReviewDto modifyView_replyView(int rvno) {
		ReviewDto dto = null;
		rvhitUp(rvno);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM RVBOARD WHERE RVNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String mid = rs.getString("mid");
				String aid = rs.getString("aid");
				String rvtitle = rs.getString("rvtitle");
				String rvcontent = rs.getString("rvcontent");
				String rvfilename = rs.getString("rvfilename");
				Timestamp rvrdate = rs.getTimestamp("rvrdate");
				int rvhit = rs.getInt("rvhit");
				String rvip = rs.getString("rvip");
				dto = new ReviewDto(rvno, mid, aid, rvtitle, rvcontent, rvfilename, rvrdate, rvhit, rvip);
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

	// (7) 글 수정하기(RVNO, RVtitle, RVcontent, RVFILENAME, RVrdate(SYSDATE), RVip 수정)
	public int modifyReview(ReviewDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE RVBOARD SET" + "        RVTITLE = ?," + "        RVCONTENT =?," + "        RVFILENAME =?,"
				+ "        RVRDATE = SYSDATE," + "        RVIP = ?" + "    WHERE RVNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getRvtitle());
			pstmt.setString(2, dto.getRvcontent());
			pstmt.setString(3, dto.getRvfilename());
			pstmt.setString(4, dto.getRvip());
			pstmt.setInt(5, dto.getRvno());
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글수정 성공" : "글번호(rvno) 오류");
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

	// (8) 글 삭제하기 (rvno 로)
	public int deleteReview(int rvno) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM RVBOARD WHERE RVNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvno);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글삭제 성공" : "글번호(rvno) 오류");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "글 삭제 실패 ");
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

	// (9) 회원탈퇴시 탈퇴하는 회원 (mID)이 쓴 글 모두 삭제하기
	public int preWithdrawalMemberStep(String mid) {
		int cntBoard = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM MRBOARD WHERE mID = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			cntBoard = pstmt.executeUpdate();
			System.out.println(cntBoard + "개글 삭제 성공(회원탈퇴전)");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "탈퇴 전 글 삭제 실패 ");
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
		return cntBoard;
	}
}
