package kr.co.pujimi.action.charge;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.JoinDAO;
import kr.co.pujimi.dao.PaymentDAO;
import kr.co.pujimi.dto.PaymentTO;

public class ChargeAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		
		PaymentDAO payDao = new PaymentDAO();
		
		ArrayList<PaymentTO> pay_lists = payDao.payView(user_seq);
				
		request.setAttribute("pay_lists", pay_lists);
		
		
		JoinDAO joinDao = new JoinDAO();
		
		int price = joinDao.checkPrice(user_seq);
		
		request.setAttribute("price", price);
	}
}
