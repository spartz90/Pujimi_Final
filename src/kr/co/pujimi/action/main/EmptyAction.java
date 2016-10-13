package kr.co.pujimi.action.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;

public class EmptyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//Empty Action
	}

}
