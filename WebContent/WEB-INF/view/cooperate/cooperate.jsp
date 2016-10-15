<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pujimi.dto.UserTO" %>
        
<%
	request.setCharacterEncoding("utf-8");
	
	String member_seq = request.getParameter("user_seq");
	String member_admin = request.getParameter("user_admin");
	System.out.println("coop" + member_seq);
	System.out.println("coop" + member_admin);
	
	UserTO userTo = (UserTO)request.getAttribute("userTo");
	
	String user_email = userTo.getUser_email()==null ? "":userTo.getUser_email();
	String user_nickname = userTo.getUser_nickname()==null ? "":userTo.getUser_nickname();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>제휴 조르기 페이지</title>

        <!-- Vendor CSS -->
        <link href="vendors/fullcalendar/fullcalendar.css" rel="stylesheet">
        <link href="vendors/animate-css/animate.min.css" rel="stylesheet">
        <link href="vendors/sweet-alert/sweet-alert.min.css" rel="stylesheet">
        <link href="vendors/material-icons/material-design-iconic-font.min.css" rel="stylesheet">
        <link href="vendors/socicon/socicon.min.css" rel="stylesheet">
            
        <!-- CSS -->
        <link href="css/app.min.1_test.css" rel="stylesheet">
        <link href="css/app.min.2_test.css" rel="stylesheet">
      
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
            <section id="content">
                <div class="container" style="padding: 0;">
                    <div class="block-header">
                        <h2>제휴 조르기</h2> <br/>
                        <small>여러분만의 식당을 알려주세요!!</small>
                    </div>

                    <div class="card">
                        <div class="card-body card-padding">
							<form action="cooperateOk.coop" method="post">
							<input type="hidden" id="latlng" name="latlng" value="(37.49794199999999, 127.027621)"/>
							<div class="col-sm-6">
								<div class="input-group m-b-20">
									<span class="input-group-addon"><i class="md md-person"></i></span>
									<div class="fg-line">
										<input type="text" class="form-control" id="name" name="name" value="<%=user_nickname %>" placeholder="닉네임">
									</div>
								</div>
								<div class="input-group m-b-20">
									<span class="input-group-addon"><i class="md md-email"></i></span>
									<div class="fg-line">
										<input type="text" class="form-control" id="email" name="email" value="<%=user_email %>" placeholder="이메일">
									</div>
								</div>
								<div class="input-group m-b-20">
	         								<span class="input-group-addon"><i class="md md-local-restaurant"></i></span>
									<div class="fg-line">
										<input type="text" class="form-control" id="res_name" name="res_name" placeholder="상호명">
									</div>
								</div>
								<div class="input-group m-b-20">
									<span class="input-group-addon"><i class="md md-location-on"></i></span>
									<div class="fg-line">
										<input type="text" class="form-control" id="res_addr" name="res_addr" placeholder="주소">
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div id="map_canvas" style="width: 300px; height: 300px;"></div>
	                        </div>
							
							<div class="clearfix"></div>
							<br />
							<hr/>
							<div class="input-group" style="width: 100%;">
								<span class="input-group-addon"><i class="md md-info-outline"></i></span>
								
	                            <div class="fg-line">
	                               	<textarea class="form-control" id="res_content" name="res_content" placeholder="가게 설명" style="height: 100px;"></textarea>
	                            </div>
    						</div>
	                        <div align="right" class="m-r-30">
	                        	<button type="submit" class="btn btn-primary btn-sm m-t-30" >제출</button>
                        	</div>
							</form>
    						<!-- <div class="col-sm-6">
								<div id="map_canvas" style="width: 300px; height: 300px;"></div>
								<div id="result"></div>
	                        </div> -->
	                        
                        </div>
                    </div>
                </div>
            </section>
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
        
        <script src="js/flot-charts/curved-line-chart.js"></script>
        <script src="js/flot-charts/line-chart.js"></script>
        <script src="js/charts.js"></script>
        
        <script src="js/charts.js"></script>
        <script src="js/functions.js"></script>
        <script src="js/demo.js"></script>
                <script type="text/javascript">
			var latlng = '';
			var map;
		    var markers = []; // 배열선언	
		   
		    function initialize() {
				var myLatlng = new google.maps.LatLng(37.49794199999999, 127.027621);
				var myOptions = {
					zoom : 17,
					center : myLatlng,
					mapTypeId : google.maps.MapTypeId.ROADMAP
				}
				map = new google.maps.Map(document.getElementById("map_canvas"),
						myOptions);
				
				//클릭했을 때 이벤트
				google.maps.event.addListener(map, 'click', function(event) {
					deleteMarkers();//이전마커 삭제
			        addMarker(event.latLng); //새로운 마커 등록
			        //placeMarker(event.latLng);
			         
			        infowindow.open(map);
			        infowindow.setContent("Here!");
					infowindow.setPosition(event.latLng); // 인포윈도우의 위치를 클릭한 곳으로 변경한다.
	
					latlng = '';
					latlng += event.latLng;
					
					
					document.getElementById('latlng').value = '';
					document.getElementById("latlng").value += latlng;
					
			        });
				//클릭 했을때 이벤트 끝
				
				//인포윈도우(지도에 클릭 시 생성되는 창)의 생성
				var infowindow = new google.maps.InfoWindow(
						{
							content : '<b>가게의 위치를 지도에 표시해주세요</b>',
							size : new google.maps.Size(50, 50),
							position : myLatlng
						});
				infowindow.open(map);
			} // function initialize() 함수 끝
		
			// 마커 생성 함수
			function addMarker(location) {
		        var marker = new google.maps.Marker({
		            position: location,
		            map: map
		        });
		        markers.push(marker);
		    }
		     
		    // Sets the map on all markers in the array.
		    function setMapOnAll(map) {
		        for (var i = 0; i < markers.length; i++) {
		            markers[i].setMap(map);
		        }
		    }
		     
		    // Removes the markers from the map, but keeps them in the array.
		    function clearMarkers() {
		        setMapOnAll(null);
		    }
		     
		    // Shows any markers currently in the array.
		    function showMarkers() { // 전체 마커 보여주기
		        setMapOnAll(map);
		    }
		     
		    // Deletes all markers in the array by removing references to them.
		    function deleteMarkers() {//마커삭제
		        clearMarkers();
		        markers = [];
		    }
	
		</script>
    </body>
  </html>