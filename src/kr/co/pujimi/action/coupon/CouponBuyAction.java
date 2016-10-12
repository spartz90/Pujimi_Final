package kr.co.pujimi.action.coupon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.CouponDAO;
import kr.co.pujimi.dao.LikeDAO;
import kr.co.pujimi.dto.CouponTO;
import kr.co.pujimi.dto.ResTO;

public class CouponBuyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		CouponTO cTo = new CouponTO();

		cTo.setRes_seq(Integer.parseInt(request.getParameter("res_seq")));
		cTo.setUser_seq(Integer.parseInt(request.getParameter("user_seq")));

		CouponDAO couponDao = new CouponDAO();
		cTo = couponDao.couponBuy(cTo);
		
		request.setAttribute("cTo", cTo);
	}

}
