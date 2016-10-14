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
		
		String[] likeMenus = request.getParameterValues("likeMenus");
		
		LikeMenuDAO lmDao = new LikeMenuDAO();
		int flag = 1;
		for (int i = 0; i < request.getParameterValues("likeMenus").length-1; i++) {
			lmDto.setMenu_name(likeMenus[i]);
			flag = lmDao.doLikeMenu(lmDto);
		}
		
		request.setAttribute("flag", flag);
	}
		
}
