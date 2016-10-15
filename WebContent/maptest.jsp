<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&key=AIzaSyAgtZyE1FpTlWMOhg9VaIcqdAo-Qxtlpnk"></script>
<script type="text/javascript">
			var map;
			var latlng = '';
			function initialize(latlng) {
				var myLatlng = new google.maps.LatLng(37.49794199999999, 127.027621);
				var myOptions = {
					zoom : 17,
					center : myLatlng,
					mapTypeId : google.maps.MapTypeId.ROADMAP,
					
				}
				var map = new google.maps.Map(document.getElementById("map_canvas"),
						myOptions);
				
				var marker = new google.maps.Marker({
					position : myLatlng,
					map : map
					
				});
				//클릭했을 때 이벤트
				//google.maps.event.addListener(map, 'click', function(event) {
					//placeMarker(event.latLng);
					/* infowindow.setContent("여기여기 latLng: " + event.latLng); */ // 인포윈도우 안에 클릭한 곳위 좌표값을 넣는다.
					/* infowindow.setContent("Here!");
					infowindow.setPosition(event.latLng); // 인포윈도우의 위치를 클릭한 곳으로 변경한다.
					latlng = '';
					latlng += event.latLng;
					
					document.getElementById('latlng').value = '';
					document.getElementById("latlng").value += latlng;
					
				}); */
				//클릭 했을때 이벤트 끝
				//인포윈도우의 생성
				/* var infowindow = new google.maps.InfoWindow(
						{
							content : '<p>여기</p>',
							size : new google.maps.Size(50, 50),
							position : myLatlng
						});
				infowindow.open(map);
				
				var marker = new google.maps.Marker({
					position : myLatlng,
					map : map
				}); */
			} // function initialize() 함수 끝
			/* $().ready(function() {
				var geocoder = new google.maps.Geocoder();
				geocoder.geocode({'address':'1373 grandview ave.columbus hio 43212'}, function(results, status) {
					initialize(results[0].geometry.location);
				});
			}); */
		
			// 마커 생성 합수
			/* function placeMarker(location) {
				var clickedLocation = new google.maps.LatLng(location);
				var marker = new google.maps.Marker({
					position : location,
					map : map
				});
				map.setCenter(location); */
			//}
		</script>
</head>
<body onload="initialize();">
<div id="map_canvas" style="width: 904px; height: 300px;"></div><br/>

</body>
</html>