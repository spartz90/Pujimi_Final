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

import kr.co.pujimi.dto.LikeMenuDTO;
import kr.co.pujimi.dto.MenuDTO;
import kr.co.pujimi.dto.PaymentTO;


public class LikeMenuDAO {

	private DataSource dataSource = null;
	
	public LikeMenuDAO(){
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mysql");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("db 연결 에러 : " + e.getMessage());
		}	
	}
	
	public int doLikeMenu(LikeMenuDTO lmDto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 좋아요 성공여부를 위한 flag 설정
		int flag = 1;
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "insert into like_menu values (?, ?, now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lmDto.getUser_seq());
			pstmt.setString(2, lmDto.getMenu_name());
			
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
	
	public ArrayList<LikeMenuDTO> likeMenuView(int user_seq){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<LikeMenuDTO> result = new ArrayList<>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "SELECT like_date, menu_name FROM like_menu where user_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_seq);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				LikeMenuDTO lmdto = new LikeMenuDTO();
				
				lmdto.setMenu_name(rs.getString("menu_name"));
				lmdto.setLike_date(rs.getString("like_date"));
				
				result.add(lmdto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("에러 : " + e.getMessage());
		}finally {
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
