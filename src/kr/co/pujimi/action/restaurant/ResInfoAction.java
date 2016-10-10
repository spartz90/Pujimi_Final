package kr.co.pujimi.action.restaurant;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.ResDAO;
import kr.co.pujimi.dto.ResTO;

public class ResInfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ResDAO resDao = new ResDAO();
		
		ArrayList<ResTO> res_lists = resDao.viewList();
		
		request.setAttribute("res_lists", res_lists);
		
	}
}
