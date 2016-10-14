<%@page import="kr.co.pujimi.dto.CouponTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String member_seq = request.getParameter("user_seq");
	String member_admin = request.getParameter("user_admin");
	
	ArrayList<CouponTO> resCouponList = (ArrayList)request.getAttribute("resCouponList");
	
	StringBuffer coupon_result = new StringBuffer();

	if(resCouponList.size()==0){
		coupon_result.append("<h3>" + "보유 쿠폰이 없습니다." + "</h3>");
		coupon_result.append("<div align='center'>");
		coupon_result.append("	<div class='coupon'>");
		coupon_result.append("		<div class='couponmain'>");
		coupon_result.append("			<div class='couponmain_img'>");
		coupon_result.append("				<h3>푸지미</h3>");
		coupon_result.append("				<h2>모바일 식권</h2>");
		coupon_result.append("			</div>");
		coupon_result.append("		</div>");
		coupon_result.append("		<div class='coupondetail'>");
		coupon_result.append("			<div class='coupondetail_resinfo'>");
		coupon_result.append("				<h3>" + "푸지미푸지미푸지미 "+ "</h3>");
		coupon_result.append("				<div>");
		coupon_result.append("					쿠폰 번호<br/>");
		coupon_result.append("					마지막 두 자리를<br/>");
		coupon_result.append("					확인 하세요");									
		coupon_result.append("				</div>");
		coupon_result.append("			</div>");
		coupon_result.append("			<div class='coupondetail_num'>" + "0000-0000-0000" + "</div>");
		coupon_result.append("		</div>");
		coupon_result.append("	</div>");
		coupon_result.append("</div>");
	} else {
		for (CouponTO couponTo : resCouponList) {
			
			int user_seq = couponTo.getUser_seq();
			String cp_serial = couponTo.getCp_serial();
			String user_email = couponTo.getUser_email();
			String user_nickname = couponTo.getUser_nickname();

			String cp_serial_stepOne = cp_serial.substring(0, 4);
			String cp_serial_stepTwo = cp_serial.substring(4, 8);
			String cp_serial_stepThree = cp_serial.substring(8, 10);
			String cp_serial_check = cp_serial.substring(10, 12);
			
			coupon_result.append("<h3>" + user_email + "</h3>");
			coupon_result.append("<div align='center'>");
			coupon_result.append("	<div class='coupon'>");
			coupon_result.append("		<div class='couponmain'>");
			coupon_result.append("			<div class='couponmain_img'>");
			coupon_result.append("				<h3>푸지미</h3>");
			coupon_result.append("				<h2>모바일 식권</h2>");
			coupon_result.append("			</div>");
			coupon_result.append("		</div>");
			coupon_result.append("		<div class='coupondetail'>");
			coupon_result.append("			<div class='coupondetail_resinfo'>");
			coupon_result.append("				<h3>" + user_nickname + "</h3>");
			coupon_result.append("				<div>");
			coupon_result.append("					쿠폰 번호<br/>");
			coupon_result.append("					마지막 두 자리를<br/>");
			coupon_result.append("					확인 하세요<br />");									
			coupon_result.append("					<button idx='"+cp_serial+"' class='couponUse' style='color: black; width: 100px; height: 25px; font-size: 13px;'>사용하기</button>");									
			coupon_result.append("				</div>");
			coupon_result.append("			</div>");
			coupon_result.append("			<div class='coupondetail_num'>" + cp_serial_stepOne + "-" + cp_serial_stepTwo + "-" + cp_serial_stepThree +"-" + "XX" + "</div>");
			coupon_result.append("		</div>");
			coupon_result.append("	</div>");
			coupon_result.append("</div>");
		}
	}
	
	
%>
	
<!DOCTYPE html>
    <!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>My Coupon</title>
    
        <!-- Vendor CSS -->
        <link href="vendors/animate-css/animate.min.css" rel="stylesheet">
        <link href="vendors/fullcalendar/fullcalendar.css" rel="stylesheet">
        <link href="vendors/sweet-alert/sweet-alert.min.css" rel="stylesheet">
        <link href="vendors/material-icons/material-design-iconic-font.min.css" rel="stylesheet">
        <link href="vendors/socicon/socicon.min.css" rel="stylesheet">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">

        <!-- CSS -->
        <link href="css/app.min.1_test.css" rel="stylesheet">
        <link href="css/app.min.2_test.css" rel="stylesheet">
        
        <script type="text/javascript">
        	if (<%=member_admin %> == "-1") {
    			alert("로그인이 필요합니다");
    			location.href="login.member";
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
					<h2>쿠폰 사용</h2>
					쿠폰을 사용합니다.
				</div>
				<div class="row">
				<div class="buy_coupon">
					<div align="center">
						<div class="coupon">
							<div class="couponmain">
								<div class="couponmain_img">
									<h3>푸지미</h3>
									<h2>모바일 식권</h2>
								</div>
							</div>
							<div class="coupondetail">
								<div class="coupondetail_resinfo">
									<h3>쿠폰 입력</h3>
									<div>
										쿠폰 번호<br/>
										12자리를 <br/>
										입력해 주세요										
									</div>
								</div>
								<div class="coupondetail_num">
									<input class="serial" id="serial" name="serial" type="text" maxlength="12">
								</div>
							</div>
						</div>
						<form action="coupon_buy_ok.coupon" method="post" name="coupon_buy_info">
						<hr color="#D5D5D5"/>
							<hr color="#D5D5D5"/>
							<input type="hidden" id="user_seq" value="<%=member_seq %>" name="user_seq"/>
							<input type="hidden" id="cp_serial" value="" name="cp_serial" />
							<div class="cancle_submit">
								<a id="cancle">취소</a>
								<button type="submit" id="submit">구매</button>
							</div>
						</form>
					</div>
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
        
        <script src="vendors/fullcalendar/lib/moment.min.js"></script>
        <script src="vendors/fullcalendar/fullcalendar.min.js"></script>        
        <script src="vendors/nicescroll/jquery.nicescroll.min.js"></script>
        <script src="vendors/waves/waves.min.js"></script>
        <script src="vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
        <script src="vendors/sweet-alert/sweet-alert.min.js"></script>
        
        <script src="js/functions.js"></script>
        <script src="js/demo.js"></script>
        
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function() {
            	$(function(){
            		
        			$("#serial").keyup(function (event) {
                        regexp = /[^0-9]/gi;
                        v = $(this).val();
                        if (regexp.test(v)) {
                        	$(this).val(v.replace(regexp, ''));
                        }
                        
                       	couponAllPrice();
                    });
                	
        			/*
        			$('.couponUse').on('click', function() {
						var cp_serial = $(this).attr('idx');
						$.ajax({
							url: './coupon_use.coupon',
							type: 'post',
							data: {
								cp_serial: $(this).attr('idx'),
							},
							dataType: 'json',
							success: function(json) {
								if(json.flag == 1) {
									alert("쿠폰번호 : " + cp_serial + "\n쿠폰을 사용했습니다.");
									setTimeout("location.reload()", 1000);
								} else {
									alert("쿠폰 사용에 실패했습니다.")
									setTimeout("location.reload()", 1000);
								}
							},
							error : function(xhr, status, error) {
								alert('에러:' + status + '\n\n' + error);
							}
						});
					});
        			*/
            	});
            });
        </script>

    </body>
</html>