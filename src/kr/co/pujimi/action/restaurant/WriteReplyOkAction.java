package kr.co.pujimi.action.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.ReplyDAO;
import kr.co.pujimi.dto.ReplyTO;

public class WriteReplyOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int res_seq = Integer.parseInt(request.getParameter("res_seq"));
		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		
		ReplyTO reto = new ReplyTO();
		
		reto.setUser_seq(user_seq);
		reto.setRes_seq(res_seq);
		String member_admin = request.getParameter("member_admin");		
		reto.setRe_content(request.getParameter("re_content"));
		
		reto.setRes_grade(Double.parseDouble(request.getParameter("res_grade")));
		
		ReplyDAO redao = new ReplyDAO();
		int flag = redao.writeOk(reto);
		
		request.setAttribute("flag", flag);
		request.setAttribute("res_seq", res_seq);
		request.setAttribute("user_seq", user_seq);
	}

}
