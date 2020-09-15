package Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBConnect.DBConnect;

public class MemberDAO {

	public MemberDAO() {

	}

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	public int confirmId(String m_id) {
		int result = -1;
		String sql = "select * from busMember where m_id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnect.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
			} else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.close(conn, pstmt, rs);
		}
		return result;

	}

	// 회원정보
	public MemberDTO getMember(String m_id) {
		MemberDTO dto = null;
		String sql = "select * from busMember where m_id=?";

		Connection connn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			connn = DBConnect.getConnection();
			pstmt = connn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new MemberDTO();
				dto.setM_id(rs.getString("m_id"));
				dto.setM_pw(rs.getString("m_pw"));
				dto.setM_img(rs.getString("m_img"));
				dto.setM_email(rs.getString("m_email"));
				dto.setM_phone(rs.getString("m_phone"));
				dto.setM_date(rs.getDate("m_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.close(connn, pstmt, rs);
		}
		return dto;
	}

	// 회원가입
	public int insertMember(MemberDTO dto) {
		int result = 0;
		String sql = "insert into busmember(m_userno,m_id, m_pw,  m_email,m_phone,m_date,m_admin) "
				+ "values(userNo.NEXTVAL,?,?,?,?,sysdate,0)";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnect.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getM_id());
			pstmt.setString(2, dto.getM_pw());
			pstmt.setString(3, dto.getM_email());
			pstmt.setString(4, dto.getM_phone());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.close(conn, pstmt);
		}
		return result;
	}
	/* *
	 * 관리자 모드에서 사용되는 메소드 * *
	 */
	public ArrayList<MemberDTO> listMember(String m_id) {
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		String sql = "select * from busMember where m_id like '%'||?||'%' " +
				"order by m_date desc";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnect.getConnection();
			pstmt = conn.prepareStatement(sql);
			if (m_id == "") {
				pstmt.setString(1, "%");
			} else {
				pstmt.setString(1, m_id);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setM_id(rs.getString("m_id"));
		        dto.setM_pw(rs.getString("m_pw"));
		        dto.setM_img(rs.getString("m_img"));
		        dto.setM_email(rs.getString("m_email"));
		        dto.setM_phone(rs.getString("m_phone"));
		        dto.setM_date(rs.getDate("m_date"));
		        memberList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.close(conn, pstmt, rs);
		}
		return memberList;
	}
	
	//로그인
	public MemberDTO login(String id, String pw) {
	    Connection conn = null; // db접속
        PreparedStatement pstmt = null; // sql 실행
        ResultSet rs = null; // select 결과 처리
        try {
 
        	conn = DBConnect.getConnection();
 
            String sql = "select * from busMember where m_id=? and m_pw=?";
 
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            rs = pstmt.executeQuery(); // rs에 실행결과 리턴
 
           
 
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	DBConnect.close(conn, pstmt, rs);
 
        }
 
        return null;

    }

	

}
