package kr.co.pujimi.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.action.likeMenu.LikeMenuAction;
import kr.co.pujimi.action.likeMenu.LikeMenuOkAction;
import kr.co.pujimi.core.Action;


@WebServlet("*.likeMenu")
public class LikeMenuController extends HttpServlet {
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

			if (path.equals("/likeMenu.likeMenu")) {
				action = new LikeMenuAction();
				action.execute(request, response);
				url = "/WEB-INF/view/chart/user_chart.jsp";

			} else if (path.equals("/likeMenuOk.likeMenu")) {
				action = new LikeMenuOkAction();
				action.execute(request, response);
				url = "/WEB-INF/json/check_ok.jsp";
			} else if (path.equals("/likeMenuList.likeMenu")) {
				action = new LikeMenuAction();
				action.execute(request, response);
				url = "/WEB-INF/json/likeMenu_ok.jsp";
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
