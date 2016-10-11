<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String res_seq = request.getAttribute("res_seq").toString();
	int flag = (Integer)request.getAttribute("flag");
	
	out.println("<script type='text/javascript'>");
	if(flag==0){
		System.out.println(flag);
		out.println("alert('댓글 작성에 성공했습니다.')");
		out.println("location.href = 'res_view.restaurant?res_seq='" + res_seq + ";");
	}else{
		out.println("alert('댓글 작성에 실패했습니다.')");		
		out.println("history.back();");
	}
	out.println("</script>");
%>

