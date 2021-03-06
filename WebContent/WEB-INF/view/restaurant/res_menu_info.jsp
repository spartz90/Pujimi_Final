<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.co.pujimi.dao.LikeDAO"%>
<%@ page import="kr.co.pujimi.dto.ResTO"%>
<%@ page import="java.util.ArrayList"%>

<%
	request.setCharacterEncoding("utf-8");

	String member_seq = request.getParameter("user_seq");
	String member_admin = request.getParameter("user_admin");
	
	ArrayList<ResTO> recom_lists = (ArrayList)request.getAttribute("recom_lists");
	
	StringBuffer recom_result = new StringBuffer();

	for (ResTO resTo : recom_lists) {

		int res_seq = resTo.getRes_seq();
		
		ResTO resTo2 = new ResTO();
		resTo2.setUser_seq(Integer.parseInt(member_seq));
		resTo2.setRes_seq(res_seq);
		
		LikeDAO lDao = new LikeDAO();
		int chk = lDao.checkOk(resTo2);
		
		
		String res_name = resTo.getRes_name();
		if(res_name.length() > 11 ){
			res_name = res_name.substring(0, 11)+"...";
		}
		String res_addr = resTo.getRes_addr();
		String res_phone = resTo.getRes_phone();
		String res_octime = resTo.getRes_octime();
		String otime = res_octime.substring(0, 8);
		String ctime = res_octime.substring(9);
		String res_content = resTo.getRes_content();
		String res_photo = resTo.getRes_photo();
		String res_price = Integer.toString(resTo.getRes_price());
		String res_grade = Double.toString(Math.round(resTo.getRes_grade()*100)/100.0);

		
		String res_sells = Integer.toString(resTo.getRes_sells());
		String res_likes = Integer.toString(resTo.getRes_likes());
		
		recom_result.append("	<div class='recommend_cooperate'>");
		recom_result.append("		<div class='recommend_cooperate_main'>");
		recom_result.append("			<a href='res_view.restaurant?res_seq=" + res_seq + "&user_seq=" + member_seq + "&user_admin=" + member_admin + "' style='padding: 0px; position:relative; overflow:hidden; padding-top:52%'><img src='upload/" + res_photo + "' alt=''></a>'");
		recom_result.append("			<a href='res_view.restaurant?res_seq=" + res_seq + "&user_seq=" + member_seq + "&user_admin=" + member_admin + "' style='float:right'><h2 style='float:left'>" + res_name + "</h2><h2 style='float: right;'><i class='md md-star' style='color: #ff9800;'></i>"+res_grade+"</h2></a>");
		recom_result.append("		</div>");
		recom_result.append("		<div class='recommend_cooperate_detail'>");
		recom_result.append("			<ul>");
		recom_result.append("				<li><i class='md md-room'></i>" +  res_addr + "</li>");
		recom_result.append("				<li><i class='md md-aspect-ratio'></i>" +  res_price + "</li>	");
		recom_result.append("				<li><i class='md md-schedule'></i>" + otime +  "-"  + ctime + "</li>");
		recom_result.append("			</ul>");
		recom_result.append("			<ul class='recommend_cooperate_detail_follow'>");
		recom_result.append("				<li>구매 : " + res_sells + "</li>");
		recom_result.append("				<li idx='lcR"+res_seq+"'>좋아요 : " + res_likes +"</li>");
		recom_result.append("			</ul>");
		recom_result.append("			<ul class='recommend_cooperate_detail_follow_click'>");
		recom_result.append("				<li><a href='coupon_buy.coupon?res_seq=" + res_seq + "&user_seq=" + member_seq + "&user_admin=" + member_admin+ "'>구  매</a></li>");
		if (chk == 0) {
			recom_result.append("			<li><button idx='"+res_seq+"'>좋아요</button></li>");
		} else {
			recom_result.append("			<li style='background-color:#ff5b5b'><button idx='"+res_seq+"' style='background-color:#ff5b5b; border:none;'>좋아요</button></li>");
		}
		recom_result.append("			</ul>");
		recom_result.append("		</div>");
		recom_result.append("	</div>");
		
	}
	
	
	ArrayList<ResTO> lists = (ArrayList)request.getAttribute("menu_res_lists");	

	StringBuffer res_result = new StringBuffer();

	for (ResTO resTo : lists) {

		int res_seq = resTo.getRes_seq();
		
		ResTO resTo2 = new ResTO();
		resTo2.setUser_seq(Integer.parseInt(member_seq));
		resTo2.setRes_seq(res_seq);
		
		LikeDAO lDao = new LikeDAO();
		int chk = lDao.checkOk(resTo2);
		
		String res_name = resTo.getRes_name();
		if(res_name.length() > 8 ) {
			res_name = res_name.substring(0, 8)+"...";
		}
		
		String res_addr = resTo.getRes_addr();
		
		if(res_addr.length() > 9) {
			res_addr = res_addr.substring(0, 9)+"...";
		}
		
		String res_photo = resTo.getRes_photo();
		String res_price = Integer.toString(resTo.getRes_price());
		String res_sells = Integer.toString(resTo.getRes_sells());
		String res_likes = Integer.toString(resTo.getRes_likes());
		String res_grade = Double.toString(Math.round(resTo.getRes_grade()*100)/100.0);

		
		res_result.append("<div class='general_cooperate'>");
		res_result.append("	<div class='general_cooperate_main'>");
		res_result.append("		<a style='padding:0px; margin-top:10px; background-color:#ffffff;' href='res_view.restaurant?res_seq=" + res_seq + "&user_seq=" + member_seq + "&user_admin=" + member_admin + "'><img src='" + "./upload/" + res_photo + "' alt=''></a>");
		res_result.append("		<a href='res_view.restaurant?res_seq=" + res_seq + "&user_seq=" + member_seq + "&user_admin=" + member_admin + "' style='float:right;'><h2 style='float:left'>"+res_name+"</h2><h2 style='float: right;''><i class='md md-star' style='color: #ff9800;''></i>" + res_grade + "</h2></a>");
		res_result.append("	</div>");
		res_result.append("	<div class='general_cooperate_detail'>");
		res_result.append("		<ul class='general_cooperate_detail_info'>");						
		res_result.append("			<li><i class='md md-room'></i>" +  res_addr + "</li>");
		res_result.append("			<li><i class='md md-aspect-ratio'></i>" +  res_price + "</li>");
		res_result.append("		</ul>");
		res_result.append("		<ul class='general_cooperate_detail_follow'>");
		res_result.append("			<li>구매 : " + res_sells + "</li>");
		res_result.append("			<li idx='lcG"+res_seq+"'>좋아요 : " + res_likes +"</li>");
		res_result.append("		</ul>");
		res_result.append("		<ul class='general_cooperate_detail_follow_click'>");
		res_result.append("			<li><a href='coupon_buy.coupon?res_seq=" + res_seq + "&user_seq=" + member_seq + "&user_admin=" + member_admin+ "'>구  매</a></li>");
		if (chk == 0) {
			res_result.append("			<li><button idx='"+res_seq+"'>좋아요</button></li>");
		} else {
			res_result.append("			<li style='background-color:#ff5b5b'><button idx='"+res_seq+"' style='background-color:#ff5b5b; border:none;'>좋아요</button></li>");
		}
		res_result.append("		</ul>");
		res_result.append("	</div>");
		res_result.append("</div>");
	}
