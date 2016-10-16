<%@page import="kr.co.pujimi.dao.LikeDAO"%>
<%@page import="kr.co.pujimi.dto.RatingTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="kr.co.pujimi.dto.ResTO" %>
<%@page import="kr.co.pujimi.dto.ReplyTO"%>
<%@page import="kr.co.pujimi.dao.ReplyDAO"%>

<%@ page import="java.util.ArrayList" %>

<%
	request.setCharacterEncoding( "utf-8");
	
	ResTO resTo	= (ResTO)request.getAttribute("resTo");
	String member_seq = request.getParameter("user_seq");
	String member_admin = request.getParameter("user_admin");
	String res_seq = request.getParameter("res_seq");
	String res_name = resTo.getRes_name();
	String res_addr = resTo.getRes_addr();
	String res_phone = resTo.getRes_phone();
	String res_octime[] = resTo.getRes_octime().split("-");
	String otime = res_octime[0];
	String ctime = res_octime[1];
	String res_content = resTo.getRes_content();
	String res_photo = resTo.getRes_photo();	
	int res_price = resTo.getRes_price();
	double res_grade = Math.round(resTo.getRes_grade()*100)/100.0;
	int num_star = (int)Math.round(res_grade);
	int res_sells = resTo.getRes_sells();
	int res_likes = resTo.getRes_likes();
	String latlng = resTo.getRes_latlng();

	StringBuffer result	= (StringBuffer)request.getAttribute("result");	
	StringBuffer menu_result = (StringBuffer)request.getAttribute("menu_result");	
		
	RatingTO rato = (RatingTO)request.getAttribute("rato");
	
	double one = rato.getOne();
	double two = rato.getTwo();
	double three = rato.getThree();
	double four = rato.getFour();
	double five = rato.getFive();
	
	double sum = one + two + three + four + five;
	double prog_one = Math.round( one / sum * 100);
	double prog_two = Math.round(two / sum * 100);
	double prog_three = Math.round(three / sum * 100);
	double prog_four = Math.round(four / sum * 100);
	double prog_five = Math.round(five / sum * 100);   	
	
	String default_Latlng = "(37.49794199999999, 127.027621)";
	String check = "'<b>here!</b>here'";
	
	if(latlng.equals("") || latlng == default_Latlng) {
		latlng = default_Latlng;
		//check = "'<b>가게의 위치을 클릭</b>해주십시요'";
	} 
	
	ResTO resTo2 = new ResTO();
	resTo2.setUser_seq(Integer.parseInt(member_seq));
	resTo2.setRes_seq(Integer.parseInt(res_seq));
	
	LikeDAO lDao = new LikeDAO();
	int chk = lDao.checkOk(resTo2);
	
	
	
	
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

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<!-- CSS -->
<link href="css/app.min.1_test.css" rel="stylesheet">
<link href="css/app.min.2_test.css" rel="stylesheet">
<link href="css/wall.css" rel="stylesheet">

<!-- MAP -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&key=AIzaSyAgtZyE1FpTlWMOhg9VaIcqdAo-Qxtlpnk"></script>

</head>

