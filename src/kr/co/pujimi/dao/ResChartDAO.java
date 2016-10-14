package kr.co.pujimi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.pujimi.dto.ResChartDTO;

public class ResChartDAO {
	
	private DataSource dataSource = null;
	
	public ResChartDAO(){
		try {

			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mysql");

		} catch (NamingException e) {
			System.out.println("에러 : " + e.getMessage());
		}
	}
	
	public ResChartDTO viewResChart(int res_seq){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ResChartDTO rcDTO = new ResChartDTO();
		
		try {
			conn = this.dataSource.getConnection();
			System.out.println("db부분" + res_seq);
			String sql = "select res_revenue, res_grade from restaurant where res_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_seq);
			rs = pstmt.executeQuery();
			
			while(rs.next()){

				rcDTO.setRes_grade(rs.getString("res_grade"));
				rcDTO.setRes_revenue(rs.getString("res_revenue"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("에러 : " + e.getMessage());
		}finally{
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
		
		return rcDTO;
	}
	
	
	public ResChartDTO viewInterResChart(int res_seq){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ResChartDTO rcDTO = new ResChartDTO();
		
		try {
			conn = this.dataSource.getConnection();
			System.out.println("db부분" + res_seq);
			String sql = "select cp_udate from coupon where cp_udate > date_sub(now(), interval 7 day) and res_seq = ?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_seq);
			rs = pstmt.executeQuery();
			
			while(rs.next()){

				rcDTO.setCp_udate(rs.getString("cp_udate"));
								
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("에러 : " + e.getMessage());
		}finally{
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
		
		return rcDTO;
	}
	
}
