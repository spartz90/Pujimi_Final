package kr.co.pujimi.action.restaurant;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.ReplyDAO;
import kr.co.pujimi.dto.ReplyTO;

public class ModifyReplyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ReplyTO reto = new ReplyTO();
		reto.setRe_seq(Integer.parseInt(request.getParameter("re_seq")));
		
		ReplyDAO redao = new ReplyDAO();
		reto = redao.modifyReply(reto);
		
		request.setAttribute("reto", reto);
		
	}

}
