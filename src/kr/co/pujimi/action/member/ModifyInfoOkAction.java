package kr.co.pujimi.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.JoinDAO;
import kr.co.pujimi.dto.UserTO;

public class ModifyInfoOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		UserTO userTo = new UserTO();

		userTo.setUser_seq((Integer.parseInt(request.getParameter("user_seq"))));
		userTo.setUser_nickname(request.getParameter("nickname"));
		userTo.setUser_password(request.getParameter("password"));
		
		int gender = -1;
		
		if(request.getParameter("inlineRadioOptions").equals("option1")){
			gender = 0;
		}else{
			gender = 1;
		}
		userTo.setUser_gender(gender);
		
		String birth = request.getParameter("birth");
		birth = birth.replace("/", "");
		userTo.setUser_age(birth);
		
		JoinDAO joinDao = new JoinDAO();
		
		//실제로 데이터가 DB에 전송되도록 만드는 메서드
		int flag = joinDao.userModifyOk(userTo);
		
		request.setAttribute("flag", flag);
		
	}
}
