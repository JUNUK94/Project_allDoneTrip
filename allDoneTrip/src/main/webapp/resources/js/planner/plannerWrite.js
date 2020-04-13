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

//=============================================선언부=============================================
	var title_CityInfo = $("#title_CityInfo");
	var title_Calculator = $("#title_Calculator");
	var title_ExchangeRate = $("#title_ExchangeRate");
	
	var title_hotPlace_List = $("#title_hotPlace_List");
	var title_restaurant_List = $("#title_restaurant_List");
	var title_shopping_List = $("#title_shopping_List");
	var title_weather_List = $("#title_weather_List");

	var wrapper_CityInfo_List = $("#wrapper_CityInfo_List");
	var wrapper_hotPlace_List = $("#wrapper_hotPlace_List");
	var wrapper_restaurant_List = $("#wrapper_restaurant_List");
	var wrapper_shopping_List = $("#wrapper_shopping_List");
	var wrapper_weather_List = $("#wrapper_weather_List");
	var wrapper_ExchangeRate = $("#wrapper_ExchangeRate");
	
	var selector_City_List = $("#selector_City_List");
	var hotPlace_List = $("#hotPlace_List");
	var restaurant_List = $("#restaurant_List");
	var shopping_List = $("#shopping_List");
	var weather_List = $("#weather_List");
	var calculator = $("#calculator");
	var showResult = $("#showResult");
	var calculate_Result_List = $("#calculate_Result_List");
	
	var geocoder = new google.maps.Geocoder();
	
	
//==============================================함수==============================================

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
	
				console.log(arr);
				
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
				 	text += ("<div id='weatherInfo_"+i+"' class='weather_info list-group-item' draggable='true' ondragstart='weather_drag("+i+")' value='"+str+"'>");
				 	text += (arr[i].date+" 날씨</div>");
					
				 	//새롭게 추가
				 	$("#weather_List").append(text);
				}
			});
		} else{
			$("#weather_List").empty();
		}
	}


	



//=============================================이벤트=============================================

	//도시정보 선택에 따른 이벤트
	selector_City_List.on("change", function () {
		var cityName = $("#selector_City_List option:selected").val();
		getWeather(cityName);
	});
	
	
	//계산 결과 리스트 띄우기
	showResult.on("click", function () {
		calculate_Result_List.toggle(500);
	});
	
	// ? 클릭 시 팝오버 
	$('[data-toggle="popover"]').popover();
	
	
}); //end of ajax


//날씨정보 드래그 이벤트
function weather_drag(index) {
	
	var data = document.getElementById("weatherInfo_"+index).getAttribute("value");
	console.log("값 = " + data);
	
	event.dataTransfer.setData('text', data);
}



