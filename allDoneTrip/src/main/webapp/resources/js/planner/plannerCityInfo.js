var key = "AIzaSyBS2oAuYkl-89AZWRlo4UkUFVgWHLcN2qM"; // 구글맵api 키

var date = new Date;
var nowYear = date.getFullYear();
var nowMonth = date.getMonth()+1;
var nowDate = date.getDate();

var nextDate = new Date(date.valueOf() + (24*60*60*1000));
var tomorowYear = nextDate.getFullYear();
var tomorowMonth = nextDate.getMonth()+1;
var tomorowDate = nextDate.getDate();

if(parseInt(nowMonth) < 10){
	nowMonth = "0" + nowMonth;
}
if(parseInt(nowMonth) < 10){
	nowDate = "0" + nowDate;
}
if(parseInt(tomorowMonth) < 10){
	tomorowMonth = "0" + tomorowMonth;
}
if(parseInt(tomorowDate) < 10){
	tomorowDate = "0" + tomorowDate;
}

var today = nowYear+"-"+nowMonth+"-"+nowDate;
var tomorrow = tomorowYear+"-"+tomorowMonth+"-"+tomorowDate;



$(document).ready(function () {
	
	var title_CityInfo = $("#title_CityInfo");
	var title_Calculator = $("#title_Calculator");
	var title_ExchangeRate = $("#title_ExchangeRate");
	
	var title_hotPlace_List = $("#title_hotPlace_List");
	var title_restaurant_List = $("#title_restaurant_List");
	var title_shopping_List = $("#title_shopping_List");
	var title_weather_List = $("#title_weather_List");

	var selector_City_List = $("#selector_City_List");
	var hotPlace_List = $("#hotPlace_List");
	var restaurant_List = $("#restaurant_List");
	var shopping_List = $("#shopping_List");
	var weather_List = $("#weather_List");
	var calculator = $("#calculator");
	var showResult = $("#showResult");
	var calculate_Result_List = $("#calculate_Result_List");
	
	
	var hotplaceList = {
			"Seoul" : [],
			"Paris" : ["루브르 박물관","개선문","에펠탑","노트르담대성당","샤크레쾨르대성당","몽마르뜨","샹젤리제","앵발리드","오르세미술관"],
			"Nice" : [],
			"Lyon" : [],
			"Shanghai" : [],
			"Hongkong" : [],
			"Beijing" : [],
			"Bangkok" : [],
			"Danang" : [],
			"Hanoi" : [],
			"Hawaii" : []
	};
	
	var restaurantList = {
			"Seoul" : [],
			"Paris" : ["레옹 드 브뤼셀","라스 뒤 팔라펠","Le Procope"],
			"Nice" : [],
			"Lyon" : [],
			"Shanghai" : [],
			"Hongkong" : [],
			"Beijing" : [],
			"Bangkok" : [],
			"Danang" : [],
			"Hanoi" : [],
			"Hawaii" : []
	};

	var shoppingList = {
			"Seoul" : [],
			"Paris" : ["생투앙벼룩시장","몽쥬약국","르봉마르셰","Hermès"],
			"Nice" : [],
			"Lyon" : [],
			"Shanghai" : [],
			"Hongkong" : [],
			"Beijing" : [],
			"Bangkok" : [],
			"Danang" : [],
			"Hanoi" : [],
			"Hawaii" : []
		};
	
	
//==============================================함수==============================================

	//장소 place_id 검색 -> append_CityInfo 함수 실행
    function placeId_Search(cityName) {
        console.log('placeId_Search 함수 실행');

        var hotPlace = hotplaceList[cityName];
		var restaurant = restaurantList[cityName];
		var shopping = shoppingList[cityName];
		
        if(cityName != ''){
        	append_CityInfo(hotPlace, "hotPlace");
        	append_CityInfo(restaurant, "restaurant");
        	append_CityInfo(shopping, "shopping");
        }else{
    		//내부에 있는 기존 요소 비우기
    	 	$("#hotPlace_List").empty();
    	 	$("#restaurant_List").empty();
    	 	$("#shopping_List").empty();
        }
    }
	
    
	//장소 place_id 찾아 리스트 뿌리는 함수
	function append_CityInfo(list, listName){
		
		//내부에 있는 기존 요소 비우기
	 	$("#hotPlace_List").empty();
	 	$("#restaurant_List").empty();
	 	$("#shopping_List").empty();
		
		for(var i=0; i<list.length; i++){
    		var index=0;
    		
	        var url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?";
	        url += "key=" + key;
	        url += "&input=" + list[i];
	        url += "&inputtype=textquery&fields=place_id";
	        
	        $.ajax({
	            url: url,
	            crossOrigin : true,
	            type: 'post',
	            dataType: 'json',
	            async: false,
	            success: function(data){
	            	var result = JSON.parse(data);
	            	//console.log(result);
	            	if(result.status != 'ZERO_RESULTS'){
	            		var place_id = result.candidates[0].place_id;
	            		//console.log("name = "+listName);
		            	
		            	var text = "";
	    			 	text += ("<div id='"+place_id+"' class='"+listName+"_info list-group-item small' draggable='true' ondragstart='cityInfo_drag()'>");
	    			 	text += (list[index]+"</div>");

	    			 	$("#"+listName+"_List").append(text);
	    			 	index++;
	            	}
	            },
	            error: function(xhr){
	            	console.log("실패", xhr); 
	            }
	        });
		}
	}
    
    
	
	//선택 도시의 날씨 얻어오기
	function getWeather(cityName){
		
		if(cityName != ''){
			$.getJSON("http://api.openweathermap.org/data/2.5/forecast?q="+cityName+"&appid=5c818fece92856e67c360f488be116cc&lang=kr&units=metric",function(forecast){	
				
				var arr = [];
				var data;
				var index;
				var city = $("#selector_City_List option:selected").html();
				
				
				//내부에 있는 기존 요소 비우기
			 	$("#weather_List").empty();
				
				data = {
						"cityName":forecast.city.name,
						"description":forecast.list[0].weather[0].description,
						"temp":(forecast.list[0].main.temp+"℃"),
						"temp_min":(forecast.list[0].main.temp_min+"℃"),
						"temp_max":(forecast.list[0].main.temp_max+"℃"),
						"feels_like":(forecast.list[0].main.feels_like+"℃"),
						"humidity":(forecast.list[0].main.humidity+"%"),
						"wind":(forecast.list[0].wind.speed+"m/s"),
						"date":forecast.list[0].dt_txt.substr(0,10),
						"icon":forecast.list[0].weather[0].icon
						};
				
				arr.push(data);
				
				//다음 날의 정보가 담겨있는 첫번째 index 구하기
				for(var i=0; i<forecast.cnt; i++){
					var days = forecast.list[i].dt_txt.substr(0,10);
					
					if(days == tomorrow){
						index = i;
					}
				}
				
				//반복해서 그 다음날의 정보를 가져오기
				for(var i=index; i<forecast.cnt; i+=8){
					data = {
							"cityName":forecast.city.name,
							"description":forecast.list[i].weather[0].description,
							"temp":(forecast.list[i].main.temp+"℃"),
							"temp_min":(forecast.list[i].main.temp_min+"℃"),
							"temp_max":(forecast.list[i].main.temp_max+"℃"),
							"feels_like":(forecast.list[i].main.feels_like+"℃"),
							"humidity":(forecast.list[i].main.humidity+"%"),
							"wind":(forecast.list[i].wind.speed+"m/s"),
							"date":forecast.list[i].dt_txt.substr(0,10),
							"icon":forecast.list[i].weather[0].icon
							};
					arr.push(data);
				}
	
				//console.log(arr);
				
				//날씨 정보 div 추가
				for(var i=0; i<arr.length; i++){
				 	var str = "";
				 	str += ("<" + city + "의 날씨>" + "\n");
				 	str += ("날자 : " + arr[i].date + "\n");
				 	str += ("날씨 : " + arr[i].description + "\n");
				 	str += ("온도 : " + arr[i].temp + "\n");
				 	str += ("최저온도 : " + arr[i].temp_min + "\n");
				 	str += ("최고온도 : " + arr[i].temp_max + "\n");
				 	str += ("체감온도 : " + arr[i].feels_like + "\n");
				 	str += ("습도 : " + arr[i].humidity + "\n");
				 	str += ("풍속 : " + arr[i].wind + "\n");
					
				 	var text = "";
				 	text += ("<div id='"+str+"' class='weather_info list-group-item small' draggable='true' ondragstart='weather_drag()'>");
				 	text += (arr[i].date+" 날씨</div>");
					
				 	//새롭게 추가
				 	$("#weather_List").append(text);
				}
			});
		} else{
			$("#weather_List").empty();
		}
	}

	
	
//=================================================이벤트 영역===========================================================		
	//도시정보 선택에 따른 이벤트
	selector_City_List.on("change", function () {
		var cityName = $("#selector_City_List option:selected").val();
		console.log("cityName = "+cityName);
		getWeather(cityName);
		placeId_Search(cityName);
	});
	
}); //end of ajax





