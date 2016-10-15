<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="kr.co.pujimi.dto.PaymentTO"%>
<%@ page import ="java.util.ArrayList" %>
    
<%
		request.setCharacterEncoding("utf-8");

		String member_seq = request.getParameter("user_seq");
		String member_admin = request.getParameter("user_admin");
		String price = request.getAttribute("price").toString();
		
		ArrayList<PaymentTO> lists = (ArrayList)request.getAttribute("pay_lists");	
		
		StringBuffer result = new StringBuffer();
		for(PaymentTO payTo : lists){
			
			String pay_date = payTo.getPay_date();
			int pay_price = payTo.getPay_price();
			String pay_method = payTo.getPay_method();
			
			result.append("<tr>");
			result.append("<td>" + pay_date + "</td>");
			result.append("<td>" + pay_price + "</td>");
			result.append("<td>" + pay_method + "</td>");
			result.append("</tr>");
		}		
		
%>
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>IndexPage</title>

        <!-- Vendor CSS -->
        <link href="vendors/fullcalendar/fullcalendar.css" rel="stylesheet">
        <link href="vendors/animate-css/animate.min.css" rel="stylesheet">
        <link href="vendors/sweet-alert/sweet-alert.min.css" rel="stylesheet">
        <link href="vendors/material-icons/material-design-iconic-font.min.css" rel="stylesheet">
        <link href="vendors/socicon/socicon.min.css" rel="stylesheet">
                    
        <!-- CSS -->
        <link href="css/app.min.1_test.css" rel="stylesheet">
        <link href="css/app.min.2_test.css" rel="stylesheet">
         <link rel="stylesheet" href="css/sweetalert2.css">
        
    </head>
    <body class="toggled sw-toggled"> <!-- class="toggled sw-toggled" top_side 들어가는 페이지엔 필수! -->
    <div class="gongbak"></div>
    	<div>
    		<jsp:include page="../template/top_side.jsp" >
    		<jsp:param name="user_seq" value="<%=member_seq %>" />
    		<jsp:param name="user_admin" value="<%=member_admin %>" />
    		</jsp:include>
    	</div>            
        <section id="main">
        <!-- 배경색 지정  -->
            <section id="content">
                <div class="container" style="padding: 0;">
            
                            
                 <!-- Recent Posts -->
            <div class="card">
               <div class="card-header">
                  <h2>
                     포인트 충전 <small>포인트 충전하세요</small>
                  </h2>
               </div>            

               <div class="card-body card-padding">
                  <div role="tabpanel">
                     <div class="pm-body clearfix">
                            <ul class="tab-nav tn-justified">
                                <li class="active"><a aria-controls="home11"
                           role="tab" data-toggle="tab"><h3>충전하기</h3></a></li>
                       <!--  <li><a href="#profile11" aria-controls="profile11" role="tab" data-toggle="tab"><h3>충전내역</h3></a></li> -->
                            </ul>
                        <div class="tab-content">
                           <div role="tabpanel" class="tab-pane active" id="home11">
                              <div style="width: 50%; float: left; border-right: 1px; text-align:center;display:table-cell;vertical-align:middle;">
                                 <h2>사용가능 포인트</h2>
                                 <h1><%=price %></h1>
                              </div>
                              <div style="width: 50%; float: left; border-left: 1px; text-align:center">
                                 <h1><button class="btn bgm-blue btn-lg btn-info" id="sa-charge"><i class="md md-battery-charging-full"></i>충전하기</button></h1> 
                              </div>
                           </div>
                           <div role="tabpanel" class="tab-pane" id="profile11">
                              <div style="width: 50%; float: left; border-right: 1px; text-align:center;display:table-cell;vertical-align:middle;">
                                 <h2>포인트 충전 및 사용 기록</h2>
                              </div>
                              <div style="width: 50%; float: left; border-left: 1px; text-align:center">
                                 <h1><button class="btn bgm-blue btn-lg btn-info" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                          <i class="md md-find-in-page"></i>
                                          조회하기
                                         </button></h1>                                         
                              </div>
                           </div>               
                                                
                        </div>                                          
                     </div>                  
                  </div>
               </div>
               <div class="card-body card-padding">
                  <div role="tabpanel">
                     <div class="pm-body clearfix">
                            <ul class="tab-nav tn-justified">
                                <li class="active"><a aria-controls="home11"
                           role="tab" data-toggle="tab"><h3>충전내역 리스트</h3></a></li>
                            </ul>
                     </div> 
                     <div class="table-responsive">
		                  <table class="table table-hover">
                              <thead>
                                  <tr>
                                      <th style="font-size: 20px; border-bottom: 2px solid #2196f3;">결제일</th>
                                      <th style="font-size: 20px; border-bottom: 2px solid #2196f3;">결제금액</th>
                                      <th style="font-size: 20px; border-bottom: 2px solid #2196f3;">결제수단</th>
                                  </tr>
                              </thead>
                              <tbody>
									<%=result %>
                              </tbody>
		                 </table>
		                </div>
		           </div>                 
                  </div>
               </div>
            </div></section>
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
        <script src="vendors/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
        
        <script src="js/flot-charts/curved-line-chart.js"></script>
        <script src="js/flot-charts/line-chart.js"></script>
        <script src="js/charts.js"></script>
        <script src="js/sweetalert2.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/es6-promise/latest/es6-promise.min.js"></script>
 
        <script src="js/functions.js"></script>
        <script src="js/demo.js"></script>
        <script type="text/javascript">
          $('#top_side').load('top_side-test.jsp');
       
       $(document).ready(function(){          
          
           //charge Message
            $('#sa-charge').click(function(){
              
            	var price = "value1";
              	var method = "value2";
              	var user_seq = <%=member_seq%>
               
              	if (user_seq == '-1') {
            		alert("로그인이 필요합니다.")
					return false;
				}
              
               swal({
                    confirmButtonText: '다음 &rarr;',
                    cancelButtonText: '취소',
                    showCancelButton: true,                    
                    animation: false,
                    progressSteps: ['1', '2']
                  });
               
                  var steps = [
                      {                       
                       title: '금액을 선택하세요',
                       input: 'radio',
                       inputOptions: {                         
                         '10000': '10,000원',                         
                         '20000': '20,000원',                         
                         '30000': '30,000원',
                         '40000': '40,000원',
                         '50000': '50,000원'                         
                       },
                       inputPlaceholder: '충전 금액',
                       confirmButtonText : '확인',
                       showCancelButton : true,
                       cancelButtonText : '취소',
                       inputValidator : function(value){
                          return new Promise(function(resolve, reject){
                             if(value == '10000' || value == '20000' || value == '30000' || value == '40000' || value == '50000'){                              
                                price = value;
                                resolve();                                  
                             }else{
                                reject('충전 금액을 선택하세요');
                             }
                          })
                       }
                    },
                    
                    
                    {                       
                       title: '결제 방법을 선택하세요',
                       input : 'radio',
                       inputOptions: {
                           '신용카드': '신용카드',
                           '휴대폰': '휴대폰',
                           '무통장입금': '무통장입금',
                           '계좌이체': '계좌이체'
                         },
                         inputPlaceholder: '결제 방식',
                         confirmButtonText : '확인',
                         showCancelButton : true,
                         cancelButtonText : '취소',
                         inputValidator : function(value){
                           return new Promise(function(resolve, reject){
                              if(value == '신용카드' || value == '휴대폰' || value == '무통장입금' || value == '계좌이체'){
                                 method = value;
                                 resolve();                                  
                              }else{
                                 reject('결제 방법을 선택하세요');
                              }
                           })
                        }
                      }                     
                  ];

                  swal.queue(steps).then(function() {
                    swal.resetDefaults();
                    swal({
                       title: '결제 확인',
                         input: 'checkbox',
                         inputValue: 1,
                         text : '금액 : ' +  price + ' 방법 : ' + method,
                         showCancelButton : true,
                         cancelButtonText : '취소',
                         inputPlaceholder:
                           '위 구매조건 확인 및 결제진행에 동의',
                         confirmButtonText:
                           '확인 <i class="fa fa-arrow-right></i>',
                         inputValidator : function(value){
                          return new Promise(function(resolve, reject){
                             if(value == 1){
                                resolve();
                             }else{
                                reject('동의를 하셔야 합니다.');
                             }
                          })
                       }
                    }).then(function(){
                       swal({
                           type : 'success',
                            title: '포인트가 충전되었습니다.',
                            confirmButtonText: '확인',
                            showCancelButton: false
                          });
                       $.ajax({
                    	   url: './chargePointOk.charge',
                    	   type: 'post',
                    	   data:{
                    		   price : price,
                    		   method : method,
                    		   user_seq : user_seq
                    	   },
                    	   dataType:'json',
                    	   success: function(json){
                    		   if(json.flag == 0){
                    			   setTimeout("location.reload()", 2000);
                    		   }else{
                    			   alert("충전에 실패했습니다.");
                    		   }
                    	},
                    		   error : function(xhr, status, error){
                    			   alert('에러 : ' +status + '\n\n' + error);
                    		   }
                       })
                    });                    
                  }, function() {
                    swal.resetDefaults();
                  });
            });    
       })
        </script>

        
    </body>
  </html>