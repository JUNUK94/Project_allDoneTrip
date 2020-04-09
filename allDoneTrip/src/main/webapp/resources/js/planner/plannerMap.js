$(document).ready(function(){	
	
	var mapShow = $("#mapShow");
	var searchPlace_Form = $("#searchPlace_Form");
	var map;
	var service;
	var infowindow;
	
	var latitude; //위도
	var longitude;	//경도
	var markers=[];
	
	var geocoder = new google.maps.Geocoder();

	getMyPositon(); //onload시 내 위치 기준으로 지도 출력

	
	
//=================================================함수 영역===========================================================
	
	//현재 위치 가져와서 지도 생성
	function getMyPositon() {
		if(navigator.geolocation){
			navigator.geolocation.getCurrentPosition(function(position){
				// 위치정보 얻어오기
				latitude = position.coords.latitude,
				longitude = position.coords.longitude;
				
				initialize(latitude, longitude);
			});	
		}else{
			console.log("지오 로케이션 없음")
		}
	}

	
	//지도 생성()함수
	function initialize(latitude, longitude) {
		
		var location = new google.maps.LatLng(latitude, longitude);

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


		// 마커 띄우기
		var marker = new google.maps.Marker({
			  position: location,
			  animation:google.maps.Animation.BOUNCE,
			  title:'Click to zoom'
			  });
		
		setMapOnAll(map);
		marker.setMap(map);
		
		
		// 마커 클릭 시 zoom 이벤트
		google.maps.event.addListener(marker,'dblclick',function() {
			console.log("zoom");
			  map.setZoom(15);
			  map.setCenter(marker.getPosition());
			  });
	
		
		// 지도 클릭 시 마커 추가 + 위도경도 띄워주기 이벤트	
		google.maps.event.addListener(map, 'click', function(event) {
			placeMarker(event.latLng);
		 });
		
		
         // submit 버튼 클릭 이벤트 실행
         document.getElementById('searchPlaceBtn').addEventListener('click', function() {
             geocodeAddress(geocoder, map);
         });
	}


	
	//마커 추가 함수
	function placeMarker(place) {
		var location = new google.maps.LatLng(place.lat(), place.lng());
		var addMarker = new google.maps.Marker({
			map: map,
		    position: location
		});
		  
		var infowindow = new google.maps.InfoWindow({
			content: '<br>위도: ' + place.lat() + '<br>경도: ' + place.lng()
		});
		  
		  //array에 마커 추가
		  markers.push(addMarker);

		  //정보창 오픈
		  infowindow.open(map, addMarker);
		  
		  google.maps.event.addListener(addMarker,'click',function() {
			  addMarker.setMap(null);
			  infowindow.close(map, addMarker);
		  });
	}


	// array에 저장된 모든 마커 찍기
	function setMapOnAll(map) {
	  for (var i = 0; i < markers.length; i++) {
	    markers[i].setMap(map);
	  }
	}
	
	
	
	 //입력한 주소로 맵의 좌표를 바꾸기
    function geocodeAddress(geocoder, resultMap) {
        console.log('geocodeAddress 함수 실행');

        // 주소 설정
        var address = $("#query").val();
        console.log(address);
        
        geocoder.geocode({'address': address}, function(result, status) {
            console.log(result);
            console.log(status);

            if (status === 'OK') {
                // 맵의 중심 좌표를 설정한다.
                resultMap.setCenter(result[0].geometry.location);
                // 맵의 확대 정도를 설정한다.
                resultMap.setZoom(18);
                // 맵 마커
                var marker = new google.maps.Marker({
                    map: resultMap,
                    position: result[0].geometry.location
                });

                // 위도
                console.log('위도(latitude) : ' + marker.position.lat());
                // 경도
                console.log('경도(longitude) : ' + marker.position.lng());
            } else {
                alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
            }
        });
    }
	
    
    
    //장소 검색
    function placeSearch() {
        console.log('placeSearch 함수 실행');

        $.ajax({
			url: 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=Museum&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key=AIzaSyBS2oAuYkl-89AZWRlo4UkUFVgWHLcN2qM',
			type: 'post',
			dataType: 'JSON',
			data: {plan_No:plan_No, nick_Name:nick_Name, pr_Content:pr_Content, regdate:regdate, email:email},
			async: false,
			success: function(map){
				alert("댓글이 등록되었습니다.");
				window.location.reload();
			},
			error:function(){
				alert("댓글 등록에 실패하였습니다.");
			}
        });
        
        
    }
	
	
	
	
//=================================================이벤트 영역===========================================================
	
	// 내 위치보기 클릭 시 이벤트
	$("#showMyPositon").on("click", function(e) {
		e.preventDefault();
		
		navigator.geolocation.getCurrentPosition(function(position){
			// 내 위치정보 얻어오기
			latitude = position.coords.latitude,
			longitude = position.coords.longitude;
			center = new google.maps.LatLng(latitude, longitude);
			// 내 위치로 이동
			map.panTo(center);
		});
	});
	

	
	// 장소 검색 이벤트
	$("#searchPlaceBtn").on("click", function(e) {

		e.preventDefault();

		var query = $("input[name='query']").val();
		
		var request = {
		          query: query,
		         // radius: '500',
		          fields: ['name', 'geometry'],
		        };
		
		service = new google.maps.places.PlacesService(map);

        service.findPlaceFromQuery(request, function(results, status) {
          if (status === google.maps.places.PlacesServiceStatus.OK) {
            for (var i = 0; i < results.length; i++) {
            	placeMarker(results[i]);
            }
    		var location = new google.maps.LatLng(results[0].lat(), results[0].lng());
            map.setCenter(location);
          }
        });
		
		
	});
	
	

	
	
});
