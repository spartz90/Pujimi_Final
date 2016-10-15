package kr.co.pujimi.action.addMenu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.AddMenuDAO;
import kr.co.pujimi.dao.ResDAO;
import kr.co.pujimi.dto.AddMenuDTO;

public class AddMenuOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		AddMenuDTO addDto = new AddMenuDTO();
		ResDAO rdao = new ResDAO();
		
		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		int res_seq = rdao.getResSeq(user_seq);
		
		addDto.setRes_seq(res_seq);
		
		String[] likeMenus = request.getParameterValues("likeMenus");
		
		AddMenuDAO addDao = new AddMenuDAO();
		int flag = 1;
		for (int i = 0; i < request.getParameterValues("likeMenus").length-1; i++) {
			addDto.setMenu_name(likeMenus[i]);
			flag = addDao.doAddMenu(addDto);
		}
		
		request.setAttribute("flag", flag);
	}
		
}
