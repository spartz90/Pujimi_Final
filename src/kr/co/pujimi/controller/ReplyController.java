package kr.co.pujimi.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.action.restaurant.ModifyOkReplyAction;
import kr.co.pujimi.action.restaurant.ModifyReplyAction;
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
			String path = request.getRequestURI().replaceAll(request.getContextPath(), "");
			String url = "";
			Action action = null;

			if (path.equals("/writeOk.reply")) {
				action = new WriteReplyOkAction();
				action.execute(request, response);
				url = "/WEB-INF/view/reply/replyWriteOk.jsp";

			}else if (path.equals("/modify.reply")){
				action = new ModifyReplyAction();
				action.execute(request, response);
				url = "/WEB-INF/view/reply/reply_modify.jsp";
			}else if (path.equals("/modifyOk.reply")){
				action = new ModifyOkReplyAction();
				action.execute(request, response);
				url = "/WEB-INF/view/reply/reply_modifyOk.jsp";
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
