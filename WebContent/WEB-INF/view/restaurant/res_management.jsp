<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pujimi.dto.ResTO" %>
    
<%
	request.setCharacterEncoding("utf-8");
	
	String member_seq = request.getParameter("user_seq");
	String member_admin = request.getParameter("user_admin");
	
	String default_Latlng = "(37.49794199999999, 127.027621)";
	
	ResTO resTo = (ResTO)request.getAttribute("resTo");
	
	int user_seq = resTo.getUser_seq();
	int res_seq = resTo.getRes_seq();
	
	String res_name = resTo.getRes_name();
	String res_addr = resTo.getRes_addr();
	String res_phone = resTo.getRes_phone();
	String res_octime = resTo.getRes_octime();
	String otime = res_octime.substring(0, 8);
	String ctime = res_octime.substring(9);
	String res_content = resTo.getRes_content();
	String res_photo = resTo.getRes_photo();
	String latlng = resTo.getRes_latlng();
	String check = "'<b>가게의 위치를 변경하시려면</b> 지도에 표시해주십시요'";
	
	if(latlng.equals("") || latlng == default_Latlng) {
		latlng = default_Latlng;
		check = "'<b>가게의 위치을 클릭</b>해주십시요'";
	}
	
	
	
	/* String res_latlng = resTo.getRes_latlng(); */
	
%>   

