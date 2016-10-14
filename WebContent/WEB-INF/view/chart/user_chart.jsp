<%@page import="kr.co.pujimi.dto.LikeMenuDTO"%>
<%@page import="kr.co.pujimi.dao.LikeMenuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="kr.co.pujimi.dao.MenuDAO"%>
<%@ page import="kr.co.pujimi.dto.MenuDTO"%>
<%@ page import="java.util.ArrayList"%>

<%
	request.setCharacterEncoding("utf-8");


	String member_seq = request.getParameter("user_seq");
	String member_admin = request.getParameter("user_admin");
	
	ArrayList<LikeMenuDTO> lists = (ArrayList)request.getAttribute("likeMenu_lists");
	
	StringBuffer result = new StringBuffer();
	for(LikeMenuDTO lmdto : lists){
		
		String like_menu = lmdto.getMenu_name();
		String like_date = lmdto.getLike_date();
		
		result.append("<tr>");
		result.append("<td>" + like_date + "</td>");
		result.append("<td>" + like_menu + "</td>");
		result.append("</tr>");
	}
%>

<!DOCTYPE html>
    <!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>식단 관리 정보</title>
    
        <!-- Vendor CSS -->
        <link href="vendors/animate-css/animate.min.css" rel="stylesheet">
        <link href="vendors/sweet-alert/sweet-alert.min.css" rel="stylesheet">
        <link href="vendors/material-icons/material-design-iconic-font.min.css" rel="stylesheet">
        <link href="vendors/socicon/socicon.min.css" rel="stylesheet">
        <link href="vendors/noUiSlider/jquery.nouislider.min.css" rel="stylesheet">
            
        <!-- CSS -->
        <link href="css/app.min.1_test.css" rel="stylesheet">
        <link href="css/app.min.2_test.css" rel="stylesheet">
        
        <!-- C3 -->
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>  
    	     
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
    
    <!-- c3, d3 -->
    <script src="https://d3js.org/d3.v3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
            
        	<!-- 차트 시작 페이지 -->  	
        	
            <section id="content">
                <div class="container">
                    <div class="block-header">
                        <h2>사용자 사용 정보 <small>식권 사용자가 사용 정보를 보기 쉽게 시각화 시킨 페이지입니다.</small></h2>
                   
                            <div class="col-sm-3">
                                <div class="mini-charts-item bgm-cyan">
                                    <div class="clearfix">                                      
                                        <div class="count">
                                            총 사용금액 
                                            <h2 align="right">$987,459</h2>                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-sm-3">
                                <div class="mini-charts-item bgm-lightgreen">
                                    <div class="clearfix">                                        
                                        <div class="count">
                                            이번달 사용금액
                                            <h2 align="right">356,785K</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-sm-3">
                                <div class="mini-charts-item bgm-orange">
                                    <div class="clearfix">                                       
                                        <div class="count">
                                            이번주 사용금액
                                            <h2 align="right">$ 458,778</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>                                
                            
                            <div class="col-sm-3">
                                <div class="mini-charts-item bgm-teal">
                                    <div class="clearfix">                                        
                                        <div class="count">
                                            쿠폰 사용률
                                            <h2 align="right">99.87%</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>                                              
                    
                 </div>                   
                    
                    <div class="row">
                        <div class="col-md-6" style="padding-right: 0;">
                            <div class="card">
                                <div class="card-header">
                                    <h2>요일별 포인트 충전 정보</h2>                        
                                </div>
                            
                                <div class="card-body">
                                    <div class="chart-edge">
                                        <div id="chart11"></div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6" style="padding-right: 0;">
                            <div class="card">
                                <div class="card-header">
                                    <h2>요일별 쿠폰 사용 정보</h2>                               
                                    
                                </div>
                                
                                <div class="card-body">
                                    <div class="chart-edge">
                                        <div id="chart12"></div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                                        
                        
                        <div class="col-md-6" style="padding-right: 0;">
                            <div class="card">
                                <div class="card-header">
                                    <h2>식품군별 메뉴 정보</h2>                                    
                                </div>
                                
                                <div class="card-body card-padding">
                              
                                    <div id="chart5"></div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6" style="padding-right: 0;">
                            <div class="card">
                                <div class="card-header">
                                    <h2>식품군 구성 정보</h2>   
                                <div style="position: absolute; width: 90%">
                                <form align="right">
								  <label><input type="radio" name="dataset" value="rice" checked>밥류</label>
								  <label><input type="radio" name="dataset" value="soup">국류</label>
								  <label><input type="radio" name="dataset" value="meat">고기류</label>
								  <label><input type="radio" name="dataset" value="veg">채소류</label>
								  <label><input type="radio" name="dataset" value="fish">생선류</label>
								</form>                                 
                                </div>
                                </div>
                                <div class="card-body card-padding">
                                    <div id="chart6"></div>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="col-md-12">
                            <div class="card" style="position: absolute; width : 100%; padding: 10px;">
                            	<div class="card-header">
                            		<h2>음식 선호도</h2>
                        		</div> 		
                    		

								<div algin="center">
									<label class="page1">식품군</label>									 
									    <select id="food_group" name="food_group" >
									        <option>음식군을 선택하세요</option>
									        <option>밥류</option>									        
									        <option>빵 및 과자류</option>
									        <option>면 및 만두류</option>
									        <option>죽 및 스프류</option>
									        <option>국 및 탕류</option>
									        <option>찌개 및 전골류</option>
									        <option>찜류</option>
									        <option>구이류</option>
									        <option>전/ 적 및 부침류</option>
									        <option>볶음류</option>
									        <option>조림류</option>
									        <option>튀김류</option>
									        <option>나물/숙채류</option>
									        <option>생채/무침류</option>
									        <option>김치류</option>
									        <option>젓갈류</option>
									        <option>장아찌/절임류</option>
									        <option>음료 및 차류</option>
									        <option>곡류, 서류 제품</option>
									        <option>수조어육류</option>								        								        								        
									    </select>								    
									    
									    <label class="page1">&nbsp; &nbsp;음식 이름</label>
									
									    <select id="food" name="food"></select>
									
									<h1><button class="btn bgm-blue btn-lg btn-info" id="food-like"><i class="md-thumb-up"></i>장바구니에 추가</button>
									<button class="btn bgm-blue btn-lg btn-info" id="food-dislike"><i class="md-thumb-down"></i>장바구니에서 제거</button></h1>
																								
																		
									<div class="col-sm-6 m-b-20">
										<p class="f-500 m-b-20 c-black">지금 좋아한 음식들</p>
										<ul class="list-group" id="likeList">								
										</ul>
										<button id="insertMenu"><i class='md md-add-shopping-cart'></i>추가</button>
									</div>
									<div class="col-sm-6 m-b-20">
										<p class="f-500 m-b-20 c-black">예전에 좋아한 음식들</p>
								<div class="table-responsive">
									<table class="table table-hover" id="likeMenuList">
										<thead>
											<tr>
												<th
													style="font-size: 20px; border-bottom: 2px solid #2196f3;">추가한 날짜</th>
												<th
													style="font-size: 20px; border-bottom: 2px solid #2196f3;">메뉴 이름</th>
											</tr>
										</thead>
										<tbody>
											<%=result%>
										</tbody>
									</table>
								</div>
							</div>
																
								</div>			
						
					</div>                       		                      	     
                   </div>
                  </div>           
                        
                </div>
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
        <script src="vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
                
        
        <script src="vendors/moment/moment.min.js"></script>
        <script src="vendors/nicescroll/jquery.nicescroll.min.js"></script>
        <script src="vendors/auto-size/jquery.autosize.min.js"></script>
        <script src="vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="vendors/chosen/chosen.jquery.min.js"></script>
        <script src="vendors/noUiSlider/jquery.nouislider.all.min.js"></script>
        <script src="vendors/input-mask/input-mask.min.js"></script>
        <script src="vendors/farbtastic/farbtastic.min.js"></script>
        <script src="vendors/summernote/summernote.min.js"></script>
        <script src="vendors/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
        <script src="vendors/fileinput/fileinput.min.js"></script>
        <script src="vendors/waves/waves.min.js"></script>
        <script src="vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
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
        <script src="js/demo.js"></script>
        
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
        
        <script type="text/javascript">
    		$('#top_side').load('top_side-test.jsp');   		
    		jQuery(function($) {
    		    var foods = {
    		        '밥류': ['콩나물해장국',
    		               '소머리국밥',
    		               '김밥',
    		               '김치김밥',
    		               '샐러드김밥',
    		               '소고기김밥',
    		               '참치김밥',
    		               '치즈김밥',
    		               '충무김밥',
    		               '고추장불고기삼각김밥',
    		               '참치마요네즈삼각김밥',
    		               '숯불갈비삼각김밥',
    		               '제육덮밥',
    		               '불고기덮밥',
    		               '오징어덮밥',
    		               '장어덮밥',
    		               '해물덮밥',
    		               '회덮밥',
    		               '참치덮밥',
    		               '류산슬덮밥',
    		               '송이덮밥',
    		               '볶음밥',
    		               '김치볶음밥',
    		               '새우볶음밥',
    		               '해물볶음밥',
    		               '오므라이스',
    		               '삼선볶음밥',
    		               '비빔밥',
    		               '육회비빔밥',
    		               '농어초밥',
    		               '문어초밥',
    		               '연어초밥',
    		               '새우초밥',
    		               '장어초밥',
    		               '한치초밥',
    		               '유부초밥',
    		               '잡채밥',
    		               '잡탕밥',
    		               '자장밥',
    		               '카레라이스',
    		               '알밥',
    		               '짬뽕밥',
    		               '오곡밥',
    		               '새우튀김롤',
    		               '연어롤',
    		               '캘리포니아롤',
							],
    		        '빵 및 과자류': ['꽈배기',
    		                  '찹쌀도우넛',
    		                  '만주',
    		                  '머핀',
    		                  '베이글',
    		                  '곰보빵',
    		                  '마늘빵',
    		                  '모닝빵',
    		                  '버터크림빵',
    		                  '페이스트리빵',
    		                  '카스텔라',
    		                  '햄치즈샌드위치',
    		                  '생크림케이크',
    		                  '초콜릿케이크',
    		                  '치즈케이크',
    		                  '채소고로케',
    		                  '한과,산자',
    		                  '한과,약과',
    		                  '한과,매작과 ',
    		                  '한과,송화다식',
    		                  '한과,유과   ',
							],
					'면 및 만두류': ['자장면',
    		                    '간자장',
    		                    '삼선자장면',
    		                    '막국수',
    		                    '비빔국수',
    		                    '잔치국수',
    		                    '쫄면',
    		                    '물냉면',
    		                    '비빔냉면',
    		                    '열무냉면',
    		                    '회냉면',
    		                    '떡국',
    		                    '떡만둣국',
    		                    '고기만두',
    		                    '군만두',
    		                    '김치만두',
    		                    '물만두',
    		                    '만둣국',
    		                    '수제비',
    		                    '오일소스스파게티',
    		                    '크림소스스파게티',
    		                    '토마토소스스파게티',
    		                    '해물크림소스스파게티',
    		                    '해물토마토소스스파게티',
    		                    '김치우동',
    		                    '삼선우동',
    		                    '짬뽕',
    		                    '굴짬뽕',
    		                    '삼선짬뽕',
    		                    '해물칼국수',
    		                    '콩국수',
    		                    '기스면',
    		                    '메밀국수',
    		                    '울면',
								],
					'죽 및 스프류': ['깨죽',
    		                '소고기버섯죽',
    		                '잣죽',
    		                '전복죽',
    		                '참치죽',
    		                '팥죽',
    		                '호박죽',
    		                '게살죽',
							],
					'국 및 탕류': ['갈비탕',
    		                   '곰탕',
    		                   '꼬리곰탕',
    		                   '삼계탕',
    		                   '도가니탕',
    		                   '선짓국',
    		                   '설렁탕',
    		                   '순대국',
    		                   '어묵국',
    		                   '소고기육개장',
    		                   '토란국',
    		                   '연포탕',
    		                   '탕국',
    		                   '소탕',
    		                   '어탕',
    		                   '육탕',
								],
					'찌개 및 전골류': ['동태찌개',
    		                         '감자탕',
    		                         '김치찌개',
    		                         '내장탕',
    		                         '닭볶음탕',
    		                         '된장찌개',
    		                         '순두부찌개',
    		                         '광어매운탕',
    		                         '대구매운탕',
    		                         '우럭매운탕',
    		                         '부대찌개',
    		                         '알탕',
    		                         '청국장찌개',
    		                         '추어탕',
    		                         '콩비지찌개',
    		                         '장어탕',
									],
    		        '찜류': ['민어찜',
    		                  '도미찜',
    		                  '아구찜',
    		                  '조기찜',
    		                  '홍어찜',
    		                  '전어찜',
    		                  '병어찜',
    		                  '문어숙회',
    		                  '소갈비찜',
    		                  '참꼬막',
    		                  '돼지고기 수육',
    		                  '족발',
    		                  '순대',
    		                  '한방오리백숙'
								],
    		        '구이류': ['갈치구이',
    		                '고등어구이',
    		                '양념장어구이',
    		                '돼지갈비구이',
    		                '닭꼬치',
    		                '햄버그스테이크',
    		                '훈제오리',
    		                '소불고기',
							],
					'전/ 적 및 부침류' : ['김치전',
					          '깻잎전',
					          '버섯전',
					          '부추전',
					          '고추전',
					          '호박전',
					          '배추전',
					          '미나리전',
					          '녹두빈대떡',
					          '쇠고기산적',
					          '화양적',
					          '계적',
					          '돔베기적',
					          '소라산적',
					          '오징어산적',
					          '홍어적',
					          '홍합산적',
					          '두부전',
					          '동태전',
					          '가자미전',
					          '파전',
					          '해물파전',
					          '떡갈비',
					          '동그랑땡',
					          '낙지꼬지'
							],
						'볶음류' : ['건새우볶음',
						         '두부김치',
						         '낙지볶음',
						         '돼지고기볶음',
						         '마파두부',
						         '떡볶이',
						         '라볶이',
						         '멸치풋고추볶음',
						         '잔멸치볶음',
						         '잡채',
						         '고추잡채',
						         '팔보채',
						         '오징어채볶음',
						         '주꾸미볶음'
								],
							'조림류' : ['갈치조림',
							         '고등어조림',
							         '북어조림',
							         '두부조림',
							         '연근조림',
							         '우엉조림',
							         '돼지고기메추리알장조림',
							         '소고기메추리알장조림',
							         '콩조림',
							         '땅콩조림'
								],
							'튀김류' : ['미꾸라지튀김',
							         '생선까스',
							         '쥐포튀김',
							         '채소튀김',
							         '고구마튀김',
							         '김말이튀김',
							         '닭강정',
							         '깐풍기',
							         '라조기',
							         '치킨까스',
							         '난자완스',
							         '등심돈가스',
							         '안심돈가스',
							         '치즈돈가스',
							         '새우튀김',
							         '오징어튀김',
							         '탕수육',
									],
							'나물/숙채류' : ['가지나물',
							            '고사리나물',
							            '도라지나물',
							            '무나물',
							            '미나리나물',
							            '숙주나물',
							            '시금치나물',
							            '시래기나물',
							            '취나물',
							            '콩나물'
										],
							'생채/무침류' : ['골뱅이무침',
							            '김무침',
							            '마늘쫑무침',
							            '무말랭이무침',
							            '도토리묵',
							            '양장피',
							            '탕평채',
							            '파래무침',
							            '홍어회무침',
							            '쥐치채'	
										],
							'김치류' : ['갓김치',
							         '고들빼기',
							         '깍두기',
							         '나박김치',
							         '배추김치',
							         '백김치',
							         '열무얼갈이김치',
							         '열무김치',
							         '오이소박이',
							         '총각김치',
							         '파김치',
									],
    		    			'젓갈류' : ['양념게장', '간장게장'],
    		    			'장아찌/절임류' : ['고추장아찌',
    		    			         '깻잎장아찌',
    		    			         '마늘장아찌',
    		    			         '매실장아찌',
    		    			         '무장아찌'
									],
							'음료 및 차류' : ['수정과', '식혜'],
							'곡류, 서류 제품' : ['가래떡',
							          '꿀떡',
							          '무지개떡',
							          '백설기',
							          '시루떡',
							          '약식',
							          '인절미',
							          '절편',
							          '증편',
							          '찹쌀떡',
							          '모듬찰떡',
							          '떡,기피편',
							          '떡,메밀전병',
							          '떡,수수부꾸미',
							          '떡,수수팥떡',
							          '떡,쑥떡',
							          '녹두시루떡'	
										],
							'수조어육류' : ['육회', '대구포', '북어포']							
    		    }
    		    
    		    var user_seq = <%=member_seq%>
    		    var $foods = $('#food');
    		    
    		    $("#food-like").attr('disabled',true);
	        	$("#food-dislike").attr('disabled', true);
    		    $('#food_group').change(function () {
    		        var food_group = $(this).val(), lcns = foods[food_group] || [];
    		        
    		        var html = $.map(lcns, function(lcn){
    		            return '<option value="' + lcn + '">' + lcn + '</option>'
    		        }).join('');
    		        $foods.html(html)
    		        if ($('#food option:selected').val() == null) {
    		        	$("#food-like").attr('disabled',true);
    		        	$("#food-dislike").attr('disabled', true);
    				} else {
    					$("#food-like").attr('disabled',false);
   		        	 	$("#food-dislike").attr('disabled', false);
					}
    		    });    	
    		    
    		    // 리스트 추가 및 중복제거      		    
    		    $("#food-like").click(function(){
    		    	var likeFood = $('#food option:selected').val();     		    	
    		    	console.log(likeFood);    		    	
    		    	
    		    	//console.log($('#likeFood').children().length);
    		    	var li = "<li class='list-group-item'>" + likeFood + "<button class='' style='float:right; display:none;'><i class='md md-add-shopping-cart'></i>//</button>" + "</li>";
    		    	$("#likeList").append(li);
    		    	
    		    	var map = {};
    		    	$('#likeList li').each(function(){
    		    		var value = $(this).text();
    		    		if(map[value] == null){
    		    			map[value] = true;
    		    		}else{
    		    			alert('이미 선택하신 메뉴입니다.');
    		    			$(this).remove();
    		    		}    		    			
    		    	});
    		    	
    		    	//$('#likeList').each(function(i, e){
    		    	//	$(this).append('<span class="arr"></span>');
    		    	//});  
    		    	 
        		    $(".like-menu-confirm").on('click',function(){
    	 		    	var index = $("#likeList > li > button").index($(this));
    	 		    	//$("li:eq(" + index + ")").attr("data-val", "hello");
    	 		    	console.log(index);
    	 		    });
    		    });

    		    $('#insertMenu').on('click',function(){
    		    	console.log($('#likeList > li').text());
    		    	var likeMenus = $('#likeList > li').text().split("//");
    		    	console.log(likeMenus);
    		    	
    		    	jQuery.ajaxSettings.traditional = true;
    		    	$.ajax({
    		    		url : './likeMenuOk.likeMenu',
    		    		type : 'post',
    		    		data : {
    		    			likeMenus : likeMenus,
    		    			user_seq : user_seq
    		    		},
    		    		dataType : 'json',
    		    		success : function(json){
    		    			if(json.flag == 0){
    		    				likeMenuLoad();
    		    			}else{
    		    				alert("좋아하는 메뉴 추가에 실패하였습니다.");
    		    			}
    		    		},
    		    		error : function(xhr, status, error){
    		    			alert('에러 : ' + status + '\n\n' + error);
    		    		}
    		    	});
    		    });
    		    
    		    function likeMenuLoad() {
    		    	$.ajax({
    		    		url : './likeMenuList.likeMenu',
    		    		type : 'post',
    		    		data : {
    		    			user_seq : user_seq,
    		    			menu_name : "널"
    		    		},
    		    		dataType : 'json',
    		    		success : function(json){
    		    			//alert("성공");
    		    			$("#likeMenuList > tbody").empty();
    		    			$.each(json, function (index, value) {
    		    				$('#likeMenuList > tbody').append("<tr><td>" + value.like_date +"</td><td>" + value.menu_name + "</td></tr>" );
    		    				$('#likeList').empty();
							})
    		    			
    		    		},
    		    		error : function(xhr, status, error){
    		    			alert("좋아하는 메뉴 추가에 실패하였습니다.");
    		    		}
    		    	});
				}

    		    //리스트 아래에서부터 삭제
    		    $("#food-dislike").click(function(){
    		    	$('#likeList li').eq(-1).remove();    		    	
    		    });
    		    
    		    /*
    		    $('.like-menu-confirm').click(function(){
    		    	
    		    	var likeMenu = $('#likeList').text();
    		    	
    		    	console.log(likeMenu);
    		    	$.ajax({
    		    		url : './likeMenuOk.likeMenu',
    		    		type : 'post',
    		    		data : {
    		    			likeMenu : likeMenu,
    		    			user_seq : user_seq
    		    		},
    		    		dataType : 'json',
    		    		success : function(json){
    		    			if(json.flag == 0){
    		    				//setTimeout("location.reload()", 1000);
    		    			}else{
    		    				alert("좋아하는 메뉴 추가에 실패하였습니다.");
    		    			}
    		    		},
    		    		error : function(xhr, status, error){
    		    			alert('에러 : ' + status + '\n\n' + error);
    		    		}
    		    	});
    		    });*/
    		    
    		});
    		
    		
        </script>        
    </body>
</html>