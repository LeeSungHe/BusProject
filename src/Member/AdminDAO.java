package Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBConnect.DBConnect;

public class AdminDAO {

	private AdminDAO() {
		
	}
	public static AdminDAO instance = new AdminDAO();
	public static AdminDAO getIntance() {
		return instance;
	}
	
	// 사용자 인증을 위한 메소드 : -1:아이디 존재 X
	// 0:아이디 존재하지만 비밀번호 불일치
	// 1:아이디와 비밀번호 모두 일치
	// login.jsp -> workerCheck.jsp
	
	// 아이디를 검색 조건으로 주어서 비밀 번호를 얻어온다.	
	public int workerCheck(String m_id, String m_pw) {
		String sql = "select m_pw from busMeber where m_id=?";
		int result = -1;
		// 디비와 연동
		Connection conn = null;
		// 쿼리문(select)을 수행하기 위한 문장 객체
		PreparedStatement pstmt = null;
		// 결과값을 저장할 ResultSet
		ResultSet rs = null;			
		
		try {
			conn = DBConnect.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 전달인자로 준 아이디와 일치하는 행이 존재
				result = 0; // 등록된 관리자...
				String dbPwd = rs.getString(1); // 디비 저장된 비밀번호
				// 디비의 비밀번호와 입력한 비밀번호 일치 여부
				if (dbPwd.equals(m_pw)) {
					result = 1; // 비밀번호 마저도 일치
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnect.close(conn, pstmt, rs);
		}
		return result;
	}
	
}
