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

import kr.co.pujimi.dto.PaymentTO;
import kr.co.pujimi.dto.ResTO;
import kr.co.pujimi.dto.UserTO;

public class PaymentDAO {

	private DataSource dataSource = null;
	
	public PaymentDAO() {
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
	
	public int buyPoint(PaymentTO payTo){
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 좋아요 성공여부를 위한 flag 설정
		int flag = 1;
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "insert into payment values (0, ?, ?, now(), ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, payTo.getPay_price());
			pstmt.setString(2, payTo.getPay_method());
			pstmt.setInt(3, payTo.getUser_seq());
			
			int result = pstmt.executeUpdate();
			
			PaymentDAO payDao = new PaymentDAO();
			int check = payDao.userPointUpdate(payTo.getUser_seq(), payTo.getPay_price());
			
			if (result == 1 && check == 0) {
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

	private int userPointUpdate(int user_seq, int user_point) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 1;
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "update user set user_point=(user_point + ?), user_revenue=(user_revenue + ?) where user_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_point);
			pstmt.setInt(2, user_point);
			pstmt.setInt(3, user_seq);
			
			int check = pstmt.executeUpdate();
			
			
			if (check == 1) {
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
	
	public ArrayList<PaymentTO> payView(int user_seq){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<PaymentTO> result = new ArrayList<>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select pay_date, pay_price, pay_method from payment where user_seq = ? order by pay_date desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_seq);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				PaymentTO payTo = new PaymentTO();
				
				payTo.setPay_date(rs.getString("pay_date"));
				payTo.setPay_price(rs.getInt("pay_price"));
				payTo.setPay_method(rs.getString("pay_method"));
				
				result.add(payTo);
				
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
