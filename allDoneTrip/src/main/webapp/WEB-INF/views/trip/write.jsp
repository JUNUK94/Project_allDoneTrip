<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
	<title>플래너 작성</title>
	<%	session.setAttribute("email", "silverdue@gmail.com");
		session.setAttribute("nick_Name", "창창");
		//session.invalidate();
	%>
	
	<style>
	
		#document_area {
			height: 100vh;
		}
		
		#toolBar_area {
			width: 15%;
		}

		#editor_area {
			position:relative;
			width: 65%;
			overflow:auto;
		}
		
		#map_area_resize {
			width: 1%;
			cursor: pointer;
		}
		
		#map_area  {
			position:relative; 
			
			overflow:auto;
		}

	
		#mapShow {
			width: 100%;
			height: 250px;
			/*padding-top: 100%;*/
			border: solid 1px gray;
		}

		div.hotplace_info:hover,
		div.restaurant_info:hover,
		div.shopping_info:hover,
		div.weather_info:hover,
		div.map_Search_Result:hover{
			cursor: grab;
			background-color: darkturquoise;
		}

		#title_CityInfo:hover,
		#title_Calculator:hover,
		#title_ExchangeRate:hover,
		#title_hotPlace_List:hover, 
		#title_restaurant_List:hover, 
		#title_shopping_List:hover, 
		#title_weather_List:hover,
		.remove_Cal_Result:hover,
		.remove_Map_Search_Result:hover{
			cursor: pointer;
			color: darkturquoise;
		}

	</style>
	
<!--=====================================jquery=========================================-->

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

<!--================================Ajax Cross Origin===================================-->

	<script src="${contextPath}/resources/js/ajaxCrossOrigin/jquery.ajax-cross-origin.min.js"></script>

<!--===================================bootstrap========================================-->

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>

<!--====================================================================================-->
</head>
<body>
		
			<!-- 지도 영역 -->
			<div id="map_area" class="d-flex flex-column p-4 bg-light order-4">
				
				<div id="mapContent">
					<div id="mapShow">
						<!-- 지도 출력 부분 -->
					</div>
					<div class="d-flex justify-content-end">
						<a id="showMyPositon" class="text-primary small" href="#">내 위치로 이동</a>
					</div>
					<br>
					<div class="input-group mb-3">
						<input type="text" id="input_query" class="form-control SearchBox">
						<div class="input-group-append">
							<button id="searchPlaceBtn" class="input-group-text">검색</button>
						</div>
					</div>
					
					</div>
				</div>
		
	
</body>
<!--=================================googleMap API======================================-->

<script src="https://maps.google.com/maps/api/js?key=AIzaSyBS2oAuYkl-89AZWRlo4UkUFVgWHLcN2qM&libraries=places"></script>
<!-- <script src="${contextPath}/resources/js/planner/plannerMap.js"></script> -->
<script>
$(document).ready(function(){
//=================================================선언부==========================================================	

	var mapShow = $("#mapShow");
	var searchPlace_Form = $("#searchPlace_Form");
	var Map_Search_List = $("#Map_Search_List");
	var show_Map_Search_Result = $("#show_Map_Search_Result");
	var input_query = $("#input_query");
	var searchPlaceBtn = $("#searchPlaceBtn");
	
	var map;
	var service;
	var infowindow;
	
	var latitude; //위도
	var longitude;	//경도
	var marker_Arr=[];
	
	var mapStatus = true;
	var index = 0;
	
	var key = "AIzaSyBS2oAuYkl-89AZWRlo4UkUFVgWHLcN2qM"; // 원래 키

	
	//onload시 내 위치 기준으로 지도 출력
	getMyPositon(); 

	
//=================================================함수부===========================================================
	
	//현재 위치 가져와서 지도 생성
	function getMyPositon() {
		if(navigator.geolocation){
			navigator.geolocation.getCurrentPosition(function(position){
				// 위치정보 얻어오기
				latitude = position.coords.latitude,
				longitude = position.coords.longitude;
				
				var location = new google.maps.LatLng(latitude, longitude);
				//지도 생성 함수
				initialize(location);
			});	
		}else{
			console.log("지오 로케이션 없음")
		}
	}

	
	//지도 생성 함수
	function initialize(location) {
		//-------------------------------------------지도 초기화-----------------------------------------
		//지도 초기화 및 생성
		map = new google.maps.Map(document.getElementById('mapShow'), {
				center: location,	//중심좌표
				zoom: 8,			//줌하는 단계
				mapTypeId: 'roadmap',	//지도 스타일(기본)
				gestureHandling:'greedy',	//마우스 휠로 줌 하는 기능
				zoomControl:true,
				zoomControlOptions: {
				      style:google.maps.ZoomControlStyle.small
				    }
				});

		// 현재 위치 마커 초기화
		var marker_myPosition = new google.maps.Marker({
			  position: location,
			  animation:google.maps.Animation.BOUNCE,
			  title:'Click to zoom'
		});
		
		// 검색어 자동완성 객체 초기화
		var autocomplete = new google.maps.places.Autocomplete(document.getElementById('input_query'), {
			types: ['geocode']
		});
		
		
		//-------------------------------------------지도 함수 선언-----------------------------------------
		
		//검색어 자동완성 함수
		function fillInAddress() {
			var place = autocomplete.getPlace();
			
			map.setCenter(place.geometry.location);
			searchMarker = new google.maps.Marker({
				map: map,
				position: place.geometry.location
			});
		}
		
		
		//--------------------------------------------지도 함수 실행-----------------------------------------
		
		// 현재 위치 마커 띄우기
		marker_myPosition.setMap(map);
		
		//배열에 저장된 모든 마커 띄우기
		marker_Arr_SetOn_Map(map);
		
		
		//--------------------------------------------지도 이벤트 선언-----------------------------------------
		
		//생성된 마커 더블클릭 시 zoom 이벤트
		map.addListener(marker_Arr,'dblclick',function() {
			console.log("zoom");
			map.setZoom(10);
			map.setCenter(marker.getPosition());
		});
	
		// 지도 클릭 시 마커 추가 + 위도경도 띄워주기 이벤트	
		map.addListener('click', function(event) {
			
			
			placeMarker(event.latLng, map);
		 });
		
		// 검색어 자동완성 이벤트
		autocomplete.addListener('place_changed', fillInAddress);
	} // end of init()
	
});
</script>
<!--====================================================================================-->

</html>