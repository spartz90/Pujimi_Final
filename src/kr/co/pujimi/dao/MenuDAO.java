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

import kr.co.pujimi.dto.MenuDTO;


public class MenuDAO {

	private DataSource dataSource = null;
	
	public MenuDAO(){
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mysql");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("db 연결 에러 : " + e.getMessage());
		}	
	}
	
	public ArrayList<MenuDTO> menuView(){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<MenuDTO> result = new ArrayList<>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "SELECT menu_seq, menu_group, menu_name FROM menu";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				MenuDTO mdto = new MenuDTO();
				
				mdto.setMenu_seq(rs.getString("menu_seq"));
				mdto.setMenu_group(rs.getString("menu_group"));
				mdto.setMenu_name(rs.getString("menu_name"));
				result.add(mdto);
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
	
	public ArrayList<MenuDTO> menuViewtoday(int res_seq){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<MenuDTO> result = new ArrayList<>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "SELECT a.menu_name, a.add_date, m.menu_serving, m.menu_kcal, m.menu_na FROM add_menu a, menu m WHERE res_seq = ? AND m.menu_name = a.menu_name AND a.add_date > DATE_SUB( NOW( ) , INTERVAL 1 DAY )";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_seq);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				MenuDTO mdto = new MenuDTO();				
				mdto.setMenu_name(rs.getString("menu_name"));
				mdto.setMenu_serving(rs.getInt("menu_serving"));
				mdto.setMenu_na(rs.getDouble("menu_na"));
				mdto.setMenu_kcal(rs.getInt("menu_kcal"));
				mdto.setMenu_date(rs.getString("add_date"));
				result.add(mdto);
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
