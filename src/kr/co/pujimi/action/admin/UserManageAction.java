package kr.co.pujimi.action.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.ManageDAO;
import kr.co.pujimi.dto.UserTO;

public class UserManageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		ManageDAO manageDao = new ManageDAO();
		
		ArrayList<UserTO> user_lists = manageDao.UserList();
		
		request.setAttribute("user_lists", user_lists);
		
	}
}
