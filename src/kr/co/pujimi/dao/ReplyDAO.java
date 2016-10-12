package kr.co.pujimi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.pujimi.dto.ReplyTO;

public class ReplyDAO {
	private DataSource dataSource = null;
	
	public void write() {

	}
	
	public ReplyDAO() {
		// DB 커넥션 부분은 생성자로 뽑아낸다
		try {

			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mysql");

		} catch (NamingException e) {
			System.out.println("에러 : " + e.getMessage());
		}
	}
	
	public int writeOk(ReplyTO redto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 회원가입 성공여부를 위한 check 설정
		int check = 1;

		try {
			System.out.println(redto.getRes_grade());
			conn = this.dataSource.getConnection();
			// re_seq, re_content, re_photo, re_date, re_grade, user_seq, res_seq
			String sql = "INSERT INTO reply VALUES (0, ?, ?, NOW(), ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, redto.getRe_content());
			pstmt.setString(2, redto.getRe_photo());
			pstmt.setDouble(3, redto.getRes_grade());
			pstmt.setInt(4, redto.getUser_seq());
			pstmt.setInt(5, redto.getRes_seq());			

			// return int 값은 DML이 수행된 후의 정상실행은 1 false는 0
			int result = pstmt.executeUpdate();
			if (result == 1) {
				// 회원가입이 정상적으로 등록되면 check = 0;
				check = 0;
				// 비정상이면 flag = 1;
			}
		} catch (SQLException e) {
			System.out.println("에러 : " + e.getMessage());
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("에러 : " + e.getMessage());
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("에러 : " + e.getMessage());
				}
			}
		}
		return check;
	}
}
