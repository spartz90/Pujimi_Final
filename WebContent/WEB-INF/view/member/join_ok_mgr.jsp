<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		int check = (Integer)request.getAttribute("flag");
		if(check == 0){
%>
		<script type="text/javascript">
			alert("회원가입을 축하합니다!\n다시 로그인해주세요!");
			location.href="index.do";
		</script>
<%
%> 
		<script type="text/javascript">
			
		</script>
<%
		}else{
%>	
			<script>
				alert("회원가입에 실패했습니다.");
				history.back();
			</script>
<%
		}
%>
	

