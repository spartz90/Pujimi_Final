package kr.co.pujimi.action.like;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.CooperateDAO;
import kr.co.pujimi.dao.LikeDAO;
import kr.co.pujimi.dto.CooperateDTO;
import kr.co.pujimi.dto.ResTO;

public class CheckOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ResTO rto = new ResTO();
		
		rto.setUser_seq(Integer.parseInt(request.getParameter("user_seq")));
		rto.setRes_seq(Integer.parseInt(request.getParameter("res_seq")));
		
		LikeDAO ldao = new LikeDAO();
		int flag = ldao.checkOk(rto);
		
		request.setAttribute("flag", flag);
	}

}
