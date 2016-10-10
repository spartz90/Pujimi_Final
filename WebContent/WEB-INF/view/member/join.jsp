<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <title>Material Admin</title>
        
        <!-- Vendor CSS -->
        <link href="vendors/animate-css/animate.min.css" rel="stylesheet">
        <link href="vendors/sweet-alert/sweet-alert.min.css" rel="stylesheet">
        <link href="vendors/material-icons/material-design-iconic-font.min.css" rel="stylesheet">
        <link href="vendors/socicon/socicon.min.css" rel="stylesheet">
            
        <!-- CSS -->
        <link href="css/app.min.1.css" rel="stylesheet">
        <link href="css/app.min.2_test.css" rel="stylesheet">
	
		<script type="text/javascript">
	        function user_ChkForm() {
	        	
	        	if(document.user_join_frm.nickname.value.trim() == ""){
	    			alert('닉네임을 입력해주세요.');
	    			return false;
	    		}
	    		if(document.user_join_frm.email.value.trim() == ""){
	    			alert('이메일을 입력해주세요.');
	    			return false;
	    		}
	    		if(document.user_join_frm.password.value.trim() == ""){
	    			alert('암호를 입력하셔야 합니다.');
	    			return false;
	    		}
	    		if(document.user_join_frm.birth.value.trim() == ""){
	    			alert('생년월일을 입력해주세요');
	    			return false;
	    		}
	    		if(document.user_join_frm.genderOption.value.trim() == ""){
	    			alert('성별을 선택해 주세요.');
	    			return false;
	    		}
	    		
	    		if(document.user_join_frm.agreement.checked == false){
	        		alert('동의해라.');
	    			return false;
	        	}
	    	}
	        
	        function mgr_ChkForm() {
	        	//birth password email nickname
	        	
	        	if(document.mgr_join_frm.nickname.value.trim() == ""){
	    			alert('닉네임을 입력해주세요.');
	    			return false;
	    		}
	    		if(document.mgr_join_frm.email.value.trim() == ""){
	    			alert('이메일을 입력해주세요.');
	    			return false;
	    		}
	    		if(document.mgr_join_frm.password.value.trim() == ""){
	    			alert('암호를 입력하셔야 합니다.');
	    			return false;
	    		}
	    		if(document.mgr_join_frm.birth.value.trim() == ""){
	    			alert('생년월일을 입력해주세요');
	    			return false;
	    		}
	    		if(document.mgr_join_frm.genderOption.value.trim() == ""){
	    			alert('성별을 선택해주세요.');
	    			return false;
	    		}
	    		
	    		if(document.mgr_join_frm.res_name.value.trim() == ""){
	    			alert('가게명을 입력해주세요.');
	    			return false;
	    		}
	    		if(document.mgr_join_frm.res_addr.value.trim() == ""){
	    			alert('가게주소를 입력해주세요.');
	    			return false;
	    		}
	    		if(document.mgr_join_frm.res_phone.value.trim() == ""){
	    			alert('가게번호를 입력해주세요');
	    			return false;
	    		}
	    		if(document.mgr_join_frm.res_otime.value.trim() == ""){
	    			alert('오픈 시간을 입력해주세요.');
	    			return false;
	    		}
	    		if(document.mgr_join_frm.res_ctime.value.trim() == ""){
	    			alert('마감시간을 입력해주세요.');
	    			return false;
	    		}
	    		if(document.mgr_join_frm.res_content.value.trim() == ""){
	    			alert('가게소개글을 입력해주세요.');
	    			return false;
	    		}
	    		
	    		if(document.mgr_join_frm.agreement.checked == false){
	        		alert('동의해라.');
	    			return false;
	        	}
	    		
	    	}
        </script>
    </head>
    <body class="login-content">

        <!-- 일반회원 가입폼 -->
        <div class="lc-block toggled" id="user-register">
	        <form action="join_ok_user.member" method="post" name='user_join_frm' onSubmit='return user_ChkForm(this)'>
	            <ul class="register-navigation">
				    <li data-block="#user-register" class="bgm-green"><a>일반회원 가입</a></li>
				    <li data-block="#mgr_register" class="bgm-red"><a>가맹점회원 가입</a></li>
			    </ul>
			    
			    <div class="clearfix">
	             	<hr/>
	            </div>
			    
	            <div class="input-group m-b-20">
	                <span class="input-group-addon"><i class="md md-person"></i></span>
	                <div class="fg-line">
	                    <input type="text" class="form-control" placeholder="닉네임" id="nickname" name="nickname">
	                </div>
	            </div>
	            
	            <div class="input-group m-b-20">
	                <span class="input-group-addon"><i class="md md-mail"></i></span>
	                <div class="fg-line">
	                    <input type="text" class="form-control" placeholder="이메일" id="email" name="email">
	                </div>
	            </div>
	            
	            <div class="input-group m-b-20">
	                <span class="input-group-addon"><i class="md md-accessibility"></i></span>
	                <div class="fg-line">
	                    <input type="password" class="form-control" placeholder="비밀번호" id="password" name="password">
	                </div>
	            </div>
	
				<div class="input-group m-b-20 col-sm-7 pull-left">
					<span class="input-group-addon"><i class="md md-event"></i></span>
					<div class="dtp-container dropdown fg-line">
						<input type='text' class="form-control date-picker"	data-toggle="dropdown" placeholder="생년월일" name="birth">
					</div>
				</div>
				
				<label class="radio radio-inline m-20"> <input type="radio"
					name="genderOption" id="radio" value="male"> <i
					class="input-helper"></i> <b>남</b>
				</label> 
				<label class="radio radio-inline m-20"> <input
					type="radio" name="genderOption" id="radio" value="female"> <i
					class="input-helper"></i> <b>여</b>
				</label>
				
				
	            <div class="checkbox">
	                <label>
	                    <input type="checkbox" name="agreement" value="">
	                    <i class="input-helper"></i>
	                    Accept the license agreement
	                </label>
	            </div>
				
				<button type="submit" class="btn btn-login btn-danger btn-float"><i class="md md-arrow-forward"></i></button>
				<div class="clearfix">
             		<hr/>
            	</div>
	        </form>
        </div>
        
        <!-- 가맹점회원 가입폼 -->
        <div class="lc-block" id="mgr_register">
          	<form action="join_ok_mgr.member" method="post" name='mgr_join_frm' onSubmit='return mgr_ChkForm(this)'>
	            <div class="mgr_basic">
		            <ul class="register-navigation">
					    <li data-block="#user-register" class="bgm-green"><a>일반회원 가입</a></li>
					    <li data-block="#mgr_register" class="bgm-red"><a>가맹점회원 가입</a></li>
				    </ul>
				    
				    <div class="clearfix">
		             	<hr/>
		            </div>
		            <h4>가맹점 회원 정보</h4><br />
		            
		            <div class="input-group m-b-20">
		                <span class="input-group-addon"><i class="md md-person"></i></span>
		                <div class="fg-line">
		                    <input type="text" class="form-control" placeholder="닉네임" id="nickname" name="nickname">
		                </div>
		            </div>
		            
		            <div class="input-group m-b-20">
		                <span class="input-group-addon"><i class="md md-mail"></i></span>
		                <div class="fg-line">
		                    <input type="text" class="form-control" placeholder="이메일" id="email" name="email">
		                </div>
		            </div>
		            
		            <div class="input-group m-b-20">
		                <span class="input-group-addon"><i class="md md-accessibility"></i></span>
		                <div class="fg-line">
		                    <input type="password" class="form-control" placeholder="비밀번호" id="password" name="password">
		                </div>
		            </div>
		
					<div class="input-group m-b-20 col-sm-7 pull-left">
						<span class="input-group-addon"><i class="md md-event"></i></span>
						<div class="dtp-container dropdown fg-line">
							<input type='text' class="form-control date-picker"	data-toggle="dropdown" placeholder="생년월일" name="birth">
						</div>
					</div>
					
					<label class="radio radio-inline m-20"> <input type="radio"
						name="genderOption" id="radio" value="male"> <i
						class="input-helper"></i> <b>남</b>
					</label> 
					<label class="radio radio-inline m-20"> <input
						type="radio" name="genderOption" id="radio" value="female"> <i
						class="input-helper"></i> <b>여</b>
					</label>
					<div class="btn btn-login btn-danger btn-float" id="mgr_basic_ok"><i class="md md-arrow-forward"></i></div>
				</div>
			
				<div class="mgr_detail">
					<h4>가맹점 정보</h4><br />
					<div class="goback btn-danger btn-float"><i class="md md-arrow-back"></i></div>
	                <div class="input-group">
	                    <span class="input-group-addon"><i class="md md-person"></i></span>
	                    <div class="fg-line">
	                            <input type="text" name="res_name" class="form-control" placeholder="가게 이름">
	                    </div>
	                </div>
	                
	                <br/>
	                <div class="input-group">
	                    <span class="input-group-addon"><i class="md md-location-on"></i></span>
	                    <div class="fg-line">    
	                        <input type="text" name="res_addr" class="form-control" placeholder="가게 주소">
	                    </div>
	                </div>
	                    
	                <br/>
					<div class="input-group">
	                    <span class="input-group-addon"><i class="md md-local-phone"></i></span>
	                    <div class="fg-line">
	                        <input type="text" name="res_phone" class="form-control" placeholder="가게 전화번호">
	                    </div>
	                </div>
	                <br />
	                    
	                <div class="input-group form-group">
	                    <span class="input-group-addon"><i class="md md-access-time"></i></span>
	                    <div class="dtp-container dropdown fg-line">
	                        <input type='text' name="res_otime" class="form-control time-picker" data-toggle="dropdown" placeholder="오픈 시간">
	                    </div>
	                  	<span class="input-group-addon"><i class="md md-access-time"></i></span>
	                    <div class="dtp-container dropdown fg-line">
	                        <input type='text' name="res_ctime" class="form-control time-picker " data-toggle="dropdown" placeholder="클로즈 시간">
	                    </div>
	                </div> 
	                <br />
	                
	                <div class="input-group"  style="width: 100%;">
	                     <div class="fg-line">
	                         <textarea name="res_content" class="form-control" placeholder="가게 소개를 간략히 입력해주십시오." style="height: 100px;"></textarea>
	                     </div>
	                </div>
	                <br />
	
		            <div class="checkbox">
		                <label>
		                    <input type="checkbox" name="agreement" value="">
		                    <i class="input-helper"></i>
		                    Accept the license agreement
		                </label>
		            </div>
					
					<button type="submit" class="btn btn-login btn-danger btn-float"><i class="md md-arrow-forward"></i></button>
		            
					<div class="clearfix">
			             	<hr/>
		            </div>
		        </div>
        	</form> 
        </div>
        
        
        
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
        <script src="vendors/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
        
        <script src="vendors/waves/waves.min.js"></script>
        
        <script src="js/functions.js"></script>
        
    </body>
</html>