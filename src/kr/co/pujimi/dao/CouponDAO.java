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

			String sql = "SELECT r.res_name, r.res_price, u.user_point FROM restaurant r, user u WHERE r.res_seq = ? AND u.user_seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cTo.getRes_seq());
			pstmt.setInt(2, cTo.getUser_seq());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
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
}
