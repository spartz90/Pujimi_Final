package kr.co.pujimi.action.coupon;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.CouponDAO;
import kr.co.pujimi.dao.JoinDAO;
import kr.co.pujimi.dto.CouponTO;

public class CouponBuyOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		CouponTO cTo = new CouponTO();

		cTo.setRes_seq(Integer.parseInt(request.getParameter("res_seq")));
		cTo.setUser_seq(Integer.parseInt(request.getParameter("user_seq")));
		cTo.setUser_point(Integer.parseInt(request.getParameter("user_point")));
		
		int amount = Integer.parseInt(request.getParameter("coupon_amount"));
		
		CouponDAO couponDao = new CouponDAO();
		
		System.out.println(amount);
		int flag = 0;
		int checkCoupon = 0;
		for(int i=1;i<=amount;i++){
	          String uniqueString = UUID.randomUUID().toString(); 
	          String[] cp_serial_step1 = uniqueString.split("-");
	          String cp_serial = cp_serial_step1[1]+cp_serial_step1[2]+cp_serial_step1[3];
	          
	          checkCoupon = couponDao.couponBuyOk(cTo, cp_serial);
	    };
	    
	    JoinDAO jDao = new JoinDAO();
	    int checkPoint = jDao.pointUpdate(cTo);
	    
	    if (checkCoupon==1 && checkPoint==1) {
			flag = 1; //정상
		}
		request.setAttribute("flag", flag);
	}

}
