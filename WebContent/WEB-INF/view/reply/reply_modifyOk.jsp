<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String res_seq = request.getAttribute("res_seq").toString();
	String user_seq = request.getAttribute("user_seq").toString();
	String user_admin = request.getAttribute("user_seq").toString();
	
	int flag = (Integer)request.getAttribute("flag");
	
	
	out.println("<script type='text/javascript'>");
	if(flag==1){
		System.out.println(flag);
		out.println("alert('댓글 수정에 성공했습니다.')");
		out.println("location.href = 'res_view.restaurant?res_seq=" + res_seq + "&user_seq=" + user_seq + "&user_admin=" + user_admin + "';");
	}else{
		out.println("alert('수정 권한이 없습니다.')");		
		out.println("history.back();");
	}
	out.println("</script>");
%>

