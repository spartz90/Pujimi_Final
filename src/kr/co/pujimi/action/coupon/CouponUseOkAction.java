package kr.co.pujimi.action.coupon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.CouponDAO;
import kr.co.pujimi.dto.CouponTO;

public class CouponUseOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int user_admin = Integer.parseInt(request.getParameter("user_admin"));
		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		String cp_serial = request.getParameter("cp_serial");
		
		CouponTO cTo = new CouponTO();
		cTo.setCp_serial(cp_serial);
		
		CouponDAO couponDao = new CouponDAO();
		int flag = couponDao.couponUse(cTo);

		request.setAttribute("flag", flag);
		request.setAttribute("user_admin", user_admin);
		request.setAttribute("user_seq", user_seq);
	}

}
