<!-- 데이터를 끌어와 db에 넣고 지나가는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int flag = (Integer)request.getAttribute("flag");
	String newPass = request.getAttribute("newPass").toString();
	
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('"+ newPass +"로 비밀번호가 변경되었습니다. 다시 로그인 해주세요.')");
		out.println("location.href = 'login.member';");
	} else if (flag == 1) {
		out.println("alert('이메일이 잘못되었습니다.')");
		out.println("history.back();");
	} else {
		out.println("alert('수정에 실패했습니다.')");
		out.println("history.back();");
	}
	out.println("</script>");
%>