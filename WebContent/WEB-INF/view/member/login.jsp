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
        <link href="css/app.min.1_test.css" rel="stylesheet">
        <link href="css/app.min.2_test.css" rel="stylesheet">
        
        <style type="text/css">
        	.social {
					text-align: left;
			}
        	.social > img{ 
        		display: inline-block;
        		width: 90px;
  				height: 90px;
        	}
        	
        	@media screen and (max-width: 600px) {
        	  .social {
					text-align: left;
				}
			  .social > img{
			  	display: inline-block;
			    width: 50px;
			    height: 50px;
			    margin-right: 2px;
			}
			@media screen and (max-width: 380px) {
				.social {
					text-align: center;
					position: relative;
					width: 100%;
				}
				.social > img{
					width: 50px;
				    height: 50px;
				    margin-right: 2px;
				}
			}
        </style>
        <script type="text/javascript">
	        function ChkForm() {
	    		if(document.login_frm.email.value.trim() == ""){
	    			alert('이메일을 입력해주세요');
	    			return false;
	    		}
	    		if(document.login_frm.password.value.trim() == ""){
	    			alert('암호를 입력하셔야 합니다.');
	    			return false;
	    		}
	    	}
        </script>
    </head>
    <body class="login-content">
        <!-- Login -->
        <div class="lc-block toggled" id="l-login" style="margin-top: 0px;">
        	<form action="login_ok.member" method="post" name='login_frm' onSubmit='return ChkForm(this)'>
            <div class="input-group m-b-20">
                <span class="input-group-addon"><i class="md md-email"></i></span>
                <div class="fg-line">
                    <input type="email" class="form-control" id="email" name="email" placeholder="이메일">
                </div>
            </div>
            
            <div class="input-group m-b-20">
                <span class="input-group-addon"><i class="md md-lock-open"></i></span>
                <div class="fg-line">
                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
                </div>
            </div>
            
            <div class="clearfix"></div>
            
            <div class="checkbox">
                <label>
                    <input type="checkbox" value="">
                    <i class="input-helper"></i>
                    Keep me signed in
                </label>
            </div>
			<div class="clearfix">
             	<hr/>
             </div>
             <div>
             	<div class="social">
					<img src="img/social/facebook-128.png">
             		<img src="img/social/naver_social.png">
             		<img src="img/social/googleplus-128.png">
             	</div>
             	<div class="login-navigation-group">
             		<ul class="login-navigation">
                		<li class="bgm-red"><a href="join.member">회원가입</a></li>
                		<li data-block="#l-forget-password" class="bgm-orange"><a>비밀번호 찾기</a></li>
            		</ul>
             	</div>
            </div>   
			<button type="submit" class="btn btn-login btn-danger btn-float"><i class="md md-arrow-forward"></i></button>
            </form>
                
        </div>
        
        <!-- Forget Password -->
        <div class="lc-block" id="l-forget-password">
            <p class="text-left">비밀번호를 잊으셨습니까?<br/> 이메일을 입력해주시면 비밀번호를 초기화 하여 알려드립니다!</p>
            <form action="forgetPass.member" method="post" name='forgetPass_frm' >
            <div class="input-group m-b-20">
                <span class="input-group-addon"><i class="md md-email"></i></span>
                <div class="fg-line">
                    <input type="text" class="form-control" id="email" name="email" placeholder="Email Address">
                </div>
            </div>
            <div class="clearfix">
             	<hr/>
            </div>        
            <ul class="forget-navigation">
                <li data-block="#l-login" class="bgm-green"><a>로그인</a></li>
                <li class="bgm-red"><a href="join.member">회원가입</a></li>
            </ul> 
            <button type="submit" class="btn btn-login btn-danger btn-float"><i class="md md-arrow-forward"></i></button>
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