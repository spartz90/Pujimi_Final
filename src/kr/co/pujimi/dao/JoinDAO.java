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

import com.mysql.jdbc.Statement;

import kr.co.pujimi.dto.ResTO;
import kr.co.pujimi.dto.UserTO;

public class JoinDAO {

	private DataSource dataSource = null;
	
	public JoinDAO() {
		// DB 커넥션 부분은 생성자로 뽑아낸다
		try {

			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mysql");

		} catch (NamingException e) {
			System.out.println("에러 : " + e.getMessage());
		}
	}
	
	public void join(){
		
	}
	
	public int joinOk_user(UserTO userTo){
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 회원가입 성공여부를 위한 check 설정
		int check = 1;

		try {
			conn = this.dataSource.getConnection();
			// (seq, email, password, nickname, gender, age, admin, point, revenue);
			// admin = 0 -> user, 1 -> res_manager, 2 -> administartor; 
			String sql = "insert into user values (0, ?, ?, ?, ?, ?, ?, 0, 0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userTo.getUser_email());
			pstmt.setString(2, userTo.getUser_password());
			pstmt.setString(3, userTo.getUser_nickname());
			pstmt.setInt(4, userTo.getUser_gender());
			pstmt.setString(5, userTo.getUser_age());
			pstmt.setInt(6, userTo.getUser_admin());

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
	
	public int joinOk_mgr(UserTO userTo, ResTO resDto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		// 회원가입 성공여부를 위한 check 설정
		int check = 1;
		int user_seq = 0;
		
		try {
			conn = this.dataSource.getConnection();
			// (seq, email, password, nickname, gender, age, admin, point, revenue);
			// admin = 0 -> user, 1 -> res_manager, 2 -> administartor; 
			String sql = "insert into user values (0, ?, ?, ?, ?, ?, ?, 0, 0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userTo.getUser_email());
			pstmt.setString(2, userTo.getUser_password());
			pstmt.setString(3, userTo.getUser_nickname());
			pstmt.setInt(4, userTo.getUser_gender());
			pstmt.setString(5, userTo.getUser_age());
			pstmt.setInt(6, userTo.getUser_admin());
			
			// return int 값은 DML이 수행된 후의 정상실행은 1 false는 0
			int result = pstmt.executeUpdate();
			pstmt.close();
			sql = "select user_seq from user where user_email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userTo.getUser_email());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				user_seq = Integer.parseInt(rs.getString("user_seq"));
			}

			ResDAO resDao = new ResDAO();
			int check_mgr = resDao.writeOk(resDto, user_seq);
			
			if (result == 1 && check_mgr == 0) {
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
	

	public void login(){
		
	}
	
	public int loginCheck(String id, String password, UserTO userTo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String db_Password = "";
		int check = -1;

		try {

			conn = this.dataSource.getConnection();
			String sql = "select user_seq, user_password, user_nickname, user_admin from user where user_email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				userTo.setUser_seq(rs.getInt("user_seq"));
				userTo.setUser_nickname(rs.getString("user_nickname"));
				userTo.setUser_admin(Integer.parseInt(rs.getString("user_admin")));
				db_Password = rs.getString("user_password");		
				if(db_Password.equals(password)){
					check = 1; // 비밀번호 인증성공
				}else{
					check = 0; // 비밀번호 인증실패					
				}
			}else{
				check = -1; // 해당 아이디 없음
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
		return check;
	}
	
public ArrayList<UserTO> boardList() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<UserTO> result = new ArrayList<>();
		
		try{

			conn = this.dataSource.getConnection();
			
			
			String sql = "select user_seq, user_email, user_nickname, user_gender, user_age, user_admin from user order by user_seq";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				UserTO userTo = new UserTO();
				
				userTo.setUser_seq(Integer.parseInt(rs.getString("user_seq")));
				userTo.setUser_email(rs.getString("user_email"));
				userTo.setUser_nickname(rs.getString("user_nickname"));
				userTo.setUser_gender(Integer.parseInt(rs.getString("user_gender")));
				userTo.setUser_age(rs.getString("user_age"));
				userTo.setUser_admin(Integer.parseInt(rs.getString("user_admin")));

				result.add(userTo);
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
		return result;
	}

public UserTO userModify(UserTO userTo) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		conn = this.dataSource.getConnection();				
				
		String sql = "select user_email, user_nickname, user_password, user_gender, user_age from user where user_seq = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, userTo.getUser_seq());
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			userTo.setUser_email(rs.getString("user_email"));
			userTo.setUser_nickname(rs.getString("user_nickname"));
			userTo.setUser_password(rs.getString("user_password"));
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
	//글삭제 성공여부를 위한 flag 설정
	int flag = 2;

	try {

		conn = this.dataSource.getConnection();
		String sql = "update user set user_nickname = ?, user_gender = ?, user_age = ? where user_seq = ? and user_password = ?";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, userTo.getUser_nickname());
		pstmt.setInt(2, userTo.getUser_gender());
		pstmt.setString(3, userTo.getUser_age());
		pstmt.setInt(4, userTo.getUser_seq());
		pstmt.setString(5, userTo.getUser_password());

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
