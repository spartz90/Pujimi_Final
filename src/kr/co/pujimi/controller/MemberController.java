package kr.co.pujimi.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.action.main.MainAction;
import kr.co.pujimi.action.member.ForgetPassOkAction;
import kr.co.pujimi.action.member.LoginOkAction;
import kr.co.pujimi.action.member.LogoutOkAction;
import kr.co.pujimi.action.member.ManagerJoinOkAction;
import kr.co.pujimi.action.member.ModifyInfoAction;
import kr.co.pujimi.action.member.ModifyInfoOkAction;
import kr.co.pujimi.action.member.UserJoinOkAction;
import kr.co.pujimi.core.Action;


@WebServlet("*.member")
public class MemberController extends HttpServlet {
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

			if (path.equals("/join.member")) {
				action = new MainAction();
				action.execute(request, response);
				url = "/WEB-INF/view/member/join.jsp";

			} 
			else if (path.equals("/join_ok_user.member")) {
				action = new UserJoinOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/member/join_ok_user.jsp";
				
			}
			else if (path.equals("/join_ok_mgr.member")) {
				action = new ManagerJoinOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/member/join_ok_mgr.jsp";
				
			}
			else if (path.equals("/login.member")) {
				action = new MainAction();
				action.execute(request, response);
				url = "/WEB-INF/view/member/login.jsp";

			}
			else if (path.equals("/login_ok.member")) {
				action = new LoginOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/member/login_ok.jsp";
				
			}
			else if (path.equals("/logout.member")) {
				action = new LogoutOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/member/logout.jsp";
				
			}
			else if (path.equals("/modify_info.member")) {
				action = new ModifyInfoAction();
				action.execute(request, response);
				url = "/WEB-INF/view/member/modify_info.jsp";

			}	
			else if (path.equals("/modify_info_ok.member")) {
				action = new ModifyInfoOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/member/modify_info_ok.jsp";

			}
			else if (path.equals("/forgetPass.member")) {
				action = new ForgetPassOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/member/forget_pass_ok.jsp";

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
