<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.pujimi.dto.ResTO" %>
<%@ page import="java.util.ArrayList" %>

<%
	request.setCharacterEncoding( "utf-8");
	
	ResTO resTo	= (ResTO)request.getAttribute("resTo");
	String member_seq = request.getParameter("user_seq");
	String member_admin = request.getParameter("user_admin");
	
	String res_name = resTo.getRes_name();
	String res_addr = resTo.getRes_addr();
	String res_phone = resTo.getRes_phone();
	String res_octime[] = resTo.getRes_octime().split("-");
	String otime = res_octime[0];
	String ctime = res_octime[1];
	String res_content = resTo.getRes_content();
	String res_photo = resTo.getRes_photo();	
	
	/*
	// 댓글 가져오기 아직 안함
	ReplyDAO rdao = new ReplyDAO();	
	ArrayList<ReplyDTO> lists = rdao.replyList(res_seq);
	StringBuffer result = new StringBuffer();
	
	for(ReplyDTO dto : lists){
		String reply_user_nickname = dto.getUser_nickname();
		String reply_date = dto.getReply_date();
		String reply_photo = dto.getReply_photo();
		String reply_content = dto.getReply_content();		
		
		result.append("<div class='card w-item'>");
		result.append("		<div class='card-header'>");
		result.append("			<div class='media'>");
		result.append("				<div class='pull-left'>");
		result.append("					<img class='avatar-img' src='img/profile-pics/1.jpg' alt=''>");
		result.append("				</div>");
		result.append("				<div class='media-body'>");
		result.append("					<h2>"+ reply_user_nickname +"<small>Posted on" + reply_date + "</small></h2>");
		result.append("				</div>");
		result.append("			</div>");
		result.append("		</div>");
		result.append("		<div class='card-body card-padding'>");
		result.append("			<div class='wi-preview lightbox clearfix'>");
		result.append("				<div class='wip-item' data-src='img/headers/4.png' style='background-image: url(img/headers/4.png);'>");
		result.append("					<div class='lightbox-item'></div>");
		result.append("				</div>");
		result.append("			</div>");
		result.append("			<p>" + reply_content + "</p>");
		result.append("			<div class='wi-stats clearfix'>");
		result.append("				<div class='wis-numbers'>");
		result.append("					<span><i class='zmdi zmdi-comments'></i> 36</span>");
		result.append("					<span class='active'><i class='zmdi zmdi-favorite'></i> 220</span>");
		result.append("				</div>");									
		result.append("			</div>");
		result.append("		</div>");							
		result.append("</div>");
	}
	*/
   	
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
			<div class="container">
			<div class="container container-alt">
				<div class="block-header">
				<br/>
					<h2>
						제휴점 상세 정보 <small>실제 식권 사용 고객들의 실시간 후기와 사진들을 확인해보세요. </small>
					</h2>

					<ul class="actions">
						<li><a href=""> <i class="zmdi zmdi-trending-up"></i>
						</a></li>
						<li><a href=""> <i class="zmdi zmdi-check-all"></i>
						</a></li>
						<li class="dropdown"><a href=""> <i
								class="zmdi zmdi-more-vert"></i>
						</a>

							<ul class="dropdown-menu dropdown-menu-right">
								<li><a href="">Refresh</a></li>
								<li><a href="">Manage Widgets</a></li>
								<li><a href="">Widgets Settings</a></li>
							</ul></li>
					</ul>
				</div>

				<div class="container">
					<div class="card blog-post">
						<div class="bp-header">
							<img src="./upload/<%=res_photo%>" alt="" style="width: 100%; height: 60%"> 
							<a href="" class="bp-title">
								<h2><%=res_name %></h2> 
								<small><%=res_content %></small>
							</a>
						</div>

						<div class="col-md-8">
							<div class="card profile-view">

								<div class="pv-body" style="margin-top: 10px;">

									<ul class="pv-contact">
										<br />
										<li><i class="md md-room"></i> <%=res_addr %></li>
										<li><i class="md md-phone"></i> <%=res_phone %></li>										
									</ul>
									<ul class="pv-contact">
										<br />
										<li><i class="md md-schedule"></i> <%=otime %> - <%=ctime %></li>
									</ul>
									<ul class="pv-follow">
										<li>589 구매</li>
										<li>8545 좋아요</li>
									</ul>

									<a href="" class="pv-follow-btn">구매 하기</a><br /> 
									<a href="" class="pv-follow-btn">좋아요</a>
								</div>
							</div>

							<div class="block-header">

								<h2>
									후기 작성하기 <small>제휴점의 후기를 자유롭게 작성해보세요. </small>
								</h2>

								<ul class="actions">									
									<li class="dropdown"><i	class="md md-more-vert"></i>
										<ul class="dropdown-menu dropdown-menu-right">
											<li><a href="">Refresh</a></li>
											<li><a href="">Manage Widgets</a></li>
											<li><a href="">Widgets Settings</a></li>
										</ul>
									</li>
								</ul>
							</div>

							<div class="card w-post">
								<div class="card-body">
									<textarea class="wp-text auto-size"	placeholder="Write Something..."></textarea>

									<div class="tab-content p-0">
										<div class="wp-media tab-pane" id="wpm-image">
											<p class="f-500 c-black m-b-20">Image Preview</p>
                            
                            				<div class="fileinput fileinput-new" data-provides="fileinput">
                                				<div class="fileinput-preview thumbnail" data-trigger="fileinput"></div>
                             					<div>
                                   					<span class="btn btn-info btn-file">
                                        				<span class="fileinput-new">Select image</span>
                                        				<span class="fileinput-exists">Change</span>
                                        				<input type="file" name="...">
                                    				</span>
                                    				<a href="#" class="btn btn-danger fileinput-exists" data-dismiss="fileinput">Remove</a>
                                				</div>
                            				</div>
                            			</div>
									</div>

									<div class="wp-actions clearfix">
										<div class="wpa-media-list pull-left">
											<a data-toggle="tab" href="#wpm-image" class="c-amber"> 
												<i class="md md-collections"></i>
											</a> 
										</div>

										<button class="btn btn-primary btn-sm pull-right">작성</button>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-4 hidden-sm hidden-xs"
							style="margin-top: 10px;">
							<div class="card rating-list">
								<div class="listview">
									<div class="lv-header">
										<div class="m-t-5">Average Rating 3.0</div>

										<div class="clearfix"></div>

										<div class="rl-star">
											<i class="md md-star active"></i> <i
												class="md md-star active"></i> <i class="md md-star active"></i>
											<i class="md md-star"></i> <i class="md md-star"></i>
										</div>
									</div>

									<div class="lv-body">
										<div class="p-15">
											<div class="lv-item">
												<div class="media">
													<div class="pull-left">
														1 <i class="md md-star"></i>
													</div>

													<div class="pull-right">20</div>

													<div class="media-body">
														<div class="progress">
															<div class="progress-bar progress-bar-danger"
																role="progressbar" aria-valuenow="20" aria-valuemin="0"
																aria-valuemax="100" style="width: 20%"></div>
														</div>
													</div>
												</div>
											</div>

											<div class="lv-item">
												<div class="media">
													<div class="pull-left">
														2 <i class="md md-star"></i>
													</div>

													<div class="pull-right">45</div>

													<div class="media-body">
														<div class="progress">
															<div class="progress-bar progress-bar-warning"
																role="progressbar" aria-valuenow="45" aria-valuemin="0"
																aria-valuemax="100" style="width: 45%"></div>
														</div>
													</div>
												</div>
											</div>

											<div class="lv-item">
												<div class="media">
													<div class="pull-left">
														3 <i class="md md-star"></i>
													</div>

													<div class="pull-right">60</div>

													<div class="media-body">
														<div class="progress">
															<div class="progress-bar progress-bar-warning"
																role="progressbar" aria-valuenow="60" aria-valuemin="0"
																aria-valuemax="100" style="width: 60%"></div>
														</div>
													</div>
												</div>
											</div>

											<div class="lv-item">
												<div class="media">
													<div class="pull-left">
														4 <i class="md md-star"></i>
													</div>

													<div class="pull-right">78</div>

													<div class="media-body">
														<div class="progress">
															<div class="progress-bar progress-bar-success"
																role="progressbar" aria-valuenow="78" aria-valuemin="0"
																aria-valuemax="100" style="width: 78%"></div>
														</div>
													</div>
												</div>
											</div>

											<div class="lv-item">
												<div class="media">
													<div class="pull-left">
														5 <i class="md md-star"></i>
													</div>

													<div class="pull-right">22</div>

													<div class="media-body">
														<div class="progress">
															<div class="progress-bar progress-bar-info"
																role="progressbar" aria-valuenow="22" aria-valuemin="0"
																aria-valuemax="100" style="width: 22%"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- 버튼 위치 -->
										<div class="p-5" align="center" style="border-top: 1px solid #F0F0F0;">
											<br/>
											<label class="radio radio-inline">
                               					<input type="radio" name="inlineRadioOptions" value="option1">
                                				<i class="input-helper"></i>1<i class="md md-star"></i>
                            				</label>
											<label class="radio radio-inline m-r-5 m-l-5">
                               					<input type="radio" name="inlineRadioOptions" value="option2">
                                				<i class="input-helper"></i>2<i class="md md-star"></i>
                            				</label>
											<label class="radio radio-inline m-r-5 m-l-5">
                               					<input type="radio" name="inlineRadioOptions" value="option3">
                                				<i class="input-helper"></i>3<i class="md md-star"></i>
                            				</label>
											<label class="radio radio-inline m-r-5 m-l-5">
                               					<input type="radio" name="inlineRadioOptions" value="option4">
                                				<i class="input-helper"></i>4<i class="md md-star"></i>
                            				</label>
											<label class="radio radio-inline m-r-5 m-l-5">
                               					<input type="radio" name="inlineRadioOptions" value="option5">
                                				<i class="input-helper"></i>5<i class="md md-star"></i>
                            				</label>
                            				
                            				<br/><br/>
                            				<div class="p-r-15" align="right">
                            					<button class="btn bgm-amber waves-effect waves-button waves-float">평가하기</button>
                            				</div>
                            			</div>                            			
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			



				<div class="container">
					<div class="col-md-12">
					<!-- result 들어갈부분 -->
					</div>
				</div>
			</div>
		</section>

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