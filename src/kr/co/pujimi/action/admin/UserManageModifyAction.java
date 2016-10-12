package kr.co.pujimi.action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.JoinDAO;
import kr.co.pujimi.dao.ResDAO;
import kr.co.pujimi.dao.UserDAO;
import kr.co.pujimi.dto.ResTO;
import kr.co.pujimi.dto.UserTO;

public class UserManageModifyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		UserTO userTo = new UserTO();

		userTo.setUser_seq(Integer.parseInt(request.getParameter("user_seq")));

		UserDAO userDao = new UserDAO();
		userTo = userDao.userModify(userTo);
		
		request.setAttribute("userTo", userTo);
	}
}
