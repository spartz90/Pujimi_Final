package kr.co.pujimi.action.restaurant;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.ReplyDAO;
import kr.co.pujimi.dto.ReplyTO;

public class WriteReplyOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String uploadPath = "/home/hosting_users/tigger90/tomcat/webapps/ROOT/upload";
			//String uploadPath = "C:/WorkSpace/Pujimi_final/WebContent/upload";
			int maxFileSize = 1024 * 1024 * 5;
			String encoding = "utf-8";
			
			MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, encoding, new DefaultFileRenamePolicy());

			ReplyTO replyTo = new ReplyTO();
			
			int res_seq = Integer.parseInt(multi.getParameter("res_seq"));
			int user_seq = Integer.parseInt(multi.getParameter("user_seq"));
			int user_admin = Integer.parseInt(multi.getParameter("user_admin"));
			
			replyTo.setUser_seq(user_seq);
			replyTo.setRes_seq(res_seq);
			replyTo.setRe_content(multi.getParameter("re_content"));
			
			double rating = 0.0;
			
			if(multi.getParameter("rating").equals("1")){
				rating = 1.0;
			}else if(multi.getParameter("rating").equals("2")){
				rating = 2.0;
			}else if(multi.getParameter("rating").equals("3")){
				rating = 3.0;
			}else if(multi.getParameter("rating").equals("4")){
				rating = 4.0;
			}else if(multi.getParameter("rating").equals("5")){
				rating = 5.0;
			}else{
				rating = 0.0;
			}
			
			replyTo.setRe_grade(rating);
			
			String res_photo = "noimage.png";
			
			if(multi.getFilesystemName("re_photo")!=null){
				res_photo = multi.getFilesystemName("re_photo");
			}
			
			replyTo.setRe_photo(res_photo);
			
			ReplyDAO redao = new ReplyDAO();
			int flag = redao.writeOk(replyTo);
			
			request.setAttribute("flag", flag);
			request.setAttribute("res_seq", res_seq);
			request.setAttribute("user_seq", user_seq);
			request.setAttribute("user_admin", user_admin);
			
		} catch (NumberFormatException e) {
			System.out.println("에러 : " + e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());
		}
	}

}
