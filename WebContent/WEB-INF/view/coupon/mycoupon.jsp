<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.pujimi.dto.CouponTO"%>
<%@page import="kr.co.pujimi.dto.ResTO"%>    
<%
	request.setCharacterEncoding("utf-8");

	String member_seq = request.getParameter("user_seq");
	String member_admin = request.getParameter("user_admin");
	
	ArrayList<CouponTO> couponList = (ArrayList)request.getAttribute("couponList");
	
	StringBuffer coupon_result = new StringBuffer();

	if(couponList.size()==0){
		coupon_result.append("<h3>" + "보유 쿠폰이 없습니다." + "</h3>");
		coupon_result.append("<div align='center'>");
		coupon_result.append("	<div class='coupon'>");
		coupon_result.append("		<div class='couponmain'>");
		coupon_result.append("			<div class='couponmain_img'>");
		coupon_result.append("			<img alt='' src='img/pujimicouponlogo96.png'>");
		coupon_result.append("				<h3>푸지미</h3>");
		coupon_result.append("				<h2>모바일 식권</h2>");
		coupon_result.append("			</div>");
		coupon_result.append("		</div>");
		coupon_result.append("		<div class='coupondetail'>");
		coupon_result.append("			<div class='coupondetail_resinfo'>");
		coupon_result.append("				<h3>" + "쿠폰이 없습니다"+ "</h3>");
		coupon_result.append("				<div>");
		coupon_result.append("					쿠펀 번호는<br/>");
		coupon_result.append("					구매 후<br/>");
		coupon_result.append("					확인 하세요");									
		coupon_result.append("				</div>");
		coupon_result.append("			</div>");
		coupon_result.append("			<div class='coupondetail_num'>" + "0000-0000-0000" + "</div>");
		coupon_result.append("		</div>");
		coupon_result.append("	</div>");
		coupon_result.append("</div>");
	} else {
		for (CouponTO couponTo : couponList) {
			String cp_serial = couponTo.getCp_serial();
			String res_name = couponTo.getRes_name();
			if (res_name.length() > 8) {
				res_name = res_name.substring(0, 8) + "...";
			}
			
			String cp_serial_stepOne = cp_serial.substring(0, 4);
			String cp_serial_stepTwo = cp_serial.substring(4, 8);
			String cp_serial_stepThree = cp_serial.substring(8, 12);
			
			coupon_result.append("<h3>" + res_name + "</h3>");
			coupon_result.append("<div align='center'>");
			coupon_result.append("	<div class='coupon'>");
			coupon_result.append("		<div class='couponmain'>");
			coupon_result.append("			<div class='couponmain_img'>");
			coupon_result.append("			<img alt='' src='img/pujimicouponlogo96.png'");
			coupon_result.append("				<h3>푸지미</h3>");
			coupon_result.append("				<h2>모바일 식권</h2>");
			coupon_result.append("			</div>");
			coupon_result.append("		</div>");
			coupon_result.append("		<div class='coupondetail'>");
			coupon_result.append("			<div class='coupondetail_resinfo'>");
			coupon_result.append("				<h3>" + res_name + "</h3>");
			coupon_result.append("				<div>");
			coupon_result.append("					쿠폰 번호<br/>");
			coupon_result.append("					마지막 두 자리를<br/>");
			coupon_result.append("					확인 하세요");									
			coupon_result.append("				</div>");
			coupon_result.append("			</div>");
			coupon_result.append("			<div class='coupondetail_num'>" + cp_serial_stepOne + "-" + cp_serial_stepTwo + "-" + cp_serial_stepThree + "</div>");
			coupon_result.append("		</div>");
			coupon_result.append("	</div>");
			coupon_result.append("</div>");
		}
	}
	
	ArrayList<CouponTO> lists = (ArrayList)request.getAttribute("usedCpList");	
	StringBuffer result = new StringBuffer();
	
	for(CouponTO cpTo : lists){
		
		String res_name = cpTo.getRes_name();
		String cp_serial = cpTo.getCp_serial();
		String cp_cdate = cpTo.getCp_cdate();
		String cp_udate = cpTo.getCp_udate();
		String cp_edate = cpTo.getCp_edate();
		
		result.append("<tr>");
		result.append("<td>" + res_name + "</td>");
		result.append("<td>" + cp_serial + "</td>");
		result.append("<td>" + cp_cdate + "</td>");
		result.append("<td>" + cp_udate + "</td>");
		result.append("<td>" + cp_edate + "</td>");
		result.append("</tr>");

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
					<h2>내 쿠폰</h2>
					개인 페이지입니다.
				</div>
				
				<div id="accordion">
					<%=coupon_result %>
				</div>
				 <div class="card-header">
				 <br /><hr />
                            <h2>사용된 쿠폰 목록</h2>
                </div>
                    <div class="table-responsive">
                          <table class="table table-hover">
                              <thead>
                                  <tr>
                                      <th style="font-size: 20px; border-bottom: 2px solid #2196f3;">사용가맹점</th>
                                      <th style="font-size: 20px; border-bottom: 2px solid #2196f3;">쿠폰번호</th>
                                      <th style="font-size: 20px; border-bottom: 2px solid #2196f3;">쿠폰구매날짜</th>
                                      <th style="font-size: 20px; border-bottom: 2px solid #2196f3;">쿠폰사용날짜</th>
                                      <th style="font-size: 20px; border-bottom: 2px solid #2196f3;">쿠폰만료기간</th>
                                  </tr>
                              </thead>
                              <tbody>
						<!-- 리스트시작 -->
							<%=result %>
						<!-- 리스트끝 -->
                              </tbody>
                          </table>
                       </div>
                       <br /><br /><br />
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
            	$( "#accordion" ).accordion({
            		collapsible: true,
            		heightStyle: "content"
            	});
            });
        </script>
   <footer>
      <div>
         <div class="pujimiFooter"> Copyright 2016, Pujimi All Rights Reserved</div>
      </div>
   </footer>
    </body>
</html>