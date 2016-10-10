package kr.co.pujimi.action.like;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.LikeDAO;
import kr.co.pujimi.dto.ResTO;

public class CheckOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//좋아요 버튼 초기값 -1;
		int flag = -1;
		
		ResTO resTo = new ResTO();
		
		resTo.setUser_seq(Integer.parseInt(request.getParameter("user_seq")));
		resTo.setRes_seq(Integer.parseInt(request.getParameter("res_seq")));
		
		LikeDAO likeDao = new LikeDAO();
		int check = likeDao.checkOk(resTo);
		
		//좋아요가 등록되어있지않으면
		if(check==0){
			//DB에 좋아요를 넣어주고 check는 0 리턴
			flag = likeDao.doLike(resTo);
		}else{
			//DB에서 좋아요를 해제하고 check는 0 리턴
			likeDao.doNotLike(resTo);
		}
		
		request.setAttribute("flag", flag);
	}

}
