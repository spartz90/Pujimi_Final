package kr.co.pujimi.action.addMenu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.AddMenuDAO;
import kr.co.pujimi.dao.ResDAO;
import kr.co.pujimi.dto.AddMenuDTO;

public class AddMenuAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		
		ResDAO rdao = new ResDAO();
		int res_seq = rdao.getResSeq(user_seq);
		
		AddMenuDAO addDao = new AddMenuDAO();
		
		ArrayList<AddMenuDTO> addMenu_lists = addDao.addMenuView(res_seq);
		
		
		request.setAttribute("addMenu_lists", addMenu_lists);
		
	}
}
