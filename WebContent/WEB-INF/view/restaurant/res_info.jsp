<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.pujimi.dto.ResTO"%>
<%@ page import="java.util.ArrayList"%>

<%
	request.setCharacterEncoding("utf-8");

	String member_seq = request.getParameter("user_seq");
	String member_admin = request.getParameter("user_admin");
	
	ArrayList<ResTO> lists = (ArrayList)request.getAttribute("res_lists");	

	StringBuffer result = new StringBuffer();

	int cnt = 1;

	for (ResTO resTo : lists) {

		int res_seq = resTo.getRes_seq();

		String res_name = resTo.getRes_name();
		String res_addr = resTo.getRes_addr();
		String res_phone = resTo.getRes_phone();
		String res_octime = resTo.getRes_octime();
		String otime = res_octime.substring(0, 8);
		String ctime = res_octime.substring(9);
		String res_content = resTo.getRes_content();
		String res_photo = resTo.getRes_photo();

		result.append("<div class='general_cooperate'>");
		result.append("	<div class='general_cooperate_main'>");
		result.append("		<a style='padding:0px; margin-top:10px; background-color:#ffffff;' href='res_view.restaurant?res_seq=" + res_seq + "&user_seq=" + member_seq + "&user_admin=" + member_admin + "'><img src='" + "./upload/" + res_photo + "' alt=''></a>");
		result.append("		<a href='res_view.restaurant?res_seq=" + res_seq + "&user_seq=" + member_seq + "&user_admin=" + member_admin + "'>"+res_name+"</a>");
		result.append("	</div>");
		result.append("	<div class='general_cooperate_detail'>");
		result.append("		<ul class='general_cooperate_detail_info'>");						
		result.append("			<li><i class='md md-room'></i> 서울 강남구 </li>");
		result.append("			<li><i class='md md-aspect-ratio'></i> 5000원 </li>");
		result.append("		</ul>");
		result.append("		<ul class='general_cooperate_detail_follow'>");
		result.append("			<li>589 구 매</li>");
		result.append("			<li>8545 좋아요</li>");
		result.append("		</ul>");
		result.append("		<ul class='general_cooperate_detail_follow_click'>");
		result.append("			<li><a href=''>구  매</a></li>");
		result.append("			<li><button id='"+res_seq+"'>좋아요</button></li>");
		result.append("		</ul>");
		result.append("	</div>");
		result.append("</div>");
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
						<div class="recommend_cooperate">
							<div class="recommend_cooperate_main">
								<a href="" style="padding: 0px;"><img src="img/widgets/preview.jpg" alt=""></a>
								<a href=""><h2>삿포로</h2></a>
							</div>
							<div class="recommend_cooperate_detail">
								<ul>						
									<li><i class="md md-room"></i> 서울 강남구 역삼동 818</li>
									<li><i class="md md-aspect-ratio"></i> 5000원 </li>										
									<li><i class="md md-schedule"></i> 10:00AM - 10:00PM</li>
								</ul>
								<ul class="recommend_cooperate_detail_follow">
									<li>589 구매</li>
									<li>8545 좋아요</li>
								</ul>
								<ul class="recommend_cooperate_detail_follow_click">
									<li><a href="">구  매</a></li>
									<li><a href="">좋아요</a></li>
								</ul>
							</div>
						</div>
						<div class="recommend_cooperate">
							<div class="recommend_cooperate_main">
								<a href="" style="padding: 0px;"><img src="img/widgets/preview.jpg" alt=""></a>
								<a href=""><h2>삿포로12</h2></a>
							</div>
							<div class="recommend_cooperate_detail">
								<ul>						
									<li><i class="md md-room"></i> 서울 강남구 역삼동 818</li>
									<li><i class="md md-aspect-ratio"></i> 5000원 </li>										
									<li><i class="md md-schedule"></i> 10:00AM - 10:00PM</li>
								</ul>
								<ul class="recommend_cooperate_detail_follow">
									<li>589 구매</li>
									<li>8545 좋아요</li>
								</ul>
								<ul class="recommend_cooperate_detail_follow_click">
									<li><a href="">구  매</a></li>
									<li><a href="">좋아요</a></li>
								</ul>
							</div>
						</div>
						<div class="recommend_cooperate">
							<div class="recommend_cooperate_main">
								<a href="" style="padding: 0px;"><img src="img/widgets/preview.jpg" alt=""></a>
								<a href=""><h2>삿포로123</h2></a>
							</div>
							<div class="recommend_cooperate_detail">
								<ul>						
									<li><i class="md md-room"></i> 서울 강남구 역삼동 818</li>
									<li><i class="md md-aspect-ratio"></i> 5000원 </li>										
									<li><i class="md md-schedule"></i> 10:00AM - 10:00PM</li>
								</ul>
								<ul class="recommend_cooperate_detail_follow">
									<li>589 구매</li>
									<li>8545 좋아요</li>
								</ul>
								<ul class="recommend_cooperate_detail_follow_click">
									<li><a href="">구  매</a></li>
									<li><a href="">좋아요</a></li>
								</ul>
							</div>
						</div>
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

			<div class="block-header">
				<h2>제휴점 정보</h2>
				다양한 메뉴, 저렴한 가격과 정확한 위치를 참고하세요.<br /> 
				관심매장을 설정해보세요.
			</div>
			<div class="row">
				<%=result%>
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
					$.ajax({
						url: './checkOk.like',
						type: 'post',
						data: {
							user_seq: user_seq,
							res_seq: $(this).attr('id'),
						},
						dataType: 'json',
						success: function(json) {
							if(json.flag == 0) {
								alert("아직 ㄴㄴ")
							} else {
								alert("이미 ㅇㅇ");
							}
						},
						error : function(xhr, status, error) {
							alert('에러:' + status + '\n\n' + error);
						}
					})
				});
				/*
				var deleteServer = function() {
					$.ajax({
						url: './delete_ok.do',
						type: 'post',
						data: {
							seq: $('#d_seq').val(),
							password: $('#d_password').val(),
						},
						dataType: 'json',
						success: function(json) {
							if(json.flag == 0) {
								alert("글삭제 성공");
								$('#d_password').val("");
								$('#deleteDialog').dialog('close');
								readServer();
							} else {
								alert("글쓰기 실패");
							}
						},
						error : function(xhr, status, error) {
							alert('에러:' + status + '\n\n' + error);
						}
					})
				};*/
			
			});
        </script>




</body>
</html>