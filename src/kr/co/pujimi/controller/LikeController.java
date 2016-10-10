package kr.co.pujimi.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.action.like.CheckOkAction;
import kr.co.pujimi.action.main.MainAction;
import kr.co.pujimi.action.member.LoginOkAction;
import kr.co.pujimi.action.member.LogoutOkAction;
import kr.co.pujimi.action.member.ManagerJoinOkAction;
import kr.co.pujimi.action.member.ModifyInfoAction;
import kr.co.pujimi.action.member.ModifyInfoOkAction;
import kr.co.pujimi.action.member.UserJoinOkAction;
import kr.co.pujimi.core.Action;


@WebServlet("*.like")
public class LikeController extends HttpServlet {
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

			if (path.equals("/checkOk.like")) {
				action = new CheckOkAction();
				action.execute(request, response);
				url = "/WEB-INF/json/check_ok.jsp";
			} 
			else if (path.equals("/likeUp.like")) {
				action = new UserJoinOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/member/join_ok_user.jsp";
				
			}
			else if (path.equals("/likeDown.like")) {
				action = new ManagerJoinOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/member/join_ok_mgr.jsp";
				
			}
			else {

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
