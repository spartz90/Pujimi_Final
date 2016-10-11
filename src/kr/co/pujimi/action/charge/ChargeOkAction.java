package kr.co.pujimi.action.charge;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.PaymentDAO;
import kr.co.pujimi.dto.PaymentTO;

public class ChargeOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		PaymentTO payTo = new PaymentTO();
		
		payTo.setUser_seq(Integer.parseInt(request.getParameter("user_seq")));
		payTo.setPay_price(Integer.parseInt(request.getParameter("price")));
		payTo.setPay_method(request.getParameter("method"));
		
		PaymentDAO payDao = new PaymentDAO();
		int flag = payDao.buyPoint(payTo);

		request.setAttribute("flag", flag);
	}
		
}
