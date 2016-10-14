package kr.co.pujimi.action.coupon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.CouponDAO;
import kr.co.pujimi.dao.JoinDAO;
import kr.co.pujimi.dao.LikeDAO;
import kr.co.pujimi.dto.CouponTO;
import kr.co.pujimi.dto.ResTO;

import java.lang.Character.Subset;
import java.util.UUID;

public class CouponUseOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		CouponTO cTo = new CouponTO();
		cTo.setCp_serial(request.getParameter("cp_serial"));
		
		CouponDAO couponDao = new CouponDAO();
		int flag = couponDao.couponUse(cTo);

		request.setAttribute("flag", flag);
	}

}