<!DOCTYPE html>
    <!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>가맹점 정보 수정 페이지</title>

        <!-- Vendor CSS -->
        <link href="vendors/animate-css/animate.min.css" rel="stylesheet">
        <link href="vendors/noUiSlider/jquery.nouislider.min.css" rel="stylesheet">
        <link href="vendors/farbtastic/farbtastic.css" rel="stylesheet">
        <link href="vendors/summernote/summernote.css" rel="stylesheet">
        <link href="vendors/sweet-alert/sweet-alert.min.css" rel="stylesheet">
        <link href="vendors/material-icons/material-design-iconic-font.min.css" rel="stylesheet">
        <link href="vendors/socicon/socicon.min.css" rel="stylesheet">
            
        <!-- CSS -->
        <link href="css/app.min.1_test.css" rel="stylesheet">
        <link href="css/app.min.2_test.css" rel="stylesheet">
        
        <!-- MAP -->
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&key=AIzaSyAgtZyE1FpTlWMOhg9VaIcqdAo-Qxtlpnk"></script>
        
        <!-- Following CSS are used only for the Demp purposes thus you can remove this anytime. -->
        <style type="text/css">
            .toggle-switch .ts-label {
                min-width: 130px;
            }
        </style>
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
                <div class="container">
                    <div class="block-header">
                        <h2>가게 정보 관리 페이지</h2>
                    
                        <ul class="actions">
                            <li>
                                <a href="">
                                    <i class="md md-trending-up"></i>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <i class="md md-done-all"></i>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="" data-toggle="dropdown">
                                    <i class="md md-more-vert"></i>
                                </a>
                    
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li>
                                        <a href="">Refresh</a>
                                    </li>
                                    <li>
                                        <a href="">Manage Widgets</a>
                                    </li>
                                    <li>
                                        <a href="">Widgets Settings</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    
                    </div>
                
                <!-- 기본 폼 시작 -->
                <form action="res_management_ok.restaurant" method="post" enctype="multipart/form-data" >
                <input type="hidden" name='user_seq' value='<%= user_seq%>'>
                <input type="hidden" name='res_seq' value='<%= res_seq%>'>
                <input type="hidden" id="latlng" name="latlng" value="(37.49794199999999, 127.027621)"/>
                    <div class="card">
                        <div class="card-header">
                            <h2>가게 정보 입력 <small>가게에 대한 정보를 입력하는 공간입니다.</small></h2>
                        </div>
                        
                        <hr />
                        
                        <div class="card-body card-padding">
                            <!-- <p class="c-black f-500 m-b-5">기본 정보</p> -->
                            <!-- <small>Place one add-on or button on either side of an input. You may also place one on both sides of an input.</small> -->

                            <div class="row">
                                <div class="col-sm-6">                       
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="md md-person"></i></span>
                                        <div class="fg-line">
                                                <input type="text" name="res_name" class="form-control" value="<%=res_name %>">
                                        </div>
                                    </div>
                                    
                                    <br/>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="md md-location-on"></i></span>
                                        <div class="fg-line">    
                                            <input type="text" name="res_addr" class="form-control" value="<%=res_addr %>">
                                        </div>
                                    </div>
                                    
                                    <br/>
  									<div class="input-group">
                                        <span class="input-group-addon"><i class="md md-local-phone"></i></span>
                                        <div class="fg-line">
                                            <input type="text" name="res_phone" class="form-control" value="<%=res_phone %>">
                                        </div>
                                    </div>
                                    <br />
                                    
                                    <div class="input-group form-group">
                                        <span class="input-group-addon"><i class="md md-access-time"></i></span>
                                            <div class="dtp-container dropdown fg-line">
                                            <input type='text' name="res_otime" class="form-control time-picker" data-toggle="dropdown" value="<%=otime %>">
                                        </div>
                                        <span class="input-group-addon"><i class="md md-access-time"></i></span>
                                            <div class="dtp-container dropdown fg-line">
                                            <input type='text' name="res_ctime" class="form-control time-picker" data-toggle="dropdown" value="<%=ctime %>">
                                        </div>
                                    </div>  
                                </div>
                                <div class="col-sm-6">
									<div id="map_canvas" style="width: 300px; height: 300px;"></div>
			                    </div>
                           	</div>
                        </div>     

                        </div>                     
                        <br/>
                        <div class="card">
							<div class="card-header">
                           		<h2>가게 소개 <small>가게에 대한 소개를 입력하는 공간입니다.</small></h2>
                       		</div>
								<div class="card-body card-padding">
                              		<div class="form-group">
                               			<div class="fg-line">
                                    		<textarea name="res_content" class="form-control auto-size"><%=res_content %></textarea>
                                		</div>
                            		</div>
                              		<div class="form-group">
                               			<div class="fg-line">
                                    		<input type='file' name='res_photo' size='50' maxlength='45' class='box_05'>
                                    		<img src='./upload/<%=res_photo %>' width='300' height='225' border='0'>
                                    		<small>파일명 : <%=res_photo %></small> 
                                		</div>
                            		</div>
								  	<div class="card-body card-padding">
										<button type="submit" class="btn btn-primary btn-file m-r-10">입력 완료</button>
									</div>
								</div>
						</div>
					</form>
                 </div>
                    
                    <!-- 기본폼 끝 -->

                     
                    <!-- <div class="card">
                        <div class="card-header">
                            <h2>Date Time Picker <small>Date/time picker widget based on twitter bootstrap</small></h2>
                        </div>
                        
                        <div class="card-padding card-header">                            
                            <div class="row">
                              
                                <div class="col-sm-4">
                                    <p class="c-black f-500 m-b-20">Time Picker</p>
                                    
                                    <div class="input-group form-group">
                                        <span class="input-group-addon"><i class="md md-access-time"></i></span>
                                            <div class="dtp-container dropdown fg-line">
                                            <input type='text' class="form-control time-picker" data-toggle="dropdown" placeholder="Click here...">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    
                    <div class="card">
                        <div class="card-header">
                            <h2>HTML Editor <small>Super Simple WYSIWYG Editor on Bootstrap</small></h2>
                        </div>
                        
                        <div class="card-body card-padding">
                            <p class="f-500 c-black m-b-20">Basic Example</p>
                            
                            <div class="html-editor"></div>

                        </div>
                    </div>
                    
                    <div class="card">
                        <div class="card-header">
                            <h2>Simple File Input <small>The file input plugin allows you to create a visually appealing file or image input widgets</small></h2>
                        </div>
                        
                        <div class="card-body card-padding">
                            <div class="row">
                                <div class="col-sm-4">
                                    <p class="f-500 c-black m-b-20">Basic Example</p>
                                    
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <span class="btn btn-primary btn-file m-r-10">
                                            <span class="fileinput-new">Select file</span>
                                            <span class="fileinput-exists">Change</span>
                                            <input type="file" name="...">
                                        </span>
                                        <span class="fileinput-filename"></span>
                                        <a href="#" class="close fileinput-exists" data-dismiss="fileinput">&times;</a>
                                    </div>
                                </div>
                            </div>
                            
                            <br/>
                            <br/>
                            
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
                            
                            <br/>
                            <br/>
                            <p><em>Image preview only works in IE10+, FF3.6+, Safari6.0+, Chrome6.0+ and Opera11.1+. In older browsers the filename is shown instead.</em></p>
                        </div>
                    </div> -->
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
        
        <script src="vendors/moment/moment.min.js"></script>
        <script src="vendors/nicescroll/jquery.nicescroll.min.js"></script>
        <script src="vendors/auto-size/jquery.autosize.min.js"></script>
        <script src="vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="vendors/chosen/chosen.jquery.min.js"></script>
        <script src="vendors/noUiSlider/jquery.nouislider.all.min.js"></script>
        <script src="vendors/input-mask/input-mask.min.js"></script>
        <script src="vendors/farbtastic/farbtastic.min.js"></script>
        <script src="vendors/summernote/summernote.min.js"></script>
        <script src="vendors/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
        <script src="vendors/fileinput/fileinput.min.js"></script>
        <script src="vendors/waves/waves.min.js"></script>
        <script src="vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
        <script src="vendors/sweet-alert/sweet-alert.min.js"></script>
        
        <script src="js/functions.js"></script>
        <script src="js/demo.js"></script>
        <script type="text/javascript">
			var latlng = '';
			var map;
		    var markers = []; // 배열선언	
		   
		    function initialize() {
				var myLatlng = new google.maps.LatLng<%=latlng%>;
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
							content : <%=check%>,
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