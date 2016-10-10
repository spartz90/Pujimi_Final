package kr.co.pujimi.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.JoinDAO;
import kr.co.pujimi.dto.ResTO;
import kr.co.pujimi.dto.UserTO;

public class ManagerJoinOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		UserTO userTo = new UserTO();
		
		String nickname = request.getParameter("nickname");
		int gender = -1;
		
		if(request.getParameter("genderOption").equals("male")){
			gender = 0;
		}else{
			gender = 1;
		}
		
		String birth = request.getParameter("birth");
		birth = birth.replace("/", "");
		
		userTo.setUser_email(request.getParameter("email"));
		userTo.setUser_password(request.getParameter("password"));
		userTo.setUser_nickname(nickname);
		userTo.setUser_age(birth);
		userTo.setUser_gender(gender);
		userTo.setUser_admin(1);
		
		ResTO resTo = new ResTO();
		resTo.setRes_name(request.getParameter("res_name"));
		resTo.setRes_addr(request.getParameter("res_addr"));
		resTo.setRes_phone(request.getParameter("res_phone"));
		String opentime = request.getParameter("res_otime");
		String closedtime = request.getParameter("res_ctime");
		String res_octime = opentime + "-" + closedtime;	
		resTo.setRes_octime(res_octime);
		resTo.setRes_content(request.getParameter("res_content"));
		
		JoinDAO joinDao = new JoinDAO();
		int flag = joinDao.joinOk_mgr(userTo, resTo);

		request.setAttribute("flag", flag);

	}

}
