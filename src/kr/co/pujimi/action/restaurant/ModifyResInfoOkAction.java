package kr.co.pujimi.action.restaurant;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.pujimi.core.Action;
import kr.co.pujimi.dao.ResDAO;
import kr.co.pujimi.dto.ResTO;

public class ModifyResInfoOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		try {
			//String uploadPath = "/home/hosting_users/tigger90/tomcat/webapps/ROOT/upload";
			// 경로 테스트 위가 서버용 / 아래는 개인 테스트용 
			String uploadPath = "C:/pujimi3/WebContent/testUpload";
			
			int maxFileSize = 1024 * 1024 * 5;
			String encoding = "utf-8";
			
			MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, encoding, new DefaultFileRenamePolicy());


			//데이터를 넣기 위한 BoardTO 선언 (transfer Object)
			ResTO resTo = new ResTO();
			resTo.setRes_name(multi.getParameter("res_name"));
			resTo.setRes_addr(multi.getParameter("res_addr"));
			resTo.setRes_phone(multi.getParameter("res_phone"));
			
			String opentime = multi.getParameter("res_otime");
			String closedtime = multi.getParameter("res_ctime");
			String res_octime = opentime + "-" + closedtime;	
			resTo.setRes_octime(res_octime);
			resTo.setRes_content(multi.getParameter("res_content"));
			resTo.setUser_seq(Integer.parseInt(multi.getParameter("user_seq")));
			resTo.setRes_seq(Integer.parseInt(multi.getParameter("res_seq")));
			
			resTo.setRes_latlng(multi.getParameter("latlng"));
			
			String res_photo = "noimage.png";
			
			if(multi.getFilesystemName("res_photo")!=null){
				res_photo = multi.getFilesystemName("res_photo");
			}
			
			resTo.setRes_photo(res_photo);
				
			ResDAO resDao = new ResDAO();
			int flag = resDao.resModifyOk(resTo);
			request.setAttribute("flag", flag);
			
		} catch (NumberFormatException e) {
			System.out.println("에러 : " + e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());
		}
		
	}
}
