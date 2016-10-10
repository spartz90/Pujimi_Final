package kr.co.pujimi.action.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.ResDAO;
import kr.co.pujimi.dto.ResTO;

public class ResViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// res 정보 가져오기
		int res_seq = Integer.parseInt(request.getParameter("res_seq"));
		ResTO resTo = new ResTO();
		resTo.setRes_seq(res_seq);
		
		ResDAO resdao = new ResDAO();
		resTo = resdao.resView(resTo);	
		
		request.setAttribute("resTo", resTo);
	}
}
