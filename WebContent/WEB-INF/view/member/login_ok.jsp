<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int check = (Integer)request.getAttribute("flag");
	
	if(check == 1){
		session.setAttribute("user_seq", request.getAttribute("user_seq"));
		session.setAttribute("user_admin", request.getAttribute("user_admin"));
		session.setAttribute("user_nickname", request.getAttribute("user_nickname"));
		response.sendRedirect("index.do");
	}else if(check == 0){
%>	
	<script>
		alert("비밀번호가 틀립니다.");
		history.back();
	</script>
<%
	}else{
%>	
	<script>
		alert("없는 아이디 입니다.");
		history.back();
	</script>
<%
	}
%>