%>


<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>푸짐이</title>

<!-- Vendor CSS -->
<link href="vendors/fullcalendar/fullcalendar.css" rel="stylesheet">
<link href="vendors/animate-css/animate.min.css" rel="stylesheet">
<link href="vendors/sweet-alert/sweet-alert.min.css" rel="stylesheet">
<link href="vendors/material-icons/material-design-iconic-font.min.css"
	rel="stylesheet">
<link href="vendors/socicon/socicon.min.css" rel="stylesheet">
<!-- <link rel="shortcut icon" type="image/x-icon" href="http://blog.naver.com/favicon.ico?2"> -->

<!-- CSS -->
<link href="css/app.min.1_test.css" rel="stylesheet">
<link href="css/app.min.2_test.css" rel="stylesheet">


</head>
<body class="toggled sw-toggled">
	<div class="gongbak"></div>
    	<div>
    		<jsp:include page="../template/top_side.jsp" >
    		<jsp:param name="user_seq" value="<%=member_seq %>" />
    		<jsp:param name="user_admin" value="<%=member_admin %>" />
    		</jsp:include>
    	</div>   
	<section id="content">
		<div class="container">
			<div class="block-header">
				<h2>추천 제휴점</h2>
				최근 가장 핫한 점심 뷔페를 추천해드립니다.
			</div>

			<div class="row">
				<div id="slidebox">
					<div id="slider">
						<%=recom_result %>
					</div>
				</div>
				
				<div class="clearfix"></div>
					<div align="center">
					<ul class="fw-footer pagination wizard">
						<li class="previous" id="previous"><a class="a-prevent" href=""><i
									class="md md-chevron-left"></i></a></li>
						<li class="next" id="next"><a class="a-prevent" href=""><i
								class="md md-chevron-right"></i></a></li>
					</ul>
				</div>
			</div>
			<a onclick="checkLogin"></a>
			<div class="block-header">
				<h2>제휴점 정보</h2>
				다양한 메뉴, 저렴한 가격과 정확한 위치를 참고하세요.<br /> 
				관심매장을 설정해보세요.
			</div>
			<div class="row">
				<%=res_result%>
			</div>
		</div>
	</section>

	<!-- Older IE warning message -->
	<!--[if lt IE 9]>
            <div class="ie-warning">
                <h1 class="c-white">IE SUCKS!</h1>
                <p>You are using an outdated version of Internet Explorer, upgrade to any of the following web browser <br/>in order to access the maximum functionality of this website. </p>
                <ul class="iew-download">
                    <li>
                        <a href="http://www.google.com/chrome/">
                            <img src="img/browsers/chrome.png" alt="">
                            <div>Chrome</div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.mozilla.org/en-US/firefox/new/">
                            <img src="img/browsers/firefox.png" alt="">
                            <div>Firefox</div>
                        </a>
                    </li>
                    <li>
                        <a href="http://www.opera.com">
                            <img src="img/browsers/opera.png" alt="">
                            <div>Opera</div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.apple.com/safari/">
                            <img src="img/browsers/safari.png" alt="">
                            <div>Safari</div>
                        </a>
                    </li>
                    <li>
                        <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                            <img src="img/browsers/ie.png" alt="">
                            <div>IE (New)</div>
                        </a>
                    </li>
                </ul>
                <p>Upgrade your browser for a Safer and Faster web experience. <br/>Thank you for your patience...</p>
            </div>   
        <![endif]-->

		<!-- Javascript Libraries -->
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
        <script src="vendors/fullcalendar/lib/moment.min.js"></script>
        <script src="vendors/fullcalendar/fullcalendar.min.js"></script>        
        <script src="vendors/nicescroll/jquery.nicescroll.min.js"></script>
        <script src="vendors/waves/waves.min.js"></script>
        <script src="vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
        <script src="vendors/sweet-alert/sweet-alert.min.js"></script>
  
        <script src="js/functions.js"></script>
        <script src="js/demo.js"></script>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js"></script>
        
        <script type="text/javascript">
        	$(document).ready(function() {
				var r_c_amount = document.getElementsByClassName("recommend_cooperate").length;
				//var r_c_width = $('.recommend_cooperate').width();
				//var slider_width = $('#slider').width();
				//alert(r_c_width*r_c_amount);
				$('#slider').css("width", (r_c_amount+1)*100+'%');
				$('.recommend_cooperate').css("width", 100/(r_c_amount+1)+'%');
				
				(function () {
					var current = 0;
					var max = 0;
					var container;
					var interval;
					
					function init() {
						container = jQuery("#slider");
						max = container.children().length;
						events();
						
						container.css('margin-left', -100+'%');
						container.prepend(container.children()[max-1]);
						interval = setInterval(next, 5000);
					}
					function events() {
						jQuery('#previous').on('click', prev);
						jQuery('#next').on('click', next);
					}
					function prev(e) {
						current--;
						if (current < 0 ) current=max-1;
						animate('prev');
					}
					function next(e) {
						current++;
						if (current > max-1) current=0;
						animate('next');	
					}
					function animate( $direction ) {
						clearInterval(interval);
						interval = setInterval(next, 5000);
						
						if ($direction == "next") {
							container.append(container.children()[0]);
							jQuery(container.children()[0]).css('margin-left',$('#slidebox').width());
							TweenMax.to(container.children()[0],0.8,{marginLeft:0, ease:Expo.easeOut});							
						} else if ($direction == "prev") {
							container.prepend(container.children()[max-1]);
							jQuery(container.children()[0]).css('margin-left',$('#slidebox').width()*-1);
							TweenMax.to(container.children()[0],0.8,{marginLeft:0, ease:Expo.easeOut});
						}
					}
					
					jQuery(document).ready(init);
				})();
				
				// 좋아요 기능 //
				$('button').on('click', function() {
					var user_seq = <%=member_seq %>;
					var res_seq = $(this).attr('idx');
					if (user_seq == -1) {
						alert("로그인이 필요합니다.")
						return false;
					}
					$.ajax({
						url: './checkOk.like',
						type: 'post',
						data: {
							user_seq: user_seq,
							res_seq: $(this).attr('idx'),
						},
						dataType: 'json',
						success: function(json) {
							if(json.flag == 0) {
								//alert("좋아요 했습니다.");
								$('button[idx="' + res_seq +'"]').parent().css('background-color','#ff5b5b');
								$('button[idx="' + res_seq +'"]').css('background-color','#ff5b5b');
								
								//좋아요 숫자 1증가
								var likeText = $("li[idx='lcR"+res_seq+"']").text().split(" : ");
								var likeNum = Number(likeText[1])+1;
								$("li[idx='lcR"+res_seq+"']").text("좋아요 : " + likeNum);
								
								likeText = $("li[idx='lcG"+res_seq+"']").text().split(" : ");
								var likeNum = Number(likeText[1])+1;
								$("li[idx='lcG"+res_seq+"']").text("좋아요 : " + likeNum);
								
							} else {
								//alert("좋아요를 해제했습니다.")
								$('button[idx="' + res_seq +'"]').parent().css('background-color','#01B0F0');
								$('button[idx="' + res_seq +'"]').css('background-color','#01B0F0');
								
								//좋아요 숫자 1감소
								var likeText = $("li[idx='lcR"+res_seq+"']").text().split(" : ");
								var likeNum = Number(likeText[1])-1;
								$("li[idx='lcR"+res_seq+"']").text("좋아요 : " + likeNum);
								
								likeText = $("li[idx='lcG"+res_seq+"']").text().split(" : ");
								var likeNum = Number(likeText[1])-1;
								$("li[idx='lcG"+res_seq+"']").text("좋아요 : " + likeNum);
							}
						},
						error : function(xhr, status, error) {
							alert('에러:' + status + '\n\n' + error);
						}
					})
				});
			});
        </script>
           <footer>
      <div>
         <div class="pujimiFooter"> Copyright 2016, Pujimi All Rights Reserved</div>
      </div>
   </footer>
</body>
</html>