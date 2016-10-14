<%@page import="kr.co.pujimi.dto.RatingTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="kr.co.pujimi.dto.ResTO" %>
<%@page import="kr.co.pujimi.dto.ReplyTO"%>
<%@page import="kr.co.pujimi.dao.ReplyDAO"%>

<%@ page import="java.util.ArrayList" %>

<%
	request.setCharacterEncoding( "utf-8");
	String member_seq = request.getParameter("user_seq");
	String member_admin = request.getParameter("user_admin");
	String res_seq = request.getParameter("res_seq");
	String re_seq = request.getParameter("re_seq");	
	
	ReplyTO reto = (ReplyTO)request.getAttribute("reto");
	
	String re_content = reto.getRe_content();
	String user_nickname = reto.getUser_nickname();
	int re_grade = (int)reto.getRe_grade();
	String re_photo = reto.getRe_photo();
	
	
%>
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>푸지미</title>

<!-- Vendor CSS -->
<link href="vendors/fullcalendar/fullcalendar.css" rel="stylesheet">
<link href="vendors/animate-css/animate.min.css" rel="stylesheet">
<link href="vendors/sweet-alert/sweet-alert.min.css" rel="stylesheet">
<link href="vendors/material-icons/material-design-iconic-font.min.css"
	rel="stylesheet">
<link href="vendors/socicon/socicon.min.css" rel="stylesheet">

<!-- CSS -->
<link href="css/app.min.1_test.css" rel="stylesheet">
<link href="css/app.min.2_test.css" rel="stylesheet">
<link href="css/wall.css" rel="stylesheet">

</head>
<body class="toggled sw-toggled">
	<div class="gongbak"></div>
    	<div>
    		<jsp:include page="../template/top_side.jsp" >
    		<jsp:param name="user_seq" value="<%=member_seq %>" />
    		<jsp:param name="user_admin" value="<%=member_admin %>" />
    		</jsp:include>
    	</div>   
	<section id="main">
		<!-- 배경색 지정  -->
		<section id="content">			
			<div class="row">
				<div class="container">
					<div class="col-md-12">
						<div class="block-header">
							<h2>
								후기 수정하기 <small>제휴점의 후기를 자유롭게 작성해보세요. </small>
							</h2>
							
						</div>
						
						<form action="modifyOk.reply" method="post" enctype="multipart/form-data" >
						<input type="hidden" name="user_seq" value="<%=member_seq%>"/>
						<input type="hidden" name="user_admin" value="<%=member_admin%>"/>
						<input type="hidden" name="res_seq" value="<%=res_seq%>"/>
						<input type="hidden" name="re_seq" value="<%=re_seq%>"/>
						<div class="card w-post">
							<div class="card-body">
								<textarea id="re_content" name="re_content" class="wp-text auto-size" placeholder="후기를 작성해주세요." ><%=re_content %></textarea>
								<!-- 버튼 위치 -->
								<div class="p-5" align="center" style="border-top: 1px solid #F0F0F0;">
								<br/>
									<label class="radio radio-inline">
                              				<input type="radio" name="rating" value="1" <%= re_grade == 1 ? "checked='checked'"  : "" %>>
                               			<i class="input-helper"></i>1<i class="md md-star"></i>
                           			</label>
									<label class="radio radio-inline">
                              				<input type="radio" name="rating" value="2" <%= re_grade == 2 ? "checked='checked'"  : "" %>>
                               			<i class="input-helper"></i>2<i class="md md-star"></i>
                           			</label>
									<label class="radio radio-inline">
                              				<input type="radio" name="rating" value="3" <%= re_grade == 3 ? "checked='checked'"  : "" %>>
                               			<i class="input-helper"></i>3<i class="md md-star"></i>
                           			</label>
									<label class="radio radio-inline">
                              				<input type="radio" name="rating" value="4" <%= re_grade == 4 ? "checked='checked'"  : "" %>>
                               			<i class="input-helper"></i>4<i class="md md-star"></i>
                           			</label>
									<label class="radio radio-inline">
                              				<input type="radio" name="rating" value="5" <%= re_grade == 5 ? "checked='checked'"  : "" %>>
                               			<i class="input-helper"></i>5<i class="md md-star"></i>
                           			</label>                            				
                           		</div>								
								
								<div class="tab-content p-0">
									<div class="wp-media tab-pane active" id="wpm-image">
										<p class="f-500 c-black m-b-20">사진 미리보기</p>
                           
                           				<div class="fileinput fileinput-exists" data-provides="fileinput">
                               				<div class="fileinput-preview thumbnail" data-trigger="fileinput">
                               					<img src="./upload/<%=re_photo%>">
                               				</div>
                            					<div>
                                  					<span class="btn btn-info btn-file">
                                       				<span class="fileinput-new">사진 선택</span>
                                       				<span class="fileinput-exists">사진 변경</span>                                        				
                                       				<input id="re_photo" type="file" name="re_photo">
                                   				</span>
                                   					<span class="btn btn-danger fileinput-exists" data-dismiss="fileinput">사진 삭제</span>                                    					
                               				</div>                                				
                           				</div>
                           			</div>
								</div>
									<div class="wp-actions clearfix">
									<div class="wpa-media-list pull-left">
										<a data-toggle="tab" href="#wpm-image" class="c-amber"> 
											<i class="md md-collections"></i><label style="font-size:13px">사진 첨부</label>
										</a> 
									</div>
										<button type="submit" class="btn btn-primary btn-sm pull-right">수정</button>
								</div>
								</div>
							</div>
						</form>					
					</div>
				</div>
			</div>
			
		</section>

<!--  
		<footer id="footer">
			Copyright &copy; 2015 Material Admin

			<ul class="f-menu">
				<li><a href="">Home</a></li>
				<li><a href="">Dashboard</a></li>
				<li><a href="">Reports</a></li>
				<li><a href="">Support</a></li>
				<li><a href="">Contact</a></li>
			</ul>
		</footer>
-->

		<!-- Page Loader -->
		<!-- 일단 보류 필요한 기능인지 체크해봄 
        <div class="page-loader">
            <div class="preloader pls-blue">
                <svg class="pl-circular" viewBox="25 25 50 50">
                    <circle class="plc-path" cx="50" cy="50" r="20" />
                </svg>

                <p>Please wait...</p>
            </div>
        </div>
        
         -->


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

	<script src="vendors/flot/jquery.flot.min.js"></script>
	<script src="vendors/flot/jquery.flot.resize.min.js"></script>
	<script src="vendors/flot/plugins/curvedLines.js"></script>
	<script src="vendors/sparklines/jquery.sparkline.min.js"></script>
	<script src="vendors/easypiechart/jquery.easypiechart.min.js"></script>

	<script src="vendors/fullcalendar/lib/moment.min.js"></script>
	<script src="vendors/fullcalendar/fullcalendar.min.js"></script>
	<script src="vendors/simpleWeather/jquery.simpleWeather.min.js"></script>
	<script src="vendors/auto-size/jquery.autosize.min.js"></script>
	<script src="vendors/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="vendors/waves/waves.min.js"></script>
	<script src="vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
	<script src="vendors/sweet-alert/sweet-alert.min.js"></script>
	<script src="vendors/fileinput/fileinput.min.js"></script>

	<script src="js/flot-charts/curved-line-chart.js"></script>
	<script src="js/flot-charts/line-chart.js"></script>
	<script src="js/charts.js"></script>

	
	<script src="js/functions.js"></script>
	<script src="js/demo.js"></script>
</body>
</html>