package kr.co.pujimi.action.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.UserDAO;
import kr.co.pujimi.dto.UserTO;

public class UserManageDeleteOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding( "utf-8");
			
			String user_admin = request.getParameter("user_admin");
			String user_seq = request.getParameter("member_seq");
			
			//데이터를 넣기 위한 TO 선언 (transfer Object)
			UserTO userTo = new UserTO();
	
			userTo.setUser_seq(Integer.parseInt(request.getParameter("user_seq")));
			
			UserDAO userDao = new UserDAO();
			int flag = userDao.userDeleteOk(userTo);
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
