package kr.co.pujimi.action.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.JoinDAO;
import kr.co.pujimi.dao.ResDAO;
import kr.co.pujimi.dto.ResTO;
import kr.co.pujimi.dto.UserTO;

public class ModifyResInfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ResTO resTo = new ResTO();

		resTo.setUser_seq(Integer.parseInt(request.getParameter("user_seq")));

		ResDAO resDao = new ResDAO();
		resTo = resDao.ResModify(resTo);
		
		request.setAttribute("resTo", resTo);
	}
}