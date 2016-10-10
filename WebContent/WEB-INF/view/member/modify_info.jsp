<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="kr.co.pujimi.dto.UserTO" %>
<%

	UserTO userTo = (UserTO)request.getAttribute("userTo");
	
	String user_seq = Integer.toString(userTo.getUser_seq());
	String user_email = userTo.getUser_email();
	String user_nickname = userTo.getUser_nickname();
	String user_password = userTo.getUser_password();
	int user_gender = userTo.getUser_gender();
	String user_birth = userTo.getUser_age();

%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <title>회원정보 수정 페이지</title>
        
        <!-- Vendor CSS -->
        <link href="vendors/animate-css/animate.min.css" rel="stylesheet">
        <link href="vendors/sweet-alert/sweet-alert.min.css" rel="stylesheet">
        <link href="vendors/material-icons/material-design-iconic-font.min.css" rel="stylesheet">
        <link href="vendors/socicon/socicon.min.css" rel="stylesheet">
            
        <!-- CSS -->
        <link href="css/app.min.1.css" rel="stylesheet">
        <link href="css/app.min.2.css" rel="stylesheet">

    </head>
    <body class="login-content">
        
        <!-- Register -->
        <div class="lc-block toggled" id="l-register">
          <form action="modify_info_ok.member" method="post">
          <input type="hidden" name="user_seq" value="<%=user_seq %>">
            <div class="input-group m-b-20">
                <span class="input-group-addon"><i class="md md-person"></i></span>
                <div class="fg-line">
                    <input type="text" class="form-control" value="<%=user_nickname %>" id="nickname" name="nickname">
                </div>
            </div>
            
            <div class="input-group m-b-20">
                <span class="input-group-addon"><i class="md md-mail"></i></span>
                <div class="fg-line">
                    <input type="text" class="form-control" value="<%=user_email %>" id="email" name="email">
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
					<input type='text' class="form-control date-picker"	data-toggle="dropdown" value="<%=user_birth %>" name="birth">
				</div>
			</div>
			<%
				if(user_gender==0){
				
			%>
			<label class="radio radio-inline m-20"> <input type="radio"
				name="inlineRadioOptions" id="radio" value="option1" checked="checked"> <i
				class="input-helper"></i> <b>남</b>
			</label> <label class="radio radio-inline m-20"> <input
				type="radio" name="inlineRadioOptions" id="radio" value="option2"> <i
				class="input-helper"></i> <b>여</b></label>
			<%
				}else{
			%>
			<label class="radio radio-inline m-20"> <input type="radio"
				name="inlineRadioOptions" id="radio" value="option1"> <i
				class="input-helper"></i> <b>남</b>
			</label> <label class="radio radio-inline m-20"> <input
				type="radio" name="inlineRadioOptions" id="radio" value="option2"  checked="checked"> 
				<i class="input-helper"></i> <b>여</b></label>
			<%
				}
			%>
			
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