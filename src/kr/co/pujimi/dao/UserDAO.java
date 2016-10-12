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

import kr.co.pujimi.dto.ResTO;
import kr.co.pujimi.dto.UserTO;

public class UserDAO {

	private DataSource dataSource = null;

	public UserDAO() {
		// DB 커넥션 부분은 생성자로 뽑아낸다
		try {

			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mysql");

		} catch (NamingException e) {
			System.out.println("에러 : " + e.getMessage());
		}
	}

	public UserTO userModify(UserTO userTo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		try {
			conn = this.dataSource.getConnection();				
					
			String sql = "select user_seq, user_email, user_password, user_nickname, user_gender, user_age from user where user_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userTo.getUser_seq());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				userTo.setUser_seq(rs.getInt("user_seq"));
				userTo.setUser_password(rs.getString("user_password"));
				userTo.setUser_email(rs.getString("user_email"));
				userTo.setUser_nickname(rs.getString("user_nickname"));
				userTo.setUser_gender(rs.getInt("user_gender"));
				userTo.setUser_age(rs.getString("user_age"));
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
		return userTo;
	}

	public int userModifyOk(UserTO userTo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		//글 수정 성공여부를 위한 flag 설정
		int flag = 2;

		try {

			conn = this.dataSource.getConnection();
			// user_nickname, user_gender, user_age
			String sql = "update user set user_email = ?, user_password = ?, user_nickname = ?, user_gender = ?, user_age = ? where user_seq = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userTo.getUser_email());
			pstmt.setString(2, userTo.getUser_password());
			pstmt.setString(3, userTo.getUser_nickname());
			pstmt.setInt(4, userTo.getUser_gender());
			pstmt.setString(5, userTo.getUser_age());
			pstmt.setInt(6,  userTo.getUser_seq());


			//return int 값은 DML이 수행된 후의 정상실행은 1 false는 0
			int result = pstmt.executeUpdate();
			if (result == 0) {
				flag = 1;
				// 비밀번호 오류
			} else if (result == 1) {
				flag = 0;
				// 정상
			}

		}catch (SQLException e) {
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
		return flag;
	}
	
	public UserTO userDelete(UserTO userTo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		try {
			conn = this.dataSource.getConnection();				
					
			String sql = "select user_seq, user_email, user_password, user_nickname, user_gender, user_age from user where user_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userTo.getUser_seq());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				userTo.setUser_seq(rs.getInt("user_seq"));
				userTo.setUser_password(rs.getString("user_password"));
				userTo.setUser_email(rs.getString("user_email"));
				userTo.setUser_nickname(rs.getString("user_nickname"));
				userTo.setUser_gender(rs.getInt("user_gender"));
				userTo.setUser_age(rs.getString("user_age"));
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
		return userTo;
	}

	public int userDeleteOk(UserTO userTo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		//글삭제 성공여부를 위한 flag 설정
		int flag = 2;

		try {

			conn = this.dataSource.getConnection();
			String sql = "delete from user where user_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userTo.getUser_seq());

			//return int 값은 DML이 수행된 후의 정상실행은 1 false는 0
			int result = pstmt.executeUpdate();
			if (result == 0) {
				flag = 1;
				// 비밀번호 오류
			} else if (result == 1) {
				flag = 0;
				// 정상
			}

		}catch (SQLException e) {
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
		return flag;
	}
}