//장소 detail검색 함수
function placeDetail(place_id) {
    console.log('placeDetail 함수 실행');
    
    var arr = [];
    var url = "https://maps.googleapis.com/maps/api/place/details/json?";
    url += "key=" + key;
    url += "&place_id=" + place_id;
    url += "&fields=photos,formatted_address,name,rating,international_phone_number,opening_hours,website,geometry&language=ko";
    $.ajax({
        url: url,
        crossOrigin : true,	//크로스오리진 도메인 문제 해결
        type: 'post',
        dataType: 'json',
        async: true,
        success: function(data){
        	// String -> JSON으로 변환
        	var place_Info = JSON.parse(data);
        	result = getPlaceInfo(place_Info);
        },
        error: function(xhr){
        	console.log("실패",xhr);
        }
    });
    console.log("result="+result);
    event.dataTransfer.setData('text', result);
}


// 장소 정보 정리하기 함수
function getPlaceInfo(place_Info){
	console.log("getPlaceInfo 함수 실행");
	//console.log(place_Info);
	
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
	
		console.log(str);
		return str;
}










//도시정보 드래그 이벤트
function cityInfo_drag() {
	var place_id = event.target.getAttribute("id");
	console.log(place_id);
	placeDetail(place_id);
	
}



//날씨정보 드래그 이벤트
function weather_drag(index) {
	var data = event.target.getAttribute("id");
	console.log("값 = " + data);
	event.dataTransfer.setData('text', data);
}

