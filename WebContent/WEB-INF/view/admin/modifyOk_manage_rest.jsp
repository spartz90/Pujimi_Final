<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.pujimi.dto.ResTO"%>
    
<%
	int flag = (Integer)request.getAttribute("flag");
	ResTO resTo = new ResTO();
	
	String user_seq = Integer.toString(resTo.getUser_seq());
	String user_admin = (String)request.getAttribute("user_admin");
	
	out.println("<script type='text/javascript'>");
	if(flag==0){
		System.out.println(flag);
		out.println("alert('가게정보 수정에 성공했습니다.')");
		out.println("location.href = 'manage_rest.admin?user_seq="+user_seq+ "&user_admin=" + user_admin +"'");
	}else{
		out.println("alert('가게정보 수정에 실패했습니다.')");		
		out.println("history.back();");
	}
	out.println("</script>");

%>