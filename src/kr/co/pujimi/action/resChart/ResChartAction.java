package kr.co.pujimi.action.resChart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.ResChartDAO;
import kr.co.pujimi.dao.ResDAO;
import kr.co.pujimi.dto.ResChartDTO;

public class ResChartAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		
		ResDAO rdao = new ResDAO();
		int res_seq = rdao.getResSeq(user_seq);
		
		ResChartDAO rcDAO = new ResChartDAO();
		
		ResChartDTO rcdto = rcDAO.viewResChart(res_seq);
		ResChartDTO rcdto2 = rcDAO.viewInterResChart(res_seq);
		
		request.setAttribute("rcdto", rcdto);
		request.setAttribute("rcdto2", rcdto2);
	}
}