<body class="toggled sw-toggled" onload="initialize();">
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
			
			<div class="row">
				<div class="block-header">
				<br/>
					<h2>
						제휴점 상세 정보 <small>제휴점의 자세한 정보를 확인할 수 있습니다. </small>
					</h2>

					
				</div>

				<div class="container"  style="padding: 0;">
					<div class="card blog-post">
						<div class="bp-header">
							<div class="resImg"><img src="./upload/<%=res_photo%>" alt="" ></div> 
							<a href="" class="bp-title">
								<h2><%=res_name %></h2> 
								<small><%=res_content %></small>
							</a>
						</div>

						<div class="col-md-8" style="padding: 0;">
							<div class="card profile-view">

								<div class="pv-body" style="margin-top: 0px;">

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
										<li><%=res_price %> 원</li>
										<li>구매 : <%=res_sells %></li>
										<li id="likeCount">좋아요 : <%=res_likes %> </li>
									</ul>

									<a href="coupon_buy.coupon?res_seq=<%=res_seq %>&user_seq=<%=member_seq %>&user_admin=<%=member_admin %>" class="pv-follow-btn" style="background-color: #01B0F0">구매 하기</a><br /> 
									<!-- <a href="" class="pv-follow-btn" style="background-color: #01B0F0">좋아요</a> -->
									<button id="likebtn" class="resLikebtn">좋아요</button>
								</div>
							</div>
						</div>

						<div class="col-md-4 " style="padding: 0;">
							<div class="card rating-list" style="padding: 0;">
								<div class="listview">
									<div class="lv-header">
										<div class="m-t-5" style="float: left; margin-top: 0">평점 평균 <%=res_grade %></div>

										<div class="rl-star" style="margin-top: 3px;">
										
										<% 
											for(int i = 0; i<num_star; i++){
												out.print("<i class=\"md md-star active\"></i>");
											}
											for(int j = 0; j<5-num_star; j++){
												out.print("<i class=\"md md-star\"></i>");
											}
											
										%>	
											
										</div>
									</div>

									<div class="lv-body">
										<div style="padding: 12px;">
											<div class="lv-item">
												<div class="media">
													<div class="pull-left">
														1 <i class="md md-star"></i>
													</div>

													<div class="pull-right"><%=(int)one %></div>

													<div class="media-body">
														<div class="progress">
															<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="<%=prog_one %>" aria-valuemin="0" aria-valuemax="100" style="width: <%=prog_one %>%"></div>
														</div>
													</div>
												</div>
											</div>

											<div class="lv-item">
												<div class="media">
													<div class="pull-left">
														2 <i class="md md-star"></i>
													</div>

													<div class="pull-right"><%=(int)two %></div>

													<div class="media-body">
														<div class="progress">
															<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="<%=prog_two %>" aria-valuemin="0" aria-valuemax="100" style="width: <%=prog_two %>%"></div>
														</div>
													</div>
												</div>
											</div>

											<div class="lv-item">
												<div class="media">
													<div class="pull-left">
														3 <i class="md md-star"></i>
													</div>

													<div class="pull-right"><%=(int)three %></div>

													<div class="media-body">
														<div class="progress">
															<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=prog_three %>" aria-valuemin="0" aria-valuemax="100" style="width: <%=prog_three %>%"></div>
														</div>
													</div>
												</div>
											</div>

											<div class="lv-item">
												<div class="media">
													<div class="pull-left">
														4 <i class="md md-star"></i>
													</div>

													<div class="pull-right"><%=(int)four %></div>

													<div class="media-body">
														<div class="progress">
															<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="<%=prog_four %>" aria-valuemin="0" aria-valuemax="100" style="width: <%=prog_four %>%"></div>
														</div>
													</div>
												</div>
											</div>

											<div class="lv-item">
												<div class="media">
													<div class="pull-left">
														5 <i class="md md-star"></i>
													</div>

													<div class="pull-right"><%=(int)five %></div>

													<div class="media-body">
														<div class="progress">
															<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="<%=prog_five %>" aria-valuemin="0" aria-valuemax="100" style="width: <%=prog_five %>%"></div>
														</div>
													</div>
												</div>
											</div>
										</div>                      			
									</div>
								</div>
							</div>
						</div>
					</div>
				
					<div id="map_canvas" style="width: 100%; height: 300px;"></div><br/>
					<div id="accordion">
						<h3>오늘의 메뉴 보기</h3>
						<div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>날짜</th>
                                        <th>메뉴 이름</th>
                                        <th>1인분 (g)</th>
                                        <th>열량 (kcal)</th>
                                        <th>나트륨(mg)</th>
                                    </tr>
                                </thead>
                                <tbody>
									<%=menu_result %>
                                </tbody>
                            </table>
                        </div>
					</div>
					<br />
				</div>
				
				<div class="block-header">
					<h2>
						후기 작성하기 <small>제휴점의 후기를 자유롭게 작성해보세요. </small>
					</h2>
				</div>
				
				<div class="container"  style="padding: 0;">
					<form action="writeOk.reply" method="post" enctype="multipart/form-data" >
						<input type="hidden" name="user_seq" value="<%=member_seq%>"/>
						<input type="hidden" name="user_admin" value="<%=member_admin%>"/>
						<input type="hidden" name="res_seq" value="<%=res_seq%>"/>
						<div class="card w-post">
							<div class="card-body">
								<textarea id="re_content" name="re_content" class="wp-text auto-size" placeholder="후기를 작성해주세요." ></textarea>
								<!-- 버튼 위치 -->
								<div class="p-5" align="center" style="border-top: 1px solid #F0F0F0;">
								<br/>
									<label class="radio radio-inline">
                              				<input type="radio" name="rating" value="1">
                               			<i class="input-helper"></i>1<i class="md md-star"></i>
                           			</label>
									<label class="radio radio-inline">
                              				<input type="radio" name="rating" value="2">
                               			<i class="input-helper"></i>2<i class="md md-star"></i>
                           			</label>
									<label class="radio radio-inline">
                              				<input type="radio" name="rating" value="3">
                               			<i class="input-helper"></i>3<i class="md md-star"></i>
                           			</label>
									<label class="radio radio-inline">
                              				<input type="radio" name="rating" value="4">
                               			<i class="input-helper"></i>4<i class="md md-star"></i>
                           			</label>
									<label class="radio radio-inline">
                              				<input type="radio" name="rating" value="5">
                               			<i class="input-helper"></i>5<i class="md md-star"></i>
                           			</label>                            				
                           		</div>								
								
								<div class="tab-content p-0">
									<div class="wp-media tab-pane" id="wpm-image">
										<p class="f-500 c-black m-b-20">사진 미리보기</p>
                           
                           				<div class="fileinput fileinput-new" data-provides="fileinput">
                               				<div class="fileinput-preview thumbnail" data-trigger="fileinput"></div>
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
										<button type="submit" class="btn btn-primary btn-sm pull-right">작성</button>
								</div>
								</div>
							</div>
						</form>
						<div class="block-header">
							<br/>
							<h2>후기 보기<small>실제 식권 사용 고객들의 실시간 후기와 사진들을 확인해보세요. </small></h2>
						</div>	
						<!-- result 들어갈부분 -->
						<%=result %>
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
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
	
	<script type="text/javascript">
		var latlng = '';
		function initialize(latlng) {
			var myLatlng = new google.maps.LatLng<%=latlng %>
			var myOptions = {
				zoom : 17,
				center : myLatlng,
				mapTypeId : google.maps.MapTypeId.ROADMAP,
				
			}
			var map = new google.maps.Map(document.getElementById("map_canvas"),
					myOptions);
			
			var marker = new google.maps.Marker({
				position : myLatlng,
				map : map
			});

			var content = "<%=res_name%>";
			
			var infowindow = new google.maps.InfoWindow({ content: content});
			 
	        google.maps.event.addListener(marker, "click", function() {
	            infowindow.open(map,marker);
	        });
	        	        
		}
		
    	$( "#accordion" ).accordion({
    		collapsible: true,
    		heightStyle: "content"
    	});

		if (<%=chk %> == 1) {
			$('#likebtn').css({
				background : "#ff5b5b",
				border : "1px solid #ff5b5b"
			});
		}
		
		// 좋아요 기능 //
		$('#likebtn').on('click', function() {
			var user_seq = <%=member_seq %>;
			var res_seq = <%=res_seq %>;
			if (user_seq == -1) {
				alert("로그인이 필요합니다.")
				return false;
			}
			$.ajax({
				url: './checkOk.like',
				type: 'post',
				data: {
					user_seq: user_seq,
					res_seq: res_seq
				},
				dataType: 'json',
				success: function(json) {
					if(json.flag == 0) {
						//alert("좋아요 했습니다.");
						$('#likebtn').css({
							background : "#ff5b5b",
							border : "1px solid #ff5b5b"
						});
						
						//좋아요 숫자 1증가
						var likeText = $("#likeCount").text().split(" : ");
						var likeNum = Number(likeText[1])+1;
						$("#likeCount").text("좋아요 : " + likeNum);
						
						
					} else {
						//alert("좋아요를 해제했습니다.")
						$('#likebtn').css({
							background : "#01b0f0",
							border : "1px solid #01b0f0"
						});
						
						//좋아요 숫자 1감소
						var likeText = $("#likeCount").text().split(" : ");
						var likeNum = Number(likeText[1])-1;
						$("#likeCount").text("좋아요 : " + likeNum);
					}
				},
				error : function(xhr, status, error) {
					alert('에러:' + status + '\n\n' + error);
				}
			})
		});

		
		</script>
</body>
</html>