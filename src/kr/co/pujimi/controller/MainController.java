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
import kr.co.pujimi.core.Action;


@WebServlet("*.do")
public class MainController extends HttpServlet {
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

			if (path.equals("/*.do") || path.equals("/index.do")) {
				action = new MainAction();
				action.execute(request, response);
				url = "/WEB-INF/view/main.jsp";

			} 
			/*else if (path.equals("/view.do")) {
				action = new ViewAction();
				action.execute(request, response);
				url = "/WEB-INF/model2/board_view1.jsp";

			} else if (path.equals("/write.do")) {
				action = new JoinWriteAction();
				action.execute(request, response);
				url = "/WEB-INF/model2/board_write1.jsp";

			} else if (path.equals("/write_ok.do")) {
				action = new WriteOkAction();
				action.execute(request, response);
				url = "/WEB-INF/model2/board_write1_ok.jsp";

			} else if (path.equals("/modify.do")) {
				action = new ModifyAction();
				action.execute(request, response);
				url = "/WEB-INF/model2/board_modify1.jsp";

			} else if (path.equals("/modify_ok.do")) {
				action = new ModifyOkAction();
				action.execute(request, response);
				url = "/WEB-INF/model2/board_modify1_ok.jsp";

			} else if (path.equals("/delete.do")) {
				action = new DeleteAction();
				action.execute(request, response);
				url = "/WEB-INF/model2/board_delete1.jsp";

			} else if (path.equals("/delete_ok.do")) {
				action = new DeleteOkAction();
				action.execute(request, response);
				url = "/WEB-INF/model2/board_delete1_ok.jsp";

			}
			*/ else {

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
