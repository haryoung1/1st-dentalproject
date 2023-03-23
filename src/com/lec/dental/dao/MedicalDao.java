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

import com.lec.dental.dto.MedicalDto;
import com.lec.dental.dto.NoticeDto;

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
		String sql = "SELECT A. *," + "    (SELECT MNAME FROM MEMBER WHERE A.MID=MID) MNAME,"
				+ "    (SELECT ANAME FROM ADMIN WHERE A.AID=AID) ANAME" + "        FROM (SELECT ROWNUM RN, B.*"
				+ "            FROM (SELECT * FROM MRBOARD ORDER BY MRRDATE DESC) B) A"
				+ "    WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int mrno = rs.getInt("mrno");
				String mid = rs.getString("mid");
				String aid = rs.getString("aid");
				String mrtitle = rs.getString("mrtitle");
				String mrcontent = rs.getString("mrcontent");
				Timestamp mrrdate = rs.getTimestamp("mrrdate");
				int mrhit = rs.getInt("mrhit");
				int mrgroup = rs.getInt("mrgroup");
				int mrstep = rs.getInt("mrstep");
				int mrindent = rs.getInt("mrindent");
				String mrip = rs.getString("mrip");
				dtos.add(new MedicalDto(mrno, mid, aid, mrtitle, mrcontent, mrrdate, mrhit, mrgroup, mrstep, mrindent,
						mrip));
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
	public int getMedicalCnt() {
		int totCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM MRBOARD";
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
	public int writeMedical(MedicalDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MRBOARD (MRNO, MID, AID, MRTITLE, MRCONTENT, MRGROUP, MRSTEP, MRINDENT, MRIP)" + 
				"    VALUES (MRBOARD_SEQ.NEXTVAL, ?, ?, ?, ?, MRBOARD_SEQ.CURRVAL, 0, 0, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getAid());
			pstmt.setString(3, dto.getMrtitle());
			pstmt.setString(4, dto.getMrcontent());
			pstmt.setString(5, dto.getMrip());
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
	public void mrhitUp(int mrno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MRBOARD SET MRHIT = MRHIT + 1 WHERE MRNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mrno);
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

	// (5) 글번호(MRNO)로 글 전체 내용(MRboardDto) 가져오기
	public MedicalDto content(int mrno) {
		MedicalDto dto = null;
		mrhitUp(mrno);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT MR.*, MNAME FROM MRBOARD MR, MEMBER M WHERE MR.MID=M.MID AND MRNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mrno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String mid = rs.getString("mid");
				String aid = rs.getString("aid");
				String mrtitle = rs.getString("mrtitle");
				String mrcontent = rs.getString("mrcontent");
				Timestamp mrrdate = rs.getTimestamp("mrrdate");
				int mrhit = rs.getInt("mrhit");
				int mrgroup = rs.getInt("mrgroup");
				int mrstep = rs.getInt("mrstep");
				int mrindent = rs.getInt("mrindent");
				String mrip = rs.getString("mrip");
				dto = new MedicalDto(mrno, mid, aid, mrtitle, mrcontent, mrrdate, mrhit, mrgroup, mrstep, mrindent,
						mrip);
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

	// (6) 글번호(MRNO)로 글전체 내용(MRboardDto) 가져오기 - 글수정VIEW, 답변글VIEW 용
	public MedicalDto modifMedicalView(int mrno) {
		MedicalDto dto = null;
		mrhitUp(mrno);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT CB.*, MNAME FROM CBBOARD CB, MEMBER M WHERE CB.MID=M.MID AND CBNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mrno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String mid = rs.getString("mid");
				String aid = rs.getString("aid");
				String mrtitle = rs.getString("mrtitle");
				String mrcontent = rs.getString("mrcontent");
				Timestamp mrrdate = rs.getTimestamp("mrrdate");
				int mrhit = rs.getInt("mrhit");
				int mrgroup = rs.getInt("mrgroup");
				int mrstep = rs.getInt("mrstep");
				int mrindent = rs.getInt("mrindent");
				String mrip = rs.getString("mrip");
				dto = new MedicalDto(mrno, mid, aid, mrtitle, mrcontent, mrrdate, mrhit, mrgroup, mrstep, mrindent,
						mrip);
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

	// (7) 글 수정하기(MRNO, MRtitle, MRcontent, MRrdate(SYSDATE), MRip 수정)
	public int modifyMedical(MedicalDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MRBOARD SET" + "        MRTITLE = ?," + "        MRCONTENT =?,"
				+ "        MRRDATE = SYSDATE," + "        MRIP = ?" + "    WHERE MRNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMrtitle());
			pstmt.setString(2, dto.getMrcontent());
			pstmt.setString(3, dto.getMrip());
			pstmt.setInt(4, dto.getMrno());
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글수정 성공" : "글번호(fid) 오류");
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

	// (8) 글 삭제하기 (MRNO로)
	public int deleteMedical(int mrno) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM MRBOARD WHERE MRNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mrno);
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글삭제 성공" : "글번호(mrno) 오류");
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

	// (9) 답변글 쓰기 전 단계 (원글의 MRgroup과 같고, 원글의 MRstep 보다 크면 MRstep을 하나 증가)
	private void preReplyStep(int mrgroup, int mrstep) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MRBOARD" + " SET MRSTEP = MRSTEP + 1" + "WHERE MRGROUP = ? AND MRSTEP > ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mrgroup);
			pstmt.setInt(2, mrstep);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " preReplyStep에서 오류");
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

	// (10) 답변글 쓰기
	public int reply(MedicalDto dto) {
		int result = FAIL;
		preReplyStep(dto.getMrgroup(), dto.getMrstep());
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MRBOARD (MRNO, MID, AID, MRTITLE, MRCONTENT, MRGROUP, MRSTEP, MRINDENT, MRIP)"
				+ "VALUES (MRBOARD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getAid());
			pstmt.setString(3, dto.getMrtitle());
			pstmt.setString(4, dto.getMrcontent());
			pstmt.setInt(5, dto.getMrgroup());
			pstmt.setInt(6, dto.getMrstep() + 1);
			pstmt.setInt(7, dto.getMrindent() + 1);
			pstmt.setString(8, dto.getMrip());
			pstmt.executeUpdate();
			result = SUCCESS;
			System.out.println("답변글쓰기 성공");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " 답변글쓰기 실패 ");
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

	// 회원탈퇴시 탈퇴하는 회원 (mID)이 쓴 글 모두 삭제하기
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
