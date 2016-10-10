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
			// (seq, email, password, nickname, gender, age, admin, point, revenue);
			// admin = 0 -> user, 1 -> res_manager, 2 -> administartor; 
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
}
