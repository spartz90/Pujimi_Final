package kr.co.pujimi.action.likeMenu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.LikeMenuDAO;
import kr.co.pujimi.dao.PaymentDAO;
import kr.co.pujimi.dto.LikeMenuDTO;

public class LikeMenuOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		LikeMenuDTO lmDto = new LikeMenuDTO();

		lmDto.setUser_seq(Integer.parseInt(request.getParameter("user_seq")));
		lmDto.setMenu_name(request.getParameter("likeMenu"));
		
		LikeMenuDAO lmDao = new LikeMenuDAO();
		int flag = lmDao.doLikeMenu(lmDto);
		
		request.setAttribute("flag", flag);
	}
		
}
