package kr.co.pujimi.action.coupon;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.CouponDAO;
import kr.co.pujimi.dao.ResDAO;
import kr.co.pujimi.dto.CouponTO;

public class ResCouponAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		System.out.println(user_seq);
		
		ResDAO rdao = new ResDAO();
		int res_seq = rdao.getResSeq(user_seq);

		CouponDAO couponDao = new CouponDAO();
		
		ArrayList<CouponTO> resCouponList = couponDao.ResCoupon(res_seq);
		
		request.setAttribute("resCouponList", resCouponList);
	}

}
