<%@page import="kr.co.pujimi.dto.ResChartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String member_seq = request.getParameter("user_seq");
	String member_admin = request.getParameter("user_admin");
	
	ResChartDTO rcDTO = (ResChartDTO)request.getAttribute("rcdto");
	ResChartDTO rcDTO2 = (ResChartDTO)request.getAttribute("rcdto2");
	
	String res_grade = rcDTO.getRes_grade();
	String res_revenue = rcDTO.getRes_revenue();
	
	String cp_udate = rcDTO2.getCp_udate();
	
	double dres_grade = Double.parseDouble(res_grade);
	double dres_revenue = Double.parseDouble(res_revenue);
	dres_grade = (Math.round(dres_grade * 100) / 100.0) * 20;
	System.out.println("소수점 " + dres_grade);
	
	System.out.println(res_grade + "///" + res_revenue);
%> 
<!DOCTYPE html>
    <!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>식당 매출 정보</title>
    
        <!-- Vendor CSS -->
        <link href="vendors/animate-css/animate.min.css" rel="stylesheet">
        <link href="vendors/sweet-alert/sweet-alert.min.css" rel="stylesheet">
        <link href="vendors/material-icons/material-design-iconic-font.min.css" rel="stylesheet">
        <link href="vendors/socicon/socicon.min.css" rel="stylesheet">
            
        <!-- CSS -->
        <link href="css/app.min.1_test.css" rel="stylesheet">
        <link href="css/app.min.2_test.css" rel="stylesheet">
        
        <!-- C3 -->
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>       
        
    </head>
    
    <body class="toggled sw-toggled">
    <div class="gongbak"></div>
        <div>
    		<jsp:include page="../template/top_side.jsp" >
    		<jsp:param name="user_seq" value="<%=member_seq %>" />
    		<jsp:param name="user_admin" value="<%=member_admin %>" />
    		</jsp:include>
    	</div>   
    
    <!-- c3, d3 -->
    <script src="https://d3js.org/d3.v3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
            
        	<!-- 차트 시작 페이지 -->  	
        	
            <section id="content">
                <div class="container">
                    <div class="block-header">
                    <%=cp_udate %>
                        <h2>식당 매출 정보 <small>식당 관리자가 메출 정보를 보기 쉽게 시각화 시킨 페이지입니다.</small></h2>
                    <div class="mini-charts">
                        <div class="row">
                            <div class="col-sm-3">
                                <div class="mini-charts-item bgm-cyan">
                                    <div class="clearfix">
                                        <div class="chart stats-bar"></div>
                                        <div class="count">
                                            총 매출액 
                                            <h2><%=res_revenue %>원</h2>                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-sm-3">
                                <div class="mini-charts-item bgm-lightgreen">
                                    <div class="clearfix">
                                        <div class="chart stats-bar-2"></div>
                                        <div class="count">
                                            이번 달 매출액
                                            <h2>356,785K</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-sm-3">
                                <div class="mini-charts-item bgm-orange">
                                    <div class="clearfix">
                                        <div class="chart stats-line"></div>
                                        <div class="count">
                                            이번 주 매출액
                                            <h2>$ 458,778</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>                                
                            
                            <div class="col-sm-3">
                                <div class="mini-charts-item bgm-teal">
                                    <div class="clearfix">
                                        <div class="chart chart-pie stats-pie"></div>
                                        <div class="count">
                                            총 리뷰 수
                                            <h2>99.87%</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>                                              
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="epc-item bgm-pink">
                                <div class="easy-pie main-pie" data-percent="45">
                                    <div class="percent">45</div>
                                    <div class="pie-title">여성고객 비율</div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-sm-3">
                            <div class="epc-item bgm-orange">
                                <div class="easy-pie main-pie" data-percent="88">
                                    <div class="percent">88</div>
                                    <div class="pie-title">20대 비율</div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-sm-3">
                            <div class="epc-item bgm-green">
                                <div class="easy-pie main-pie" data-percent="25">
                                    <div class="percent">25</div>
                                    <div class="pie-title">식권 사용률</div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-sm-3">
                            <div class="epc-item bgm-purple">
                                <div class="easy-pie main-pie" data-percent="<%=dres_grade%>">
                                    <div class="percent"><%=dres_grade %></div>
                                    <div class="pie-title">전체 평점</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    </div>                   
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>요일별 성별 매출 정보</h2>
                                                          
                                </div>
                            
                                <div class="card-body">
                                    <div class="chart-edge">                                    	
                                        <div id="chart3"></div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>요일별 연령별 매출 정보</h2>                               
                                    
                                </div>
                                
                                <div class="card-body">
                                    <div class="chart-edge">
                                        <div id="chart4"></div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>일별 매출 정보</h2>                                   
                                </div>
                                
                                <div class="card-body card-padding-sm">
                                    <div id="chart1"></div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>식당 평점 추세</h2>
                                </div>
                                
                                <div class="card-body card-padding-sm">
                                    <div id="chart2"></div>                             
                                </div>
                            </div>
                        </div>
                     
                        
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>식품군별 메뉴 정보                       
                                 
                                    
                                    </h2>                           
                                    
									                                     
                                </div>
                                
                                <div class="card-body card-padding">
                                    <div id="chart5"></div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2>식품군 구성 정보
                                    
                                    <select id="s1">
										    <option>식품군 선택</option>
										    <option>밥류</option>
										    <option>국류</option>
										    <option>고기류</option>
										    <option>채소류</option>
										    <option>생선류</option>
									</select>
                                    
                                    </h2>
                                </div>
                                
                                <div class="card-body card-padding">
                                    <div id="chart6"></div>
                                </div>
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
        
        <script src="vendors/flot/jquery.flot.min.js"></script>
        <script src="vendors/flot/jquery.flot.resize.min.js"></script>
        <script src="vendors/flot/jquery.flot.orderBar.js"></script>
        <script src="vendors/flot/jquery.flot.pie.min.js"></script>
        <script src="vendors/flot/jquery.flot.tooltip.js"></script>
        <script src="vendors/flot/plugins/curvedLines.js"></script>
        <script src="vendors/nicescroll/jquery.nicescroll.min.js"></script>
        <script src="vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
        <script src="vendors/waves/waves.min.js"></script>
        <script src="vendors/sweet-alert/sweet-alert.min.js"></script>
        
        <!-- 미니 차트 -->
        <script src="vendors/sparklines/jquery.sparkline.min.js"></script>
        <script src="vendors/easypiechart/jquery.easypiechart.min.js"></script>
        
        <!-- Charts - Please read the read-me.txt inside the js folder-->
        <script src="js/flot-charts/curved-line-chart.js"></script>
        <script src="js/flot-charts/line-chart.js"></script>
        <script src="js/flot-charts/bar-chart.js"></script>
        <script src="js/flot-charts/pie-chart.js"></script>
        <script src="js/flot-charts/c3-chart.js"></script>
        
        <script src="js/charts.js"></script> 
        <script src="js/functions.js"></script>
        <script src="js/demo.js"></script>
        
        
    </body>
</html>