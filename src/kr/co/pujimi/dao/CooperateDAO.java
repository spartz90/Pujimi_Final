package kr.co.pujimi.dao;


import javax.mail.Transport;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.Address;
import javax.mail.internet.MimeMessage;

import kr.co.pujimi.action.cooperate.MyAuth;
import kr.co.pujimi.dto.CooperateDTO;

import javax.mail.Session;
import javax.mail.Authenticator;
import java.util.Properties;

public class CooperateDAO {
	private String fromEmail;
	private String password;
	
	public CooperateDAO() {
		this.fromEmail = "hjpark2020@gmail.com";
		this.password = "p5879132~";
	}
	public int cooperateOk(CooperateDTO cdto){
		String toEmail = "hjpark99@naver.com";
		String fromName = cdto.getName();
		String subject = cdto.getRes_name() + "제휴 부탁합니다!";
		String content = "상호명 : " + cdto.getRes_name() + "\r\n" + "주소 : " + cdto.getRes_addr() + "\r\n" + "위치(위도,경도) : " + cdto.getLatlng() + "\r\n" + "\r\n" + cdto.getRes_content() + "\r\n"
						+ "보낸이 : " + cdto.getName() + "(" + cdto.getEmail() + ")";  
		System.out.println(toEmail + fromName + subject + content);
		int check = 1;
		try {
			// 정보를 담기 위한 객체
			Properties props = new Properties();

			// SMTP 서버의 계정 설정
			// Naver와 연결할 경우 네이버 아이디 지정
			// Google과 연결할 경우 본인의 Gmail 주소
			props.put("mail.smtp.user", "hjpark2020");

			// SMTP 서버 정보 설정
			// 네이버일 경우 smtp.naver.com
			// Google일 경우 smtp.gmail.com
			props.put("mail.smtp.host", "smtp.gmail.com");
			    
			// 아래 정보는 네이버와 구글이 동일하므로 수정하지 마세요.
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.debug", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
			
			MyAuth auth = new MyAuth(fromEmail, password);
			Session ses = Session.getInstance(props, auth);
			
		    // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
		    ses.setDebug(true);
		        
		    // 메일의 내용을 담기 위한 객체
		    MimeMessage msg = new MimeMessage(ses);

		    // 제목 설정
		    msg.setSubject(subject);
		        
		    // 보내는 사람의 메일주소
		    Address fromAddr = new InternetAddress(fromEmail);
		    msg.setFrom(fromAddr);
		        
		    // 받는 사람의 메일주소
		    Address toAddr = new InternetAddress(toEmail);
		    msg.addRecipient(Message.RecipientType.TO, toAddr);
		        
		    // 메시지 본문의 내용과 형식, 캐릭터 셋 설정
		    msg.setContent(content, "text/html;charset=UTF-8");
		        
		    // 발송하기
		    Transport.send(msg);
			check = 0;
		} catch (Exception mex) {
			// TODO Auto-generated catch block
			mex.printStackTrace();
		} 
		return check;
	}
}
