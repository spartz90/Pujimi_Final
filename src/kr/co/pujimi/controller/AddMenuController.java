package kr.co.pujimi.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.action.addMenu.AddMenuAction;
import kr.co.pujimi.action.addMenu.AddMenuOkAction;
import kr.co.pujimi.core.Action;


@WebServlet("*.addMenu")
public class AddMenuController extends HttpServlet {
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

			if (path.equals("/res_add_menu.addMenu")) {
				action = new AddMenuAction();
				action.execute(request, response);
				url = "/WEB-INF/view/restaurant/res_add_menu.jsp";
				
			}
			else if (path.equals("/AddMenuOk.addMenu")) {
				action = new AddMenuOkAction();
				action.execute(request, response);
				url = "/WEB-INF/json/check_ok.jsp";
				
			} else if (path.equals("/AddMenuList.addMenu")) {
				action = new AddMenuAction();
				action.execute(request, response);
				url = "/WEB-INF/json/addMenu_ok.jsp";
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
