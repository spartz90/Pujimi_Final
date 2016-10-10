package kr.co.pujimi.action.restaurant;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.ResDAO;
import kr.co.pujimi.dto.ResTO;

public class InterResAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		
		ResTO resTo = new ResTO();
		
		resTo.setUser_seq(user_seq);
		
		ResDAO resDao = new ResDAO();
		
		ArrayList<ResTO> inter_lists = resDao.interList(resTo);
		
		request.setAttribute("inter_lists", inter_lists);
		
	}
}
