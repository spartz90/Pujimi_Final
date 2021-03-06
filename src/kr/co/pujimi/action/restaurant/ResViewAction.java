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

public class ResViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// res 정보 가져오기
		int res_seq = Integer.parseInt(request.getParameter("res_seq"));
		int member_seq = Integer.parseInt(request.getParameter("user_seq"));
		int member_admin = Integer.parseInt(request.getParameter("user_admin"));
		
		ResTO resTo = new ResTO();
		resTo.setRes_seq(res_seq);
		
		ResDAO resdao = new ResDAO();
		resTo = resdao.resView(resTo);	
		
		request.setAttribute("resTo", resTo);		
		
		ReplyDAO rdao = new ReplyDAO();	
		ArrayList<ReplyTO> lists = rdao.replyList(res_seq);	
		StringBuffer result = new StringBuffer();
		
		for(ReplyTO dto : lists){
			int re_seq = dto.getRe_seq();
			String reply_user_nickname = dto.getUser_nickname();
			String reply_date = dto.getRe_date();
			String reply_photo = dto.getRe_photo();
			String reply_content = dto.getRe_content();
			int reply_grade = (int) dto.getRe_grade();
			
			
			result.append("<div class='card w-item'>");
			result.append("		<div class='card-header'>");
			result.append("			<div class='media'>");
			result.append("				<div class='media-body'>");
			result.append("					<button class='btn btn-primary btn-sm pull-right waves-effect waves-button waves-float' id='modifybtn' onclick='javascript:location.href=\"modify.reply?user_seq="+ member_seq +"&res_seq="+ res_seq + "&re_seq="+ re_seq + "&user_admin="+ member_admin +"\"'>수정</button>");			
			// result.append("					<button class='btn btn-danger btn-sm pull-right waves-effect waves-button waves-float' id='modifybtn' onclick='javascript:location.href=\"delete.reply?user_seq="+ member_seq +"&res_seq="+ res_seq + "&re_seq="+ re_seq + "&user_admin="+ member_admin +"\"'>삭제</button>");			
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
			
			result.append("<div class='card w-item'>");
			result.append("		<div class='card-header'>");
			result.append("			<div class='media'>");
			result.append("				<div class='media-body'>");
			result.append("					<h2>소중한 후기를 남겨주세요</h2>");
			result.append("				</div>");
			result.append("			</div>");
			result.append("			<div class='wi-stats clearfix' style='float:right;'>");
			result.append("				<div class='wis-numbers'>");
			result.append("				</div>");									
			result.append("			</div>");
			result.append("		</div>");
			result.append("		<div class='card-body card-padding'>");
			result.append("			<p>작성된 댓글이 없습니다.</p>");
			result.append("		</div>");							
			result.append("</div>");
			
			request.setAttribute("result", result);
		}
		
		RatingTO rato = resdao.ratView(res_seq);
		request.setAttribute("rato", rato);	
		
		
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
