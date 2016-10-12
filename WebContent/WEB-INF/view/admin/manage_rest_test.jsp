<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="kr.co.pujimi.dto.ResTO" %>
<%@ page import ="java.util.ArrayList" %>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Restaurant Management Page</title>
    
        <!-- Vendor CSS -->
        <link href="vendors/animate-css/animate.min.css" rel="stylesheet">
        <link href="vendors/sweet-alert/sweet-alert.min.css" rel="stylesheet">
        <link href="vendors/material-icons/material-design-iconic-font.min.css" rel="stylesheet">
        <link href="vendors/socicon/socicon.min.css" rel="stylesheet">
            
        <!-- CSS -->
        <link href="css/app.min.1_test.css" rel="stylesheet">
        <link href="css/app.min.2_test.css" rel="stylesheet">
        
        <style type="text/css">
        	
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
        
<%
		request.setCharacterEncoding("utf-8");

		String member_seq = request.getParameter("user_seq");
		String member_admin = request.getParameter("user_admin");

		ArrayList<ResTO> lists = (ArrayList)request.getAttribute("res_lists");	
		StringBuffer result = new StringBuffer();
		
		for(ResTO resTo : lists){
			
			int user_seq = resTo.getUser_seq();
			String user_email = resTo.getUser_email();
			int res_seq = resTo.getRes_seq();
			String res_name = resTo.getRes_name();
			String res_addr = resTo.getRes_addr();
			String res_phone = resTo.getRes_phone();
			String res_octime = resTo.getRes_octime();
			String otime = res_octime.substring(0, 7);
			String ctime = res_octime.substring(9);
			String res_contetnt = resTo.getRes_content();
			int res_point = resTo.getRes_point();
			int res_revenue = resTo.getRes_revenue();
			
			
			result.append("<tr>");
			result.append("<td>" + user_seq + "</td>");
			result.append("<td>" + user_email + "</td>");
			result.append("<td>" + res_seq + "</td>");
			result.append("<td>" + res_name + "</td>");
			result.append("<td>" + res_addr + "</td>");
			result.append("<td>" + res_phone + "</td>");
			result.append("<td>" + otime + "</td>");
			result.append("<td>" + ctime + "</td>");
			result.append("<td>" + res_contetnt + "</td>");
			result.append("<td>" + res_point + "</td>");
			result.append("<td>" + res_revenue + "</td>");
			result.append("<td>" + "<input type='button' id='btn1' value='수정' onclick='javascript:location.href=\"manage_rest_modify.admin?user_seq="+ member_seq +"&res_seq="+ res_seq + "&user_admin="+ member_admin +"\"'/>" 
			+ "&nbsp;"+ "&nbsp;" + "<input type='button' id='btn1' value='삭제' onclick='javascript:location.href=\"manage_rest_delete.admin?user_seq="+ member_seq +"&res_seq="+ res_seq + "&user_admin="+ member_admin +"\"'/>" + "</td>");
			result.append("</tr>");

		}
%>
        
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
	                  <div class="card">
                        <div class="card-header">
                            <h2>가맹점 관리 테이블<small>All User' Information List</small></h2>
                        </div>
                        
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Seq</th>
                                        <th>Email</th>
                                        <th>Res_seq</th>
                                        <th>Name</th>
                                        <th>Addr</th>
                                        <th>Phone</th>
                                        <th>Otime</th>
                                        <th>Ctime</th>
                                        <th>Contetnt</th>
                                        <th>Point</th>
                                        <th>Revenue</th>
                                        <th>Manage</th>
                                    </tr>
                                </thead>
                                <tbody>
								<!-- 리스트시작 -->
								<%=result %>
								<!-- 리스트끝 -->
                                </tbody>
                            </table>
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
        <script src="vendors/nicescroll/jquery.nicescroll.min.js"></script>
        <script src="vendors/waves/waves.min.js"></script>
        <script src="vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
        <script src="vendors/sweet-alert/sweet-alert.min.js"></script>
        
        <script src="js/functions.js"></script>
        <script src="js/demo.js"></script>
        
    </body>
  </html>