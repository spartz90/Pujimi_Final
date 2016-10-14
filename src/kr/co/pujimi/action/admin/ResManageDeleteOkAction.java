package kr.co.pujimi.action.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.ResDAO;
import kr.co.pujimi.dto.ResTO;

public class ResManageDeleteOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding( "utf-8");
			
			// 페이지 돌아가기위한 member_admin, member_seq 받아오기
			String member_admin = request.getParameter("user_admin");
			String member_seq = request.getParameter("user_seq");
			
			//데이터를 넣기 위한 BoardTO 선언 (transfer Object)
			ResTO resTo = new ResTO();
	
			resTo.setUser_seq(Integer.parseInt(request.getParameter("user_seq")));
			resTo.setRes_seq(Integer.parseInt(request.getParameter("res_seq")));
			
			ResDAO resDao = new ResDAO();
			int flag = resDao.resDeleteOk(resTo);
			request.setAttribute("flag", flag);
			request.setAttribute("user_admin", member_admin);
			request.setAttribute("user_seq", member_seq);
			
		} catch (NumberFormatException e) {
			System.out.println("에러 : " + e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());
		}
		
	}
}
