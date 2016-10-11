<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="kr.co.pujimi.dto.UserTO" %>
<%@ page import ="java.util.ArrayList" %>

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>User Management Page</title>
    
        <!-- Vendor CSS -->
        <link href="vendors/animate-css/animate.min.css" rel="stylesheet">
        <link href="vendors/sweet-alert/sweet-alert.min.css" rel="stylesheet">
        <link href="vendors/material-icons/material-design-iconic-font.min.css" rel="stylesheet">
        <link href="vendors/socicon/socicon.min.css" rel="stylesheet">
            
        <!-- CSS -->
        <link href="css/app.min.1_test.css" rel="stylesheet">
        <link href="css/app.min.2_test.css" rel="stylesheet">
        
<%
		request.setCharacterEncoding("utf-8");

		String member_seq = request.getParameter("user_seq");
		String member_admin = request.getParameter("user_admin");

		ArrayList<UserTO> lists = (ArrayList)request.getAttribute("user_lists");	
		StringBuffer result = new StringBuffer();
		
		for(UserTO userTo : lists){
			String user_seq = Integer.toString(userTo.getUser_seq());
			String user_email = userTo.getUser_email();
			String user_nickname = userTo.getUser_nickname();
			String user_gender = "";
			if(Integer.toString(userTo.getUser_gender()).equals("0")){
				user_gender = "남자";
			}else{
				user_gender = "여자";
			}
			
			String user_age = userTo.getUser_age();
			String user_admin = Integer.toString(userTo.getUser_admin());
			
			result.append("<tr>");
			result.append("<td>" + user_seq + "</td>");
			result.append("<td>" + user_email + "</td>");
			result.append("<td>" + user_nickname + "</td>");
			result.append("<td>" + user_gender + "</td>");
			result.append("<td>" + user_age + "</td>");
			result.append("<td>" + user_admin + "</td>");
			result.append("<td>" + "<button>수정</button>" + "&nbsp;" + "<button>삭제</button>" + "</td>");			
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
                            <h2>유저 관리 테이블<small>All User' Information List</small></h2>
                        </div>
                        
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Seq</th>
                                        <th>Email</th>
                                        <th>Nickname</th>
                                        <th>Gender</th>
                                        <th>Birth</th>
                                        <th>Admin</th>
                                        <th>Management</th>
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