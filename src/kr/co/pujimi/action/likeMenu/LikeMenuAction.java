package kr.co.pujimi.action.likeMenu;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.LikeMenuDAO;
import kr.co.pujimi.dto.LikeMenuDTO;

public class LikeMenuAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		
		LikeMenuDAO lmdao = new LikeMenuDAO();
		
		ArrayList<LikeMenuDTO> likeMenu_lists = lmdao.likeMenuView(user_seq);
		
		request.setAttribute("likeMenu_lists", likeMenu_lists);
		
		/*
		JoinDAO joinDao = new JoinDAO();
		
		int price = joinDao.checkPrice(user_seq);
		
		request.setAttribute("price", price);
		*/
	}
}
