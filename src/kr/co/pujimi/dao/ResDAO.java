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

public class ResDAO {

	private DataSource dataSource = null;

	public ResDAO() {
		// DB 커넥션 부분은 생성자로 뽑아낸다
		try {

			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/mysql");

		} catch (NamingException e) {
			System.out.println("에러 : " + e.getMessage());
		}
	}

	public void write() {

	}

	public int writeOk(ResTO resdto, int user_seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 회원가입 성공여부를 위한 check 설정
		int check = 1;

		try {
			conn = this.dataSource.getConnection();
			// res_seq, res_name, res_addr, res_phone, res_octime, res_content,
			// res_point, res_revenue, user_seq
			String sql = "insert into restaurant values (0, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resdto.getRes_name());
			pstmt.setString(2, resdto.getRes_addr());
			pstmt.setString(3, resdto.getRes_phone());
			pstmt.setString(4, resdto.getRes_octime());
			pstmt.setString(5, resdto.getRes_content());
			pstmt.setInt(6, 0); // 최초 가게정보 추가시 포인트 0
			pstmt.setInt(7, 0); // 최초 가게정보 추가시 총 매출액 0
			pstmt.setInt(8, user_seq);
			pstmt.setString(9, "noimage.png");

			// return int 값은 DML이 수행된 후의 정상실행은 1 false는 0
			int result = pstmt.executeUpdate();
			if (result == 1) {
				// 회원가입이 정상적으로 등록되면 check = 0;
				check = 0;
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
		return check;
	}
	
	public ResTO resView(ResTO rdto){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "SELECT res_name, res_addr, res_phone, res_octime, res_content, res_photo, res_price, res_grade FROM restaurant WHERE res_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rdto.getRes_seq());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				rdto.setRes_name(rs.getString("res_name"));
				rdto.setRes_addr(rs.getString("res_addr"));
				rdto.setRes_phone(rs.getString("res_phone"));
				rdto.setRes_octime(rs.getString("res_octime"));
				rdto.setRes_content(rs.getString("res_content"));
				rdto.setRes_photo(rs.getString("res_photo"));
				rdto.setRes_price(rs.getInt("res_price"));
				rdto.setRes_grade(rs.getDouble("res_grade"));				
			}
			pstmt.close();
			rs.close();
			
			sql = "SELECT COUNT( cp_seq ) AS res_sells FROM coupon WHERE res_seq = ?";
						
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rdto.getRes_seq());			
			rs = pstmt.executeQuery();
			
			
			if (rs.next()) {
				rdto.setRes_sells(rs.getInt("res_sells"));				
			}
			
			pstmt.close();
			rs.close();
			
			sql = "SELECT COUNT( user_seq ) AS res_likes FROM like_restaurant WHERE res_seq = ?";					  
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rdto.getRes_seq());				
			rs = pstmt.executeQuery();
			
				
			if (rs.next()) {
				rdto.setRes_likes(rs.getInt("res_likes"));
			}
			
			pstmt.close();
			rs.close();
			
			
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
		
		return rdto;
		
	}
	
/*
	public ArrayList<ReplyDTO> replyList(int res_seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<ReplyDTO> result = new ArrayList<>();

		try {
			conn = this.dataSource.getConnection();

			String sql = "SELECT u.user_nickname, r.reply_content, r.reply_photo, r.reply_date FROM user u, reply r WHERE r.user_seq = u.user_seq AND res_seq = ? ORDER BY r.reply_date DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_seq);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				ReplyDTO rdto = new ReplyDTO();

				rdto.setUser_nickname(rs.getString("user_nickname"));
				rdto.setReply_content(rs.getString("reply_content"));
				rdto.setReply_date(rs.getString("reply_date"));
				result.add(rdto);
			}

		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
		return result;
	}
*/
	
	
	public ArrayList<ResTO> viewList() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ResTO> result = new ArrayList<>();
		
		try{

			conn = this.dataSource.getConnection();
			
			// DB에서 꺼내올때 날짜 포맷 지정
			String sql = "select res_seq, res_name, res_addr, res_phone, "
					+ "res_octime, res_content, res_photo from restaurant order by res_revenue desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				ResTO rdto = new ResTO();
				
				rdto.setRes_seq(rs.getInt("res_seq"));
				rdto.setRes_name(rs.getString("res_name"));
				rdto.setRes_addr(rs.getString("res_addr"));
				rdto.setRes_phone(rs.getString("res_phone"));
				rdto.setRes_octime(rs.getString("res_octime"));
				rdto.setRes_content(rs.getString("res_content"));
				rdto.setRes_photo(rs.getString("res_photo"));
		
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
	
	public ArrayList<ResTO> interList(ResTO resTo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ResTO> result = new ArrayList<>();
		
		try{
			
			conn = this.dataSource.getConnection();
			
			// DB에서 꺼내올때 날짜 포맷 지정
			String sql = "select r.res_seq, r.res_name, r.res_addr, r.res_phone, r.res_octime, r.res_content, r.res_photo from restaurant r "
					+ "where r.res_seq = ANY(select res_seq from like_restaurant where user_seq = ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resTo.getUser_seq());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				ResTO rdto = new ResTO();
				
				rdto.setRes_seq(rs.getInt("r.res_seq"));
				rdto.setRes_name(rs.getString("r.res_name"));
				rdto.setRes_addr(rs.getString("r.res_addr"));
				rdto.setRes_phone(rs.getString("r.res_phone"));
				rdto.setRes_octime(rs.getString("r.res_octime"));
				rdto.setRes_content(rs.getString("r.res_content"));
				rdto.setRes_photo(rs.getString("r.res_photo"));
				
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
	
	
	public ResTO ResModify(ResTO rdto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		try {
			conn = this.dataSource.getConnection();				
					
			String sql = "select user_seq, res_seq, res_name, res_addr, res_phone, res_octime, res_content, res_photo from restaurant where user_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rdto.getUser_seq());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				rdto.setUser_seq(rs.getInt("user_seq"));
				rdto.setRes_seq(rs.getInt("res_seq"));
				rdto.setRes_name(rs.getString("res_name"));
				rdto.setRes_addr(rs.getString("res_addr"));
				rdto.setRes_phone(rs.getString("res_phone"));
				rdto.setRes_octime(rs.getString("res_octime"));
				rdto.setRes_content(rs.getString("res_content"));
				rdto.setRes_photo(rs.getString("res_photo"));
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
		return rdto;
	}

	public int resModifyOk(ResTO rdto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		//글삭제 성공여부를 위한 flag 설정
		int flag = 2;

		try {

			conn = this.dataSource.getConnection();
			String sql = "update restaurant set res_name = ?, res_addr = ?, res_phone = ?, res_octime = ?, res_content = ?, res_photo = ? where user_seq = ? and res_seq = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, rdto.getRes_name());
			pstmt.setString(2, rdto.getRes_addr());
			pstmt.setString(3, rdto.getRes_phone());
			pstmt.setString(4, rdto.getRes_octime());
			pstmt.setString(5, rdto.getRes_content());
			pstmt.setString(6, rdto.getRes_photo());
			pstmt.setInt(7, rdto.getUser_seq());
			pstmt.setInt(8, rdto.getRes_seq());

			//return int 값은 DML이 수행된 후의 정상실행은 1 false는 0
			int result = pstmt.executeUpdate();
			if (result == 0) {
				flag = 1;
				// 비밀번호 오류
			} else if (result == 1) {
				flag = 0;
				// 정상
			}

		}catch (SQLException e) {
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
