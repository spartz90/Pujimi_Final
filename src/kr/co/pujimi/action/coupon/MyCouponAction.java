package kr.co.pujimi.action.coupon;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.CouponDAO;
import kr.co.pujimi.dao.LikeDAO;
import kr.co.pujimi.dto.CouponTO;
import kr.co.pujimi.dto.ResTO;

public class MyCouponAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//CouponTO cTo = new CouponTO();

		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		
		CouponDAO couponDao = new CouponDAO();
		ArrayList<CouponTO> couponList = couponDao.myCoupon(user_seq);
		
		
		request.setAttribute("couponList", couponList);
	}

}