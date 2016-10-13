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
        <title>회원 정보 수정 페이지</title>

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
        </style>
        <script type="text/javascript">
	        function user_ChkForm() {
	        	
	        	if(document.frm.user_nickname.value.trim() == ""){
	    			alert('닉네임을 입력해주세요.');
	    			return false;
	    		}
	    		if(document.frm.user_email.value.trim() == ""){
	    			alert('이메일을 입력해주세요.');
	    			return false;
	    		}
	    		if(document.frm.user_password.value.trim() == ""){
	    			alert('암호를 입력하셔야 합니다.');
	    			return false;
	    		}
	    		if(document.rm.user_age.value.trim() == ""){
	    			alert('생년월일을 입력해주세요');
	    			return false;
	    		}
	    		if(document.frm.genderOption.value.trim() == ""){
	    			alert('성별을 선택해 주세요.');
	    			return false;
	    		}
	    		
	    	}
        </script>
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
                        <h2>회원 정보 관리 페이지</h2>
                    
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
                <form name="frm" id="frm" action="manage_user_modifyOk.admin" method="post" onSubmit='return user_ChkForm(this)'>
                <input type="hidden" name='user_seq' value='<%= user_seq%>'>
                <input type="hidden" name='member_seq' value='<%= member_seq%>'>
                <input type="hidden" name='user_admin' value='<%= member_admin%>'>
                    <div class="card">
                        <div class="card-header">
                            <h2>회원 정보 입력 <small>회원에 대한 정보를 입력하는 공간입니다.</small></h2>
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
						                    <input type="text" class="form-control" value="<%=user_nickname %>" placeholder="닉네임" id="nickname" name="user_nickname">
						                </div>
						            </div>
						            
						            <div class="input-group m-b-20">
						                <span class="input-group-addon"><i class="md md-mail"></i></span>
						                <div class="fg-line">
						                    <input type="text" class="form-control" value="<%=user_email %>" placeholder="이메일" id="email" name="user_email">
						                </div>
						            </div>
						            
						            <div class="input-group m-b-20">
						                <span class="input-group-addon"><i class="md md-accessibility"></i></span>
						                <div class="fg-line">
						                    <input type="text" class="form-control" value="<%=user_password %>" placeholder="비밀번호" id="password" name="user_password">
						                </div>
						            </div>
						
									<div class="input-group m-b-20">
										<span class="input-group-addon"><i class="md md-event"></i></span>
										<div class="dtp-container dropdown fg-line">
											<input type='text' class="form-control date-picker" value="<%=user_age %>"	data-toggle="dropdown" placeholder="생년월일" name="user_age">
										</div>
									</div>
									<br />
									<label class="radio radio-inline m-20"> <input type="radio"
										name="genderOption" id="radio" value="male" <% 
											if(user_gender == "남자") {
												out.print("checked");
											}
										%>> <i
										class="input-helper"></i> <b>남</b>
									</label> 
									<label class="radio radio-inline m-20"> <input
										type="radio" name="genderOption" id="radio" value="female" <% 
											if(user_gender == "여자") {
												out.print("checked");
											}
										%> > <i
										class="input-helper"></i> <b>여</b>
									</label>
                                </div>
                           	</div>
							<div class="card-header">
                           		<h2>정보 수정을 하고난 후, 아래의 수정완료를 눌러주십시오 </small></h2>
                       		</div>
								<div class="card-body card-padding">
								  	<div class="card-body card-padding">
										<button type="submit" class="btn btn-primary btn-file m-r-10">수정 완료</button>
									</div>
								</div>
                        </div>

                        </div>                     
                        <br/>
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
    
    </body>
</html>