<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.pujimi.dto.UserTO"%>
    
<%
	request.setCharacterEncoding("utf-8");
	
	String member_seq = request.getParameter("member_seq");
	String member_admin = request.getParameter("user_admin");
	
	UserTO userTo = (UserTO)request.getAttribute("userTo");
	
	String user_seq = Integer.toString(userTo.getUser_seq());
	String user_email = userTo.getUser_email();
	String user_password = userTo.getUser_password();
	String user_nickname = userTo.getUser_nickname();
	String user_gender = "";
	if(Integer.toString(userTo.getUser_gender()).equals("0")){
		user_gender = "남자";
	}else{
		user_gender = "여자";
	}
	
	String user_age = userTo.getUser_age();
	
%>   

<!DOCTYPE html>
    <!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>회원 정보 삭제 페이지</title>

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
        
        <!-- Following CSS are used only for the Demp purposes thus you can remove this anytime. -->
        <style type="text/css">
            .toggle-switch .ts-label {
                min-width: 130px;
            }
            #user_nickname, #user_password, #user_email, #user_age {
            	background-color: #ffffff;
            }
            @font-face {
			  font-family: 'BMHANNA_11yrs';
			  src: 
			  		url('../fonts/BMHANNA_11yrs_eot.eot'),
			  		/* url('../fonts/BMHANNA_11yrs_eot.eot?#iefix') format('embedded-opentype'),
			  		url('../fonts/BMHANNA_11yrs_ttf.ttf') format('woff'),
			  		url('../fonts/BMHANNA_11yrs_woff.woff') format('truetype'); */
			}
			
			#btn1 {
			font-family: 'BMHANNA_11yrs';
			}
        
        	#btn1 {
			  display: inline-block;
			  padding: 5px 11px;
			  font-size: 12px;
			  cursor: pointer;
			  text-align: center;
			  text-decoration: none;
			  outline: none;
			  color: #fff;
			  background-color: #008CBA;
			  border: none;
			  border-radius: 10px;
			}
			
			#btn1:hover {background-color: #3DB7CC;}
			
			#btn1:active {
			  background-color: #3DB7CC;
			  /* box-shadow: 0 3px #666; */
			  transform: translateY(4px);
			}
            
        </style>
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
            <section id="content">
                <div class="container">
                    <div class="block-header">
                        <h2>회원 정보 페이지</h2>
                    
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
                    <div class="card">
                        <div class="card-header">
                            <h2>삭제할 회원 정보</small></h2>
                        </div>
                        
                        <div class="card-body card-padding">
                            <!-- <p class="c-black f-500 m-b-5">기본 정보</p> -->
                            <!-- <small>Place one add-on or button on either side of an input. You may also place one on both sides of an input.</small> -->
                            
                            <br/>
                            
                            <div class="row">
                                <div class="col-sm-4">                       
                                    <div class="input-group m-b-20">
						                <span class="input-group-addon"><i class="md md-person"></i></span>
						                <div class="fg-line">
						                    <input type="text" class="form-control" value="<%=user_nickname %>" placeholder="닉네임" id="user_nickname" name="user_nickname" readonly="readonly">
						                </div>
						            </div>
						            
						            <div class="input-group m-b-20">
						                <span class="input-group-addon"><i class="md md-mail"></i></span>
						                <div class="fg-line">
						                    <input type="text" class="form-control" value="<%=user_email %>" placeholder="이메일" id="user_email" name="user_email" readonly="readonly">
						                </div>
						            </div>
						            
						            <div class="input-group m-b-20">
						                <span class="input-group-addon"><i class="md md-accessibility"></i></span>
						                <div class="fg-line">
						                    <input type="text" class="form-control" value="<%=user_password %>" placeholder="비밀번호" id="user_password" name="user_password" readonly="readonly">
						                </div>
						            </div>
						
									<div class="input-group m-b-20">
										<span class="input-group-addon"><i class="md md-event"></i></span>
										<div class="dtp-container dropdown fg-line">
											<input type='text' class="form-control date-picker" value="<%=user_age %>"	data-toggle="dropdown" placeholder="생년월일" id="user_age" name="user_age" readonly="readonly">
										</div>
									</div>
									<br />
									<label class="radio radio-inline m-20"> <input type="radio"
										name="genderOption" id="radio" value="male" <% 
											if(user_gender == "남자") {
												out.print("checked");
											}
										%> disabled > <i
										class="input-helper"></i> <b>남</b>
									</label> 
									<label class="radio radio-inline m-20"> <input
										type="radio" name="genderOption" id="radio" value="female" <% 
											if(user_gender == "여자") {
												out.print("checked");
											}
										%> disabled> <i
										class="input-helper"></i> <b>여</b>
									</label>
                                </div>
                           	</div>
							<div class="card-header">
                            <h2>위의 회원 정보를 삭제하시겠습니까?</h2>
                        </div>
                        <div class="card-header">
                            <input type='button' id='btn1' value='삭제'  onclick='javascript:location.href="manage_user_deleteOk.admin?user_seq=<%=user_seq %>&member_seq=<%=member_seq %>&user_admin=<%=member_admin %>"'/>
                        	&nbsp;&nbsp;<input type='button' id='btn1' value='취소' onclick='javascript:location.href="manage_user.admin?user_seq=<%=member_seq %>&user_admin=<%=member_admin %>"'/>
                        </div>
                        </div>

                        </div>                     
                        <br/>
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
       <footer>
      <div>
         <div class="pujimiFooter"> Copyright 2016, Pujimi All Rights Reserved</div>
      </div>
   </footer>
    </body>
</html>