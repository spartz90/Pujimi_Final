package kr.co.pujimi.action.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.ManageDAO;
import kr.co.pujimi.dto.ResTO;

public class ResManageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ManageDAO manageDao = new ManageDAO();
		
		ArrayList<ResTO> res_lists = manageDao.ResList();
		
		request.setAttribute("res_lists", res_lists);
		
	}
}
