$(document).ready(function(){	
	
	var mapShow = $("#mapShow");
	var searchPlace_Form = $("#searchPlace_Form");
	var map;
	
	//현재 위치 가져오기
		var latitude; //위도
		var longitude;	//경도
		
		if(navigator.geolocation){
			navigator.geolocation.getCurrentPosition(function(position){
				// 위치정보 얻어오기
				latitude = position.coords.latitude,
				longitude = position.coords.longitude;
				
				console.log("latitude = "+latitude, "longitude = "+longitude);
				
				//현재 위치로 지도 띄우기
				map = new google.maps.Map(document.getElementById('mapShow'), {
																				center: {lat: latitude, lng: longitude},
																				zoom: 8,
																				mapTypeId: 'roadmap'
																				});
				
				//핀포인트 찍기
				var marker = new google.maps.Marker({position: {lat: latitude, lng: longitude}, map: map});
			});	
		}else{
			console.log("지오 로케이션 없음")
		}
	
	
	//장소 검색기능
	$("#searchPlaceBtn").on("click", function(e){
		
		e.preventDefault();
		
		var query = $("input[name='query']").val();
		
		var url = encodeURI(searchPlace_Form.attr("action")+query);
		console.log(url);
		
		searchPlace_Form.attr("action", url);
		searchPlace_Form.submit();
	});
		
	
	
});	
