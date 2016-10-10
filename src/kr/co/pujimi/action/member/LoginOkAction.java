package kr.co.pujimi.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.JoinDAO;
import kr.co.pujimi.dto.UserTO;

public class LoginOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		UserTO userto = new UserTO();
		
		String id = request.getParameter("email");
		String password = request.getParameter("password");
		
		JoinDAO joinDao = new JoinDAO();
		int flag = joinDao.loginCheck(id, password, userto);
		
		request.setAttribute("flag", flag);
		request.setAttribute("user_seq", userto.getUser_seq());
		request.setAttribute("user_admin", userto.getUser_admin());
		request.setAttribute("user_nickname", userto.getUser_nickname());
		
	}
}
