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
import kr.co.pujimi.action.restaurant.ResInfoAction;
import kr.co.pujimi.action.restaurant.ResViewAction;
import kr.co.pujimi.action.restaurant.WriteReplyOkAction;
import kr.co.pujimi.core.Action;


@WebServlet("*.reply")
public class ReplyController extends HttpServlet {
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
			
			/*
			String res_seq = request.getAttribute("res_seq").toString();
			String user_seq = request.getParameter("user_seq");
			String user_admin = request.getParameter("user_admin");
			
			System.out.println(user_seq);
			System.out.println(user_admin);*/
			
			String path = request.getRequestURI().replaceAll(request.getContextPath(), "");
			String url = "";
			Action action = null;

			if (path.equals("/replyOk.reply")) {
				action = new WriteReplyOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/reply/replyWriteOk.jsp";

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
