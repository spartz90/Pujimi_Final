package kr.co.pujimi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.pujimi.dto.ResTO;

public class LikeDAO {

	private DataSource dataSource = null;
	
	public LikeDAO() {
		// DB 커넥션 부분은 생성자로 뽑아낸다
		try {

			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mysql");

		} catch (NamingException e) {
			System.out.println("에러 : " + e.getMessage());
		}
	}
	
	public void check(){
		
	}
	
	public int checkOk(ResTO resTO){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int check = 0;
		try {
			conn = this.dataSource.getConnection();
			String sql = "select count(*) from like_restaurant where user_seq=? and res_seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resTO.getUser_seq());
			pstmt.setInt(2, resTO.getRes_seq());
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				check = rs.getInt("count(*)"); //check가 0이면 좋아요한적이 없다 / 1이면 이미 좋아요를 했다.
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

	public int doLike(ResTO resTO){
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 좋아요 성공여부를 위한 flag 설정
		int flag = 1;
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "insert into like_restaurant values (?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resTO.getUser_seq());
			pstmt.setInt(2, resTO.getRes_seq());
			
			int result = pstmt.executeUpdate();
			if (result == 1) {
				// 정상적으로 동작하면 flag = 0;
				flag = 0;
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
		return flag;
	}
	
	public int doNotLike(ResTO resTO){
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 좋아요 성공여부를 위한 flag 설정
		int flag = 1;
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "delete from like_restaurant where user_seq = ? and res_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resTO.getUser_seq());
			pstmt.setInt(2, resTO.getRes_seq());
			
			int result = pstmt.executeUpdate();
			if (result == 1) {
				// 정상적으로 동작하면 flag = 0;
				flag = 0;
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
		return flag;
	}
}
