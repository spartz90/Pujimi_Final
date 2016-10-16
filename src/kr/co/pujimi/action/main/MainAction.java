package kr.co.pujimi.action.main;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.ResDAO;
import kr.co.pujimi.dto.ResTO;

public class MainAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ResDAO resDao = new ResDAO();
		
		ArrayList<ResTO> res_lists = resDao.viewList();
		ArrayList<ResTO> recom_lists = resDao.viewRecomList();
		
		request.setAttribute("res_lists", res_lists);
		request.setAttribute("recom_lists", recom_lists);
	}
}
