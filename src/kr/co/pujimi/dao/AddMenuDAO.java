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

import kr.co.pujimi.dto.AddMenuDTO;
import kr.co.pujimi.dto.LikeMenuDTO;
import kr.co.pujimi.dto.MenuDTO;
import kr.co.pujimi.dto.PaymentTO;


public class AddMenuDAO {

	private DataSource dataSource = null;
	
	public AddMenuDAO(){
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mysql");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("db 연결 에러 : " + e.getMessage());
		}	
	}
	
	public int doAddMenu(AddMenuDTO addDto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 좋아요 성공여부를 위한 flag 설정
		int flag = 1;
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "insert into add_menu values (?, ?, now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, addDto.getRes_seq());
			pstmt.setString(2, addDto.getMenu_name());
			
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
	
	public ArrayList<AddMenuDTO> addMenuView(int res_seq){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<AddMenuDTO> result = new ArrayList<>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "SELECT add_date, menu_name FROM add_menu where res_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_seq);
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				AddMenuDTO adto = new AddMenuDTO();
	
				adto.setMenu_name(rs.getString("menu_name"));
				adto.setAdd_date(rs.getString("add_date"));
				
				result.add(adto);
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
