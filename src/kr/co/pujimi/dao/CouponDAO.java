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

import kr.co.pujimi.dto.CouponTO;
import kr.co.pujimi.dto.ResTO;

public class CouponDAO {

	private DataSource dataSource = null;

	public CouponDAO() {
		// DB 커넥션 부분은 생성자로 뽑아낸다
		try {

			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mysql");

		} catch (NamingException e) {
			System.out.println("에러 : " + e.getMessage());
		}
	}

	public void coupon() {

	}

	public CouponTO couponBuy(CouponTO cTo){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dataSource.getConnection();

			String sql = "SELECT r.res_seq, r.res_name, r.res_price, u.user_point FROM restaurant r, user u WHERE r.res_seq = ? AND u.user_seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cTo.getRes_seq());
			pstmt.setInt(2, cTo.getUser_seq());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cTo.setRes_seq(rs.getInt("r.res_seq"));
				cTo.setRes_name(rs.getString("r.res_name"));
				cTo.setRes_price(rs.getInt("r.res_price"));
				cTo.setUser_point(rs.getInt("u.user_point"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return cTo;
	}
	
	public int couponBuyOk(CouponTO cTo, String cp_serial){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 0;
		try {
			conn = this.dataSource.getConnection();

			String sql = "INSERT INTO coupon VALUES(0, ?, now(), null,date_add(now(),INTERVAL 1 year), ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cp_serial);
			pstmt.setInt(2, cTo.getUser_seq());
			pstmt.setInt(3, cTo.getRes_seq());
			
			int result = pstmt.executeUpdate();
			if (result == 1) {
				flag = 1; // 정상
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return flag;
	}
	
public ArrayList<CouponTO> myCoupon(int user_seq){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<CouponTO> result = new ArrayList<>();
		
		try {
			conn = this.dataSource.getConnection();

			String sql = "SELECT c.cp_serial, r.res_name FROM coupon c, restaurant r WHERE c.user_seq = ? AND c.res_seq = r.res_seq AND c.cp_udate IS NULL";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_seq);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				CouponTO cTo = new CouponTO();
				cTo.setCp_serial((rs.getString("c.cp_serial")));
				cTo.setRes_name(rs.getString("r.res_name"));
				
				result.add(cTo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
