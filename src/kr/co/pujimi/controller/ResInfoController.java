package kr.co.pujimi.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.action.restaurant.InterResAction;
import kr.co.pujimi.action.restaurant.ModifyResInfoAction;
import kr.co.pujimi.action.restaurant.ModifyResInfoOkAction;
import kr.co.pujimi.action.restaurant.MyResViewAction;
import kr.co.pujimi.action.restaurant.ResAddMenuAction;
import kr.co.pujimi.action.restaurant.ResInfoAction;
import kr.co.pujimi.action.restaurant.ResViewAction;
import kr.co.pujimi.core.Action;


@WebServlet("*.restaurant")
public class ResInfoController extends HttpServlet {
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

			if (path.equals("/res_info.restaurant")) {
				action = new ResInfoAction();
				action.execute(request, response);
				url = "/WEB-INF/view/restaurant/res_info.jsp";

			}else if (path.equals("/res_view.restaurant")) {
				action = new ResViewAction();
				action.execute(request, response);
				url = "/WEB-INF/view/restaurant/res_view.jsp";
				
			}else if (path.equals("/my_res_view.restaurant")) {
				action = new MyResViewAction();
				action.execute(request, response);
				url = "/WEB-INF/view/restaurant/my_res_view.jsp";
				
			}else if (path.equals("/res_management.restaurant")) {
				action = new ModifyResInfoAction();
				action.execute(request, response);
				url = "/WEB-INF/view/restaurant/res_management.jsp";
				
			}else if (path.equals("/res_management_ok.restaurant")) {
				action = new ModifyResInfoOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/restaurant/res_management_ok.jsp";
				
			}else if (path.equals("/inter_res.restaurant")) {
				action = new InterResAction();
				action.execute(request, response);
				url = "/WEB-INF/view/restaurant/inter_res.jsp";
				
			}else {

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
