<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="kr.co.pujimi.dao.JoinDAO" %>
<%@ page import ="kr.co.pujimi.dto.UserTO" %>


<%
	request.setCharacterEncoding("utf-8");
	String user_seq = "";
	String user_admin = "-1";

	if(request.getParameter("user_seq").equals("-1")){
		user_seq = "-1";
	}else{
		user_seq = request.getParameter("user_seq");
		user_admin = request.getParameter("user_admin");
	}

%>

        <header id="header" class="search-toggled">
        	<div class="pujimi_menu-logo">
        		<div class="pujimi_logo"><a href="index.do"><img src="img/pujimi_main_kor.png"></a></div>
        		<div class="pujimi_mlogo"><a href="index.do"><img src="img/pujimi_main_mobile_kor.png"></a></div>
        		<div id="menu-trigger" data-trigger="#sidebar">
	                <div class="line-wrap">
	                    <div class="line top"></div>
	                    <div class="line center"></div>
	                    <div class="line bottom"></div>
	                </div>
	            </div>
	            <div class="mobile_lojocoo">
	                <img src="img/icons/ellipsis@2x.png">
	            </div>
        	</div>
        	<div class="lojocoo">
	        	<ul>
	        		<%
	  					if(user_seq.equals("-1")){
	  				%>
	        		<li><a href="login.member"> 로그인  </a></li>
	        		<li><a href="join.member"> 회원가입  </a></li>
	        		<%
						}else{
	        		%>
	        		<li><a href="logout.member"> 로그아웃 </a></li>
	        		<li><a href="modify_info.member?user_seq=<%=user_seq %>"> 회원정보수정 </a></li>
	        		<%
						}
	        		%>
	        		<li><a href="cooperate.coop?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>">제휴조르기</a></li>
	        	</ul>
	      	</div>
        	<div id="top-search-wrap">
                <input type="text">
            </div>

            <div id="tab">
	        	<ul class="header-menu">
	        		<li><a href="index.do"><i class="md md-home"></i>Home</a></li>
					<li><a href="res_info.restaurant?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>"><i class="md md-local-restaurant"></i>식당 정보</a></li>
					<!-- <li><a><i class="md md-today"></i>이벤트 캘린더</a></li> -->
					<li><a href="charge_point.charge?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>"><i class="md md-local-atm"></i>포인트 충전</a></li>
					<%
                    	if(user_admin.equals("-1") || user_admin.equals("0")){
                    %>
					<li><a><i class="md md-perm-identity"></i>마이페이지</a>
						<ul>
							<li><a href="mycoupon.coupon?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>">내쿠폰</a></li>
							<li><a href="likeMenu.likeMenu?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>">식단 관리</a></li>
							<li><a href="inter_res.restaurant?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>">관심 가게</a></li>
						</ul>
					</li>
					<%
                    	}
						if(user_admin.equals("1")){
					%>
					<li><a href=""><i class="md md-perm-identity"></i>식당 관리자</a>
						<ul>
							<li><a href="res_chart.jsp">매출 정보</a></li>
	                        <li><a href="res_management.restaurant?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>">가게 정보 관리</a></li>
	                        <!-- <li><a href="rest_calendar.html">캘린더</a></li>  -->
	                        <li><a href="rest_view.jsp">댓글/후기</a></li>
						</ul>
					</li>
					<%
						}
						if(user_admin.equals("2")){
					%>
					<li><a href=""><i class="md md-perm-identity"></i>푸지미 관리자</a>
						<ul>
	                        <li><a href="manage_user.admin?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>">회원관리</a></li>
	                        <li><a href="manage_rest.admin?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>">제휴점관리</a></li>
						</ul>
					</li>
					<%
						}
					%>
				</ul>
       	 	</div>
        </header>
        
        <section id="main">
        	<div class="mobile-menu-drop">
        		<div id="top-search-wrap-mobile">
		                <input type="text">
		        </div>
       	 		<ul>
       	 			<li><a href="index.do">Home</a></li>
					<li><a href="res_info.restaurant?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>">식당 정보</a></li>
					<!-- <li><a>이벤트 캘린더</a></li> -->
					<li><a href="charge_point.charge?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>">포인트 충전</a></li>
					<%
                    	if(user_admin.equals("-1") || user_admin.equals("0")){
                    %>
					<li class="m-m-d-m"><a>마이페이지</a></li>
       	 		</ul>
       	 		<div class="mobile-menu-drop-my">
       	 			<ul>
						<li><a href="mycoupon.coupon?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>">내쿠폰</a></li>
						<li><a href="likeMenu.likeMenu?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>">식단 관리</a></li>
						<li><a href="inter_res.restaurant?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>">관심 가게</a></li>
					<%
                   		}
						if(user_admin.equals("1")){
					%>
					<li class="m-m-d-m"><a>마이페이지</a></li>
       	 		</ul>
       	 		<div class="mobile-menu-drop-my">
       	 			<ul>
       	 				<li><a href="res_chart.jsp">매출 정보</a></li>
                        <li><a href="res_management.restaurant?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>">가게 정보 관리</a></li>
                        <!-- <li><a href="rest_calendar.html">캘린더</a></li>  -->
                        <li><a href="rest_view.jsp">댓글, 후기 모아보기</a></li>
       	 			<%
						}
						if(user_admin.equals("2")){
       	 			%>
					<li class="m-m-d-m"><a>마이페이지</a></li>
       	 		</ul>
       	 		<div class="mobile-menu-drop-my">
       	 			<ul>
                        <li><a href="manage_user.admin?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>">회원관리</a></li>
                        <li><a href="manage_rest.admin?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>">제휴점관리</a></li>
                    <%
						}
                    %>
					</ul>
       	 		</div>
       	 	</div>
       	 	<div class="mobile-lojocoo-drop">
       	 		<ul>
	        		<%
	  					if(user_seq.equals("-1")){
	  				%>
	       	 		<li><a href="login.member"> 로그인  </a></li>
	       	 		<li><a href="join.member"> 회원가입 </a></li>
	       	 		<li><a href="cooperate.coop?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>"> 제휴 조르기 </a></li>
	       	 		<%
	  					}else{
	        		%>
	       	 		<li><a href="modify_info.member?user_seq=<%=user_seq %>">회원정보수정</a></li>
	       	 		<li><a href="cooperate.coop?user_seq=<%=user_seq %>&user_admin=<%=user_admin %>"> 제휴 조르기</a></li>
	       	 		<li><a href="logout.member">로그아웃</a></li>
	       	 		<%
	  					}
	       	 		%>
	       	 		
       	 		</ul>
       	 	</div>
        </section>