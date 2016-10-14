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

import kr.co.pujimi.dto.RatingTO;
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
			String sql = "insert into restaurant values (0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resdto.getRes_name());
			pstmt.setString(2, resdto.getRes_addr());
			pstmt.setString(3, resdto.getRes_phone());
			pstmt.setString(4, resdto.getRes_octime());
			pstmt.setString(5, resdto.getRes_content());
			pstmt.setInt(6, user_seq);
			pstmt.setString(7, "noimage.png");
			pstmt.setInt(8, 0); // 최초 가게정보 추가시 포인트 0
			pstmt.setInt(9, 0); // 최초 가게정보 추가시 가격정보 0
			pstmt.setInt(10, 0); // 최초 가게정보 추가시 총 매출액 0
			pstmt.setDouble(11, 0.0); // 최초 가게정보 추가시 평점 0
			pstmt.setInt(12, 0); // 최초 가게정보 추가시 추천제휴점 0;
			pstmt.setString(13, "(37.49794199999999, 127.027621)");

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
	
	public ResTO resView(int user_seq){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int res_seq = 0;
		ResTO rdto = new ResTO();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "SELECT res_seq, res_name, res_addr, res_phone, res_octime, res_content, res_photo, res_price, res_grade FROM restaurant WHERE user_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_seq);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				res_seq = rs.getInt("res_seq");
				rdto.setRes_seq(res_seq);
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
			pstmt.setInt(1, res_seq);			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				rdto.setRes_sells(rs.getInt("res_sells"));				
			}
			
			pstmt.close();
			rs.close();
			
			sql = "SELECT COUNT( user_seq ) AS res_likes FROM like_restaurant WHERE res_seq = ?";					  
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_seq);				
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
	
	
	public ArrayList<ResTO> viewList() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ResTO> result = new ArrayList<>();
		ResDAO resDao = new ResDAO();
		
		try{

			conn = this.dataSource.getConnection();
			
			// DB에서 꺼내올때 날짜 포맷 지정
			String sql = "select res_seq, res_name, res_addr, res_phone, "
					+ "res_octime, res_content, res_photo, res_price, res_grade from restaurant order by res_revenue desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				ResTO rdto = new ResTO();
				
				rdto.setRes_seq(rs.getInt("res_seq"));
				int res_seq = rs.getInt("res_seq");
				rdto.setRes_name(rs.getString("res_name"));
				rdto.setRes_addr(rs.getString("res_addr"));
				rdto.setRes_phone(rs.getString("res_phone"));
				rdto.setRes_octime(rs.getString("res_octime"));
				rdto.setRes_content(rs.getString("res_content"));
				rdto.setRes_photo(rs.getString("res_photo"));
				rdto.setRes_price(Integer.parseInt(rs.getString("res_price")));
				rdto.setRes_grade(rs.getDouble("res_grade"));
				rdto.setRes_sells(resDao.sellsCount(res_seq));
				rdto.setRes_likes(resDao.likeCount(res_seq));
		
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
	
	public ArrayList<ResTO> viewRecomList() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ResTO> result = new ArrayList<>();
		ResDAO resDao = new ResDAO();
		
		try{
			
			conn = this.dataSource.getConnection();
			
			String sql = "select res_seq, res_name, res_addr, res_phone, res_octime, res_content, res_photo, res_price, res_grade from restaurant where res_recom = 1 order by res_revenue desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				ResTO resTo = new ResTO();
				
				resTo.setRes_seq(rs.getInt("res_seq"));
				int res_seq = rs.getInt("res_seq");
				resTo.setRes_name(rs.getString("res_name"));
				resTo.setRes_addr(rs.getString("res_addr"));
				resTo.setRes_phone(rs.getString("res_phone"));
				resTo.setRes_octime(rs.getString("res_octime"));
				resTo.setRes_content(rs.getString("res_content"));
				resTo.setRes_photo(rs.getString("res_photo"));
				resTo.setRes_price(rs.getInt("res_price"));
				resTo.setRes_grade(rs.getDouble("res_grade"));
				resTo.setRes_sells(resDao.sellsCount(res_seq));
				resTo.setRes_likes(resDao.likeCount(res_seq));

				result.add(resTo);
			}
			pstmt.close();
			rs.close();
			
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
	
	public int sellsCount(int res_seq) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int sellsCount = 0;
		try{
			
			conn = this.dataSource.getConnection();
			
			String sql = "SELECT COUNT( cp_seq ) AS res_sells FROM coupon WHERE res_seq = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_seq);			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				sellsCount = rs.getInt("res_sells");				
			}
			
			pstmt.close();
			rs.close();
			
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
		return sellsCount;
	}
	
	public int likeCount(int res_seq) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int likeCount = 0;
		
		try{
			
			conn = this.dataSource.getConnection();
			
			String sql = "SELECT COUNT( user_seq ) AS res_likes FROM like_restaurant WHERE res_seq = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_seq);			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				likeCount = rs.getInt("res_likes");				
			}
			
			pstmt.close();
			rs.close();
			
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
		return likeCount;
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
	
	
	public ResTO resModify(ResTO rdto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		try {
			conn = this.dataSource.getConnection();				
			String sql = "select user_seq, res_seq, res_name, res_addr, res_phone, res_octime, res_content, res_photo, res_latlng from restaurant where user_seq = ?";
			pstmt = conn.prepareStatement(sql);
			System.out.println(rdto.getUser_seq());
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
				rdto.setRes_latlng(rs.getString("res_latlng"));
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
	
	public ResTO adminResModify(ResTO rdto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dataSource.getConnection();				
			String sql = "select user_seq, res_seq, res_name, res_addr, res_phone, res_octime, res_content, res_photo, res_latlng from restaurant where res_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rdto.getRes_seq());
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
				rdto.setRes_latlng(rs.getString("res_latlng"));
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
		//글 수정 성공여부를 위한 flag 설정
		int flag = 2;

		try {

			conn = this.dataSource.getConnection();
			String sql = "update restaurant set res_name = ?, res_addr = ?, res_phone = ?, res_octime = ?, res_content = ?, res_photo = ?, res_latlng = ? where res_seq = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, rdto.getRes_name());
			pstmt.setString(2, rdto.getRes_addr());
			pstmt.setString(3, rdto.getRes_phone());
			pstmt.setString(4, rdto.getRes_octime());
			pstmt.setString(5, rdto.getRes_content());
			pstmt.setString(6, rdto.getRes_photo());
			pstmt.setString(7, rdto.getRes_latlng());
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
	
	public ResTO resDelete(ResTO rdto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		try {
			conn = this.dataSource.getConnection();				
					
			String sql = "select user_seq, res_seq, res_name, res_addr, res_phone from restaurant where res_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rdto.getRes_seq());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				rdto.setUser_seq(rs.getInt("user_seq"));
				rdto.setRes_seq(rs.getInt("res_seq"));
				rdto.setRes_name(rs.getString("res_name"));
				rdto.setRes_addr(rs.getString("res_addr"));
				rdto.setRes_phone(rs.getString("res_phone"));
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

	public int resDeleteOk(ResTO rdto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		//글삭제 성공여부를 위한 flag 설정
		int flag = 2;

		try {

			conn = this.dataSource.getConnection();
			String sql = "delete from restaurant where res_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rdto.getRes_seq());

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
	
	public RatingTO ratView(int res_seq){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		RatingTO rato = new RatingTO();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "SELECT COUNT(IF(re_grade=1,re_grade,NULL)) AS one, COUNT(IF(re_grade=2,re_grade,NULL)) AS two, COUNT(IF(re_grade=3,re_grade,NULL)) AS three, COUNT(IF(re_grade=4,re_grade,NULL)) AS four, COUNT(IF(re_grade=5,re_grade,NULL)) AS five FROM reply WHERE res_seq = ?";
			//SELECT COUNT(IF(re_grade=1,re_grade,NULL)) AS one, COUNT(IF(re_grade=2,re_grade,NULL)) AS two, COUNT(IF(re_grade=3,re_grade,NULL)) AS three, COUNT(IF(re_grade=4,re_grade,NULL)) AS four, COUNT(IF(re_grade=5,re_grade,NULL)) AS five FROM reply WHERE res_seq = 1
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_seq);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				rato.setOne(rs.getDouble("one"));
				rato.setTwo(rs.getDouble("two"));
				rato.setThree(rs.getDouble("three"));
				rato.setFour(rs.getDouble("four"));
				rato.setFive(rs.getDouble("five"));
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
		
		return rato;
		
	}
	public int getResSeq(int user_seq){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int res_seq = 0;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select res_seq from restaurant where user_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_seq);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				res_seq = rs.getInt("res_seq");
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
		
		return res_seq;
		
	}
}
