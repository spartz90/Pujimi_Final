<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.pujimi.dto.CouponTO"%>
<%
	request.setCharacterEncoding("utf-8");
	
	CouponTO cTo = (CouponTO)request.getAttribute("cTo");

	String res_name = cTo.getRes_name();
	int res_price = cTo.getRes_price();
	int user_point =cTo.getUser_point();
	
	System.out.print(res_name + "///" + res_price + "///" + user_point);
	
	String member_seq = request.getParameter("user_seq");
	String member_admin = request.getParameter("user_admin");
	
	//System.out.println(res_name + "///" + res_price + "///" + user_point);
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
					<h2>쿠폰 구매</h2>
					쿠폰을 구매합니다.
				</div>
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
									<h3><%=res_name %></h3>
									<div>
										쿠폰 번호는<br/>
										구매 후 <br/>
										확인 하세요										
									</div>
								</div>
								<div class="coupondetail_num"></div>
							</div>
						</div>
						<hr color="#D5D5D5"/>
						<div class="buy_coupon_info">
							<div class="buy_coupon_info_point">가격&nbsp&nbsp&nbsp<%=res_price %>P</div>
							<div class="buy_coupon_info_amount">
								<button class="amountdown">-</button>
								<button class="amountup">+</button>
								<input type="text" id="amount" value="1" name="amount"/>수량&nbsp&nbsp&nbsp
							</div>
							<br/>
							<div class="clearfix" style="border-bottom: 2px dashed;"></div>
							<br/>
							<div class="buy_coupon_info_point">보유 Point</div>
							<div class="buy_coupon_info_point"><%=user_point %>P</div>
							<div class="clearfix"></div>
							<div class="buy_coupon_info_point">-&nbsp&nbsp&nbsp&nbsp쿠폰 가격</div>
							<div class="buy_coupon_info_point">15000P</div>
							<br/>
							<div class="clearfix" style="height:20px; border-bottom: 2px dashed;"></div>
							<br/>
							<div class="buy_coupon_info_point">잔여 Point</div>
							<div class="buy_coupon_info_point">1000P</div>
						</div>
						<hr color="#D5D5D5"/>
						<div class="cancle_submit">
							<button>취소</button>
							<button>구매</button>
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
        
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
        <script type="text/javascript">
        	$(document).ready(function() {
        		/*
        		$(function(){
        			$('#amount').keypress(function(event){
        				if (event.which && (event.which  > 47 && event.which  < 58 || event.which == 8)) {
							if ($('#amount').val()<= 0) {
								//$('#amount').val(0);
							}
        				} else {
        			    event.preventDefault();
        				}
        				
        			});
        		});*/
        		
        		$("#amount").keyup(function (event) {
        			//if ($("#amount").val()>=100) {
                    //	event.preventDefault();
    				//}
                    regexp = /\d\d{2,100}/gi;
                    v = $(this).val();
                    
                    if (regexp.test(v)) {
                    	$(this).val(v.replace(regexp, '1'));
                    }
                    regexp = /[^0-9]/gi;
                    v = $(this).val();
                    
                    if (regexp.test(v)) {
                    	$(this).val(v.replace(regexp, ''));
                    }
                });
        		

       


			});
        </script>
       

    </body>
</html>