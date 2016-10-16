package kr.co.pujimi.action.restaurant;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.ResDAO;
import kr.co.pujimi.dto.ResTO;

public class ResMenuInfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String menu_type = request.getParameter("menu_type");
		
		ResDAO resDao = new ResDAO();
		
		ArrayList<ResTO> menu_res_lists = resDao.menuViewList(menu_type);
		ArrayList<ResTO> recom_lists = resDao.viewRecomList();
		
		request.setAttribute("menu_res_lists", menu_res_lists);
		request.setAttribute("recom_lists", recom_lists);
		
	}
}
