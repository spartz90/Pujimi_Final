package kr.co.pujimi.action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.UserDAO;
import kr.co.pujimi.dto.UserTO;

public class UserManageDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		UserTO userTo = new UserTO();

		userTo.setUser_seq(Integer.parseInt(request.getParameter("user_seq")));

		UserDAO userDao = new UserDAO();
		userTo = userDao.userDelete(userTo);
		
		request.setAttribute("userTo", userTo);
	}
}
