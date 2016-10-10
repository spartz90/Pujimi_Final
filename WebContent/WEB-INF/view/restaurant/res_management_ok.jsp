<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int flag = (Integer)request.getAttribute("flag");
	
	out.println("<script type='text/javascript'>");
	if(flag==0){
		System.out.println(flag);
		out.println("alert('가게정보 수정에 성공했습니다.')");
		out.println("location.href = 'index.jsp';");
	}else{
		out.println("alert('가게정보 수정에 실패했습니다.')");		
		out.println("history.back();");
	}
	out.println("</script>");
%>




























