package kr.co.pujimi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	public int writeOk(ReplyTO reto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 회원가입 성공여부를 위한 check 설정
		int check = 1;
		int res_seq = -1;

		try {
			
			conn = this.dataSource.getConnection();
			// re_seq, re_content, re_photo, re_date, re_grade, user_seq, res_seq
			String sql = "INSERT INTO reply VALUES (0, ?, ?, NOW(), ?, ?, ?)";
			res_seq = reto.getRes_seq();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reto.getRe_content());
			pstmt.setString(2, reto.getRe_photo());
			pstmt.setDouble(3, reto.getRe_grade());
			pstmt.setInt(4, reto.getUser_seq());
			pstmt.setInt(5, reto.getRes_seq());			

			// return int 값은 DML이 수행된 후의 정상실행은 1 false는 0
			int result = pstmt.executeUpdate();
			if (result == 1) {
				// 회원가입이 정상적으로 등록되면 check = 0;
				check = 0;
				// 비정상이면 flag = 1;
			}
			pstmt.close();		
			
			sql = "UPDATE restaurant SET res_grade = (SELECT AVG(re_grade) FROM reply WHERE res_seq = ?) WHERE res_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_seq);
			pstmt.setInt(2, res_seq);
			
			int update = pstmt.executeUpdate();
			
			if(update == 1){
				System.out.println("업데이트 성공");
			} else {
				System.out.println("업데이트 실패");
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
	
	public ReplyTO modifyReply(ReplyTO reto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "SELECT re_seq, re_content, re_photo, re_date, re_grade, user_seq, res_seq FROM reply WHERE re_seq = ?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, reto.getRe_seq());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				reto.setRe_content(rs.getString("re_content"));
				reto.setRe_photo(rs.getString("re_photo"));
				reto.setRe_date(rs.getString("re_date"));
				reto.setRe_grade(rs.getDouble("re_grade"));
				reto.setUser_seq(rs.getInt("user_seq"));
				reto.setRes_seq(rs.getInt("res_seq"));
			}
		} catch (SQLException e) {
			System.out.println("에러 : " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
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
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("에러 : " + e.getMessage());
				}
			}
		}		
		
		return reto;
	}
	
	public int modifyOkReply(ReplyTO reto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int update = 0;
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "UPDATE reply SET re_content = ?, re_photo = ?, re_date = NOW(), re_grade = ? WHERE re_seq = ?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, reto.getRe_content());
			pstmt.setString(2, reto.getRe_photo());
			pstmt.setDouble(3, reto.getRe_grade());
			pstmt.setInt(4, reto.getRe_seq());
			
			update = pstmt.executeUpdate();
			
			if(update == 1){
				System.out.println("업데이트 성공");
			} else {
				System.out.println("업데이트 실패");
			}
			
		} catch (SQLException e) {
			System.out.println("에러 : " + e.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("에러 : " + e.getMessage());
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("에러 : " + e.getMessage());
				}
			}
		}		
		
		return update;
	}
	
	public ArrayList<ReplyTO> replyList(int res_seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<ReplyTO> result = new ArrayList<>();
		

		try {
			conn = this.dataSource.getConnection();

			String sql = "SELECT u.user_nickname, r.re_seq, r.re_content, r.re_photo, r.re_date, r.re_grade FROM user u, reply r WHERE res_seq = ? AND r.user_seq = u.user_seq ORDER BY r.re_date DESC";
						
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_seq);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReplyTO rdto = new ReplyTO();
				//rdto.setUser_seq(Integer.parseInt(rs.getString("user_seq")));
				rdto.setRe_seq(rs.getInt("re_seq"));
				rdto.setUser_nickname(rs.getString("user_nickname"));
				rdto.setRe_content(rs.getString("re_content"));
				rdto.setRe_date(rs.getString("re_date"));
				rdto.setRe_photo(rs.getString("re_photo"));
				rdto.setRe_grade(rs.getDouble("re_grade"));
				result.add(rdto);
			}

		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
		return result;
	}
	
}
