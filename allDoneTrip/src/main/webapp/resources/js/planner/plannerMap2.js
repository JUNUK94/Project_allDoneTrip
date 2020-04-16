//====================================================선언부===========================================================	
$(document).ready(function(){	

	var mapShow = document.getElementById("mapShow");
	var searchPlace_Form = document.getElementById("searchPlace_Form");
	var Map_Search_List = document.getElementById("Map_Search_List");
	var show_Map_Search_Result = document.getElementById("show_Map_Search_Result");
	var input_query = document.getElementById("input_query");
	var searchPlaceBtn = document.getElementById("searchPlaceBtn");
	
	var map;				// 지도
	var service;		
	var infowindow;			// 정보창
	
	var location;			// 위도+경도 객체
	var latitude; 			// 위도
	var longitude;			// 경도
	var marker_myPosition;	// 내 위치 마커
	var marker_Arr = [];	// 마커 배열
	var autocomplete;		// 검색어 자동완성
	
	var mapStatus = true;
	var index = 0;
	
	var key = "AIzaSyBS2oAuYkl-89AZWRlo4UkUFVgWHLcN2qM"; // 구글맵api 키

	
	// 지도 생성 함수 실행
	getMyPositon(); 


//====================================================함수부===========================================================	
	
	//현재 위치 가져와서 지도 생성
	function getMyPositon() {
		if(navigator.geolocation){
			navigator.geolocation.getCurrentPosition(function(position){
				// 위치정보 얻어오기
				latitude = position.coords.latitude,
				longitude = position.coords.longitude;
				
				location = new google.maps.LatLng(latitude, longitude);
				//지도 생성 함수
				initialize(location);
			});	
		}else{
			console.log("지오 로케이션 없음")
		}
	}

	
	// 지도 생성 함수
	function initialize(location) {
		//--------------------------------------------초기화-----------------------------------------
		
		//지도 생성
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
		marker_myPosition = new google.maps.Marker({
			  position: location,
			  animation:google.maps.Animation.BOUNCE,
			  title:'Click to zoom'
		});
		
		// 검색어 자동완성 객체 초기화
		autocomplete = new google.maps.places.Autocomplete(document.getElementById('input_query'), {
			types: ['geocode']
		});
		
		
		//--------------------------------------------함수 실행-----------------------------------------
		
		// 현재 위치 마커 띄우기
		marker_myPosition.setMap(map);
		
		//배열에 저장된 모든 마커 띄우기
		marker_Arr_SetOn_Map(map);
		
		
		//--------------------------------------------이벤트 선언-----------------------------------------
		
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

	
	//--------------------------------------------함수 선언-----------------------------------------	
	
	// 마커 추가 함수
	function placeMarker(coord) {
		//마커 추가
		var addMarker = new google.maps.Marker({
			map: map,
		    position: coord,
		    animation: google.maps.Animation.DROP,
		    draggable: true
		});
		//center이동
		map.setCenter(coord);
		//array에 마커 추가
		marker_Arr.push(addMarker);
		  
//		var infowindow = new google.maps.InfoWindow({
//			content: '<br>위도: ' + coord.lat() + '<br>경도: ' + coord.lng()
//		});
//		  //정보창 오픈
//		  infowindow.open(map, addMarker);
//		  
//		  google.maps.event.addListener(addMarker,'click',function() {
//			  addMarker.setMap(null);
//			  infowindow.close(map, addMarker);
//		  });
	}
	
	
	// array에 저장된 모든 마커 찍는 함수
	function marker_Arr_SetOn_Map(map) {
	  for (var i = 0; i < marker_Arr.length; i++) {
	    marker_Arr[i].setMap(map);
	  }
	}
	
	
	// 검색 자동완성 함수
	function fillInAddress() {
		var place = autocomplete.getPlace();
		
		map.setCenter(place.geometry.location);
		searchMarker = new google.maps.Marker({
			map: map,
			position: place.geometry.location
		});
	}
	
	
	// 장소 place_id 검색
    function placeId_Search(query) {
        console.log('placeId_Search 함수 실행');
        
        var url = "";
        url += "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?";
        url += "key=" + key;
        url += "&input=" + query;
        url += "&inputtype=textquery&fields=geometry,place_id";
        
        $.ajax({
            url: url,
            crossOrigin : true,
            type: 'post',
            dataType: 'JSON',
            success: function(data){
            	var result = JSON.parse(data);

            	if(result.status != 'ZERO_RESULTS'){
	            	var place_id = result.candidates[0].place_id;
             		var coord = result.candidates[0].geometry.location;
             		
               		// 마커 추가 + 마커 배열에 추가
                	placeMarker(coord);
                	
                	// 맵 센터 이동
                	map.setCenter(coord);
                	
             		//장소 detail검색 함수 실행
             		placeDetail_Search(place_id);
             		
            	}else{
            		alert('검색 결과가 없습니다.');
            		searchPlaceBtn.innerHTML("검색");
            		return false;
            	}
            },
            error: function(xhr){
            	console.log("실패", xhr); 
            }
        });
    }
	
    
    // 장소 detail검색 함수
    function placeDetail_Search(place_id) {
        console.log('placeDetail_Search 함수 실행');
        
        var url = "https://maps.googleapis.com/maps/api/place/details/json?";
        url += "key=" + key;
        url += "&place_id=" + place_id;
        url += "&fields=photos,formatted_address,name,rating,international_phone_number,opening_hours,website,geometry&language=ko";
        
        $.ajax({
            url: url,
            crossOrigin : true,	//크로스오리진 도메인 문제 해결
            type: 'post',
            dataType: 'json',
            success: function(data){
            	// String -> JSON으로 변환
            	var place_Info = JSON.parse(data);
            	// 장소 정보 얻어오기 함수 실행
            	getPlaceInfo(place_Info);
            	searchPlaceBtn.innerHTML("검색");
            },
            error: function(xhr){
            	console.log("실패",xhr);
            	searchPlaceBtn.innerHTML("검색");
            }
        });
    }
	
	
	
	 // 장소 정보 얻어오기 함수
    function getPlaceInfo(place_Info){
    	console.log("getPlaceInfo 함수 실행");
    	console.log(place_Info);
    	
    	var name;		//이름
		var address;	//주소
		var location;	//위도+경도
		var lat;		//위도
		var lng;		//경도
		var phone;		//전화번호
		var photo;		//이미지
		var website;	//웹사이트
    	var openHour = [];	//영업시간
    	
    	var str="";
    	
    	if(place_Info.result.name){
   			name = place_Info.result.name;								//이름
   	   		str += ("<" + name + ">" + "\n");
   		}
   		if(place_Info.result.formatted_address){
   			address = place_Info.result.formatted_address;				//주소
		 	str += ("주소 : " + address + "\n");
   		}
   		if(place_Info.result.geometry.location){
   			location = place_Info.result.geometry.location				//위도+경도
   			lat = place_Info.result.geometry.location.lat;				//위도
   			lng = place_Info.result.geometry.location.lng;				//경도
   		}
   		if(place_Info.result.international_phone_number){
   			phone = place_Info.result.international_phone_number;		//전화번호
	   	   	str += ("전화번호 : " + phone + "\n");
   		}
   		if(place_Info.result.photos){
   			photo = place_Info.result.photos[0].html_attributions[0];	//이미지
   		}
   		if(place_Info.result.website){									//웹사이트
   			website = place_Info.result.website;
   			str += ("웹사이트 : " + website + "\n");
   		}
   		if(place_Info.result.opening_hours){							//영업시간
   			var length = place_Info.result.opening_hours.weekday_text.length;
   			str += ("[영업시간]" + "\n");

   			for(var i=0; i < length; i++){
   			 	str += (place_Info.result.opening_hours.weekday_text[i] + "\n");
   			}
   		}
    	
    	var text = "";
		text += ("<div class='row' id='map_Search_Result_Div"+index+"'>");
			text += "<div class='col-md-10 map_Search_Result'>";
				text += ("<span id='map_Search_Result"+index+"' draggable='true' ondragstart='map_Search_Result_drag("+index+")' value='"+str+"'>");
					text += name;
				text += "</span>";
			text += "</div>";
			text += ("<div class='col-md-2 remove_Map_Search_Result' onclick='remove_Map_Search_Result("+index+")'>x</div>");
		text += "</div>";
    	
		//인덱스에 1 추가
	 	index = parseInt(index)+1;
	 	
	 	//리스트 출력 토글버튼 보여주기
		show_Map_Search_Result.css("display","");
		
	 	//화면에 출력
    	Map_Search_List.append(text);
    }
	
	
	
	//검색정보 드래그 함수
	function map_Search_Result_drag(index) {
		var data = document.getElementById("map_Search_Result"+index).getAttribute("value");
		event.dataTransfer.setData('text', data);
	}

	
	//검색정보 리스트 지우기 함수
	function remove_Map_Search_Result(index){
		var x_btn = document.getElementById("map_Search_Result_Div"+index);
		var Map_Search_List = document.getElementById('Map_Search_List');
		Map_Search_List.removeChild(x_btn);
		
		var cnt = Map_Search_List.childElementCount;

		if(cnt == 0){
			show_Map_Search_Result.style.display = 'none';
		}
	}
	
	
	

//=================================================jQuery 영역===========================================================
	
	
	
	// 지도 생성 함수 실행
	//initialize(); 
	
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
	
	
	
	// 장소 검색 버튼 클릭 이벤트
	searchPlaceBtn.on("click", function(e) {
		e.preventDefault();
		var query = input_query.val();
		
		searchPlaceBtn.html("<span class='spinner-border spinner-border-sm'></span>");
		//placeId 얻기 함수 실행
		placeId_Search(query);
	});

	
	// 장소 검색창 엔터 이벤트
	input_query.on("keydown", function(key) {
		//키가 13이면 실행 (엔터는 13)
		if(key.keyCode == 13){
			var query = input_query.val();

			searchPlaceBtn.html("<span class='spinner-border spinner-border-sm'></span>");
			//placeId 얻기 함수 실행
			placeId_Search(query);
		}
	});

	
	//맵 화면 토글
	$("#switch1").on("click", function(e) {
		
		$("#mapContent").toggle("fast");
		
		if(mapStatus){
			$("#map_area").css("width","5%");
			$("#editor_area").css("width","80%");
			mapStatus = false;
		}else{
			$("#map_area").css("width","19%");
			$("#editor_area").css("width","65%");
			mapStatus = true;
		}
		
	});
	
}); //end of jQuery










