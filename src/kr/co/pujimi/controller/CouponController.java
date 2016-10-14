package kr.co.pujimi.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.action.coupon.CouponBuyAction;
import kr.co.pujimi.action.coupon.CouponBuyOkAction;
import kr.co.pujimi.action.coupon.CouponUseOkAction;
import kr.co.pujimi.action.coupon.ResCouponAction;
import kr.co.pujimi.action.coupon.MyCouponAction;
import kr.co.pujimi.core.Action;


@WebServlet("*.coupon")
public class CouponController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("utf-8");
			String path = request.getRequestURI().replaceAll(request.getContextPath(), "");
			String url = "";
			Action action = null;

			if (path.equals("/mycoupon.coupon")) {
				action = new MyCouponAction();
				action.execute(request, response);
				url = "/WEB-INF/view/coupon/mycoupon.jsp";
				
			}else if (path.equals("/coupon_buy.coupon")) {
				action = new CouponBuyAction();
				action.execute(request, response);
				url = "/WEB-INF/view/coupon/coupon_buy.jsp";
				
			}else if (path.equals("/coupon_buy_ok.coupon")) {
				action = new CouponBuyOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/coupon/coupon_buy_ok.jsp";	
				
			}else if (path.equals("/res_coupon.coupon")) {
				action = new ResCouponAction();
				action.execute(request, response);
				url = "/WEB-INF/view/coupon/res_coupon.jsp";	
			}else if (path.equals("/coupon_use.coupon")) {
				action = new CouponUseOkAction();
				action.execute(request, response);
				url = "/WEB-INF/json/coupon_use.jsp";	
			}

			if (!url.equals("")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				dispatcher.forward(request, response);
			}
		} catch (UnsupportedEncodingException e) {
			System.out.println("에러 : " + e.getMessage());
		} catch (ServletException e) {
			System.out.println("에러 : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());
		}
	}

}
