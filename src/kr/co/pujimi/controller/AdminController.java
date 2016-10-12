package kr.co.pujimi.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.action.admin.ResManageModifyOkAction;
import kr.co.pujimi.action.admin.ResManageModifyAction;
import kr.co.pujimi.action.admin.ResManageAction;
import kr.co.pujimi.action.admin.ResManageDeleteAction;
import kr.co.pujimi.action.admin.ResManageDeleteOkAction;
import kr.co.pujimi.action.admin.UserManageAction;
import kr.co.pujimi.action.admin.UserManageDeleteAction;
import kr.co.pujimi.action.admin.UserManageDeleteOkAction;
import kr.co.pujimi.action.admin.UserManageModifyAction;
import kr.co.pujimi.action.admin.UserManageModifyOkAction;
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
				/*url = "/WEB-INF/view/admin/manage_user.jsp";*/
				url = "/WEB-INF/view/admin/manage_user_test.jsp";

			} 
			else if (path.equals("/manage_rest.admin")) {
				action = new ResManageAction();
				action.execute(request, response);
				/*url = "/WEB-INF/view/admin/manage_rest.jsp";*/
				url = "/WEB-INF/view/admin/manage_rest_test.jsp";
				
			}
			else if (path.equals("/manage_rest_modify.admin")) {
				action = new ResManageModifyAction();
				action.execute(request, response);
				url = "/WEB-INF/view/admin/manage_rest_modify.jsp";
			}
			else if (path.equals("/manage_rest_modifyOk.admin")) {
				action = new ResManageModifyOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/admin/manage_rest_modifyOk.jsp";
			} 
			else if (path.equals("/manage_rest_delete.admin")) {
				action = new ResManageDeleteAction();
				action.execute(request, response);
				url = "/WEB-INF/view/admin/manage_rest_delete.jsp";
			}
			else if (path.equals("/manage_rest_deleteOk.admin")) {
				action = new ResManageDeleteOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/admin/manage_rest_deleteOk.jsp";
			}
			/*ㅡㅡ 위는 가맹점관리 / 아래는 유저관리  ㅡㅡ*/
			else if (path.equals("/manage_user_modify.admin")) {
				action = new UserManageModifyAction();
				action.execute(request, response);
				url = "/WEB-INF/view/admin/manage_user_modify.jsp";
			}
			else if (path.equals("/manage_user_modifyOk.admin")) {
				action = new UserManageModifyOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/admin/manage_user_modifyOk.jsp";
			} 
			else if (path.equals("/manage_user_delete.admin")) {
				action = new UserManageDeleteAction();
				action.execute(request, response);
				url = "/WEB-INF/view/admin/manage_user_delete.jsp";
			}
			else if (path.equals("/manage_user_deleteOk.admin")) {
				action = new UserManageDeleteOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/admin/manage_user_deleteOk.jsp";
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
