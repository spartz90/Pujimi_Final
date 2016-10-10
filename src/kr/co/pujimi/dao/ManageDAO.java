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

public class ManageDAO {

	private DataSource dataSource = null;
	
	public ManageDAO() {
		// DB 커넥션 부분은 생성자로 뽑아낸다
		try {

			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mysql");

		} catch (NamingException e) {
			System.out.println("에러 : " + e.getMessage());
		}
	}
	
public ArrayList<UserTO> UserList() {
		
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

	public ArrayList<ResTO> ResList() {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	ArrayList<ResTO> result = new ArrayList<>();

	try {

		conn = this.dataSource.getConnection();

		String sql = "SELECT u.user_seq, u.user_email, r.res_seq, r.res_name, r.res_addr, r.res_phone, r.res_octime, r.res_content, r.res_point, "
				+ "r.res_revenue FROM user u, restaurant r WHERE u.user_seq = r.user_seq ORDER BY r.res_seq";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while (rs.next()) {

			ResTO rdto = new ResTO();
			
			rdto.setUser_seq(Integer.parseInt(rs.getString("user_seq")));
			rdto.setUser_email(rs.getString("user_email"));
			rdto.setRes_seq(Integer.parseInt(rs.getString("res_seq")));
			rdto.setRes_name(rs.getString("res_name"));
			rdto.setRes_addr(rs.getString("res_addr"));
			rdto.setRes_phone(rs.getString("res_phone"));
			rdto.setRes_octime(rs.getString("res_octime"));
			rdto.setRes_content(rs.getString("res_content"));
			rdto.setRes_point(Integer.parseInt(rs.getString("res_point")));
			rdto.setRes_revenue(Integer.parseInt(rs.getString("res_revenue")));
			result.add(rdto);
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
}
