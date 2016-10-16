package kr.co.pujimi.action.restaurant;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.MenuDAO;
import kr.co.pujimi.dao.ReplyDAO;
import kr.co.pujimi.dao.ResDAO;
import kr.co.pujimi.dto.MenuDTO;
import kr.co.pujimi.dto.RatingTO;
import kr.co.pujimi.dto.ReplyTO;
import kr.co.pujimi.dto.ResTO;

public class MyResViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// res 정보 가져오기
		int user_seq = Integer.parseInt(request.getParameter("user_seq"));
		
		ResTO resTo = new ResTO();
		ResDAO resdao = new ResDAO();
		
		resTo = resdao.resView(user_seq);	
		int res_seq = resTo.getRes_seq();
		
		request.setAttribute("resTo", resTo);
		request.setAttribute("res_seq", res_seq);
		
		ReplyDAO rdao = new ReplyDAO();	
		ArrayList<ReplyTO> lists = rdao.replyList(res_seq);	
		StringBuffer result = new StringBuffer();
		
		for(ReplyTO dto : lists){
			String reply_user_nickname = dto.getUser_nickname();
			String reply_date = dto.getRe_date();
			String reply_photo = dto.getRe_photo();
			String reply_content = dto.getRe_content();
			int reply_grade = (int) dto.getRe_grade();
			
			result.append("<div class='card w-item'>");
			result.append("		<div class='card-header'>");
			result.append("			<div class='media'>");
			result.append("				<div class='media-body'>");
			result.append("					<h2>"+ reply_user_nickname + "<small>작성일 : " + reply_date + "</small></h2>");
			result.append("				</div>");
			result.append("			</div>");
			result.append("			<div class='wi-stats clearfix' style='float:right;'>");
			result.append("				<div class='wis-numbers'>");
			result.append("					<span>평점</span>"); //
			result.append("					<span class='active'></i><i class='md md-star active'></i>" + reply_grade + "</span>");
			result.append("				</div>");									
			result.append("			</div>");
			result.append("		</div>");
			result.append("		<div class='card-body card-padding'>");
			result.append("			<div class='wi-preview lightbox clearfix'>");
			result.append("				<div class='wip-item' style='background-image: url(upload/" + reply_photo + ");'>");
			result.append("					<div class='lightbox-item'></div>");
			result.append("				</div>");
			result.append("			</div>");
			result.append("			<p>" + reply_content + "</p>");
			result.append("		</div>");							
			result.append("</div>");
		}
		
		// 댓글이 없을 경우 예외처리 미완
		if(result.length() != 0){
			request.setAttribute("result", result);
		} else {
			request.setAttribute("result", result);
		}
		
		RatingTO rato = resdao.ratView(res_seq);
		request.setAttribute("rato", rato);	
		request.setAttribute("res_seq", res_seq);
		
		MenuDAO mdao = new MenuDAO();
		ArrayList<MenuDTO> menu_lists = mdao.menuViewtoday(res_seq);		
		StringBuffer menu_result = new StringBuffer();		
		
		for(MenuDTO mdto : menu_lists){
			String menu_name = mdto.getMenu_name();
			int menu_serving = mdto.getMenu_serving();
			double menu_na = mdto.getMenu_na();
			int menu_kcal = mdto.getMenu_kcal();
			String menu_date = mdto.getMenu_date().substring(0,11);
			
			// 날짜, 메뉴이름, 1인분, 열량, 나트륨
			
			menu_result.append("<tr>");
			menu_result.append("<td>" + menu_date + "</td>");
			menu_result.append("<td>" + menu_name + "</td>");
			menu_result.append("<td>" + menu_serving + "</td>");
			menu_result.append("<td>" + menu_kcal + "</td>");
			menu_result.append("<td>" + menu_na + "</td>");
			menu_result.append("</tr>");		
			
		}
		
		if(menu_result.length() != 0 ){
			request.setAttribute("menu_result", menu_result);
		} else {
			menu_result.append("<tr><td>등록된 메뉴가 없습니다</td>");			
			menu_result.append("</tr>");
			request.setAttribute("menu_result", menu_result);
		}
		
		
		
	}
}
