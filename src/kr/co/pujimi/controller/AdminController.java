package kr.co.pujimi.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.action.admin.ResManageAction;
import kr.co.pujimi.action.admin.UserManageAction;
import kr.co.pujimi.action.main.MainAction;
import kr.co.pujimi.action.member.LoginOkAction;
import kr.co.pujimi.action.member.LogoutOkAction;
import kr.co.pujimi.action.member.ManagerJoinOkAction;
import kr.co.pujimi.action.member.UserJoinOkAction;
import kr.co.pujimi.core.Action;


@WebServlet("*.admin")
public class AdminController extends HttpServlet {
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

			if (path.equals("/manage_user.admin")) {
				action = new UserManageAction();
				action.execute(request, response);
				url = "/WEB-INF/view/admin/manage_user.jsp";

			} 
			else if (path.equals("/manage_rest.admin")) {
				action = new ResManageAction();
				action.execute(request, response);
				url = "/WEB-INF/view/admin/manage_rest.jsp";
				
			} else {

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
