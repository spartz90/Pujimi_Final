package kr.co.pujimi.action.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.ResDAO;
import kr.co.pujimi.dao.UserDAO;
import kr.co.pujimi.dto.ResTO;
import kr.co.pujimi.dto.UserTO;

public class UserManageModifyOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding( "utf-8");
			
			String user_admin = request.getParameter("user_admin");
			String user_seq = request.getParameter("member_seq");
			
			//데이터를 넣기 위한 TO 선언 (transfer Object)
			UserTO userTo = new UserTO();
	
			userTo.setUser_seq(Integer.parseInt(request.getParameter("user_seq")));
			
			userTo.setUser_email(request.getParameter("user_email"));
			userTo.setUser_password(request.getParameter("user_password"));
			userTo.setUser_nickname(request.getParameter("user_nickname"));
			userTo.setUser_password(request.getParameter("user_password"));
			int gender = -1;
			
			if(request.getParameter("genderOption").equals("male")){
				gender = 0;
			}else{
				gender = 1;
			}
			userTo.setUser_gender(gender);
			
			String birth = request.getParameter("user_age");
			birth = birth.replace("/", "");
			userTo.setUser_age(birth);
			
			
			UserDAO userDao = new UserDAO();
			int flag = userDao.userModifyOk(userTo);
			request.setAttribute("flag", flag);
			request.setAttribute("user_admin", user_admin);
			request.setAttribute("user_seq", user_seq);
			
		} catch (NumberFormatException e) {
			System.out.println("에러 : " + e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());
		}
		
	}
}
