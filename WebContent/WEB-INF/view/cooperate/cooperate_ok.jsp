<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int flag = (Integer)request.getAttribute("flag");
	
	if(flag == 0) {
		out.println("<script type='text/javascript'>");
		out.println("alert('의견 감사합니다.')");
		out.println("location.href='index.do';");
		out.println("</script>");
	} else {
		out.println("<script type='text/javascript'>");
		out.println("alert('의견 제출이 실패됐습니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
%>	

