package kr.co.pujimi.action.likeMenu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;

public class LikeMenuAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		/*
		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		
		PaymentDAO payDao = new PaymentDAO();
		
		ArrayList<PaymentTO> pay_lists = payDao.payView(user_seq);
				
		request.setAttribute("pay_lists", pay_lists);
		
		
		JoinDAO joinDao = new JoinDAO();
		
		int price = joinDao.checkPrice(user_seq);
		
		request.setAttribute("price", price);
		*/
	}
}
