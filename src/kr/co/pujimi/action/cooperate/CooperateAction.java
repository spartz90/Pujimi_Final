package kr.co.pujimi.action.cooperate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.JoinDAO;
import kr.co.pujimi.dto.UserTO;

public class CooperateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		UserTO userTo = new UserTO();

		int user_seq = Integer.parseInt(request.getParameter("user_seq")=="-1" ? "0":request.getParameter("user_seq"));
		userTo.setUser_seq(user_seq);
		
		JoinDAO joinDao = new JoinDAO();
		userTo = joinDao.userModify(userTo);
		
		request.setAttribute("userTo", userTo);
	}
}
