package kr.co.pujimi.action.cooperate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.CooperateDAO;
import kr.co.pujimi.dto.CooperateDTO;

public class CooperateOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		CooperateDTO cdto = new CooperateDTO();
		
		cdto.setName(request.getParameter("name"));
		cdto.setEmail(request.getParameter("email"));
		cdto.setRes_name(request.getParameter("res_name"));
		cdto.setRes_addr(request.getParameter("res_addr"));
		cdto.setRes_content(request.getParameter("res_content"));
		cdto.setLatlng(request.getParameter("latlng"));
		

		CooperateDAO cdao = new CooperateDAO();
		
		int flag = cdao.cooperateOk(cdto);
		request.setAttribute("flag", flag);

	}

}
