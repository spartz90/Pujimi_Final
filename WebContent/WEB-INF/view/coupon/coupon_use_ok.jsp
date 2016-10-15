<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int flag = (Integer)request.getAttribute("flag");
	int user_seq = (Integer)request.getAttribute("user_seq");
	int user_admin = (Integer)request.getAttribute("user_admin");
	
	if(flag == 1) {
		out.println("<script type='text/javascript'>");
		out.println("alert('쿠폰 사용처리가 완료되었습니다!')");
		out.println("location.href='res_coupon.coupon?user_seq=" + user_seq + "&user_admin=" + user_admin +"';");
		out.println("</script>");
	} else {
		out.println("<script type='text/javascript'>");
		out.println("alert('쿠폰 사용에 실패했습니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
%>	

