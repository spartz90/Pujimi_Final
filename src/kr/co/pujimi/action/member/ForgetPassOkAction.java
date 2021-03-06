package kr.co.pujimi.action.member;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.JoinDAO;

public class ForgetPassOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("email");
		
		Random random = new Random();
		
		String newPass = "pujimi" + random.nextInt(10000);
		JoinDAO joinDao = new JoinDAO();
		
		int flag = joinDao.forgetPass(newPass, id);
		
		request.setAttribute("flag", flag);
		request.setAttribute("newPass", newPass);
	}
}
