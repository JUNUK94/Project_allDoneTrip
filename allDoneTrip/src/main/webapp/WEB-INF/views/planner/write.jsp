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
			width: 19%;
			overflow:auto;
		}

	
		#mapShow {
			width: 100%;
			height: 250px;
			/*padding-top: 100%;*/
			border: solid 1px gray;
		}

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
	<script type="text/javascript">
		var startpos = 0;
		var diffpos = 0;
		var range = 50;
		var isEnable = false;
		
		function on_mouse_down(e) {
			startpos = event.clientX + diffpos;
			isEnable = true;
			return false;
		}
		
		function on_mouse_up(e) {
			isEnable = false;
			return false;
		}
		
		function on_mouse_move(e) {
			if (isEnable) {
				pos = event.clientX;
		  		diffpos = startpos-pos;
		
		  		var width = window.innerWidth/2;
		
				if (diffpos > -(width-range) && diffpos < (width-range)) {
		   			document.getElementById("editor_area").style.width = width - diffpos + "%";
		   			document.getElementById("map_area").style.width = width + diffpos + "%"; 
		  		}
			 }
		}
		
		function mouseInit(e){
			document.getElementById("map_area_resize").onmousedown = on_mouse_down;
			document.onmouseup = on_mouse_up;
			document.onmousemove = on_mouse_move;
		}
		
	</script>




	
<!--=====================================jquery=========================================-->

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

<!--================================Ajax Cross Origin===================================-->

	<script src="${contextPath}/resources/js/ajaxCrossOrigin/jquery.ajax-cross-origin.min.js"></script>

<!--====================================CKeditor========================================-->

	<script src="${contextPath}/resources/CKEditor/ckeditor/ckeditor.js"></script>

<!--===================================bootstrap========================================-->

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>

<!--====================================================================================-->
</head>
<body onload="mouseInit()">
		<!-- 상단 플래너 정보 입력 영역 -->
		<div id="title_area" class="d-flex flex-row flex-wrap justify-content-start align-items-center">
			<div class="input-group p-3" style="width:25%">
				<div class="input-group-prepend">
					<label class="input-group-text">제목</label>
				</div>
				<input type="text" class="form-control">
			</div>
	 		<div class="input-group p-3" style="width:15%">
				<div class="input-group-prepend">
					<label class="input-group-text">대표 여행지</label>
				</div>
				<select class="form-control" id="mainCity">
					<option selected></option>
					<option value="1">파리</option>
					<option value="2">니스</option>
					<option value="3">리옹</option>
					<option value="4">상해</option>
					<option value="5">홍콩</option>
					<option value="6">방콕</option>
					<option value="7">다낭</option>
					<option value="8">하노이</option>
					<option value="9">치앙마이</option>
					<option value="10">베이징</option>
				</select>
			</div>
			<div class="input-group p-3" style="width:20%">
				<div class="input-group-prepend">
					<label class="input-group-text">여행시작</label>
				</div>
				<input type="date" class="form-control">
			</div>
			<div class="input-group p-3" style="width:20%">	
				<input type="date" class="form-control">
				<div class="input-group-append">
					<label class="input-group-text">여행종료</label>
				</div>
			</div>
			<div class="d-flex justify-content-start ml-auto p-3" style="width:20%">
				<button type="submit" class="btn btn-outline-secondary" style="font-weight: bold">저장</button>
				<button type="submit" class="btn btn-outline-secondary" style="font-weight: bold">등록</button>
			</div>
		</div> <!-- end of 상단 플래너 정보 입력바 -->
	 
	 	
	 	<!-- 문서작성 영역 전체 -->
	 	<div id="document_area" class="d-flex flex-row justify-content-start align-items-stretch">
	 		<!-- 툴바 영역 -->
			<div id="toolBar_area" class="d-flex flex-column p-4 bg-light flex-shrink-0 order-1">
				<!-- 도시정보 -->
				<div id="title_CityInfo" data-toggle="collapse" data-target="#wrapper_CityInfo_List">
					<h5>도시정보</h5>
					<hr>
				</div>
				
				<div id="wrapper_CityInfo_List" class="collapse">
					<select id="selector_City_List" class="form-control">
						<option value="">도시 선택</option>
						<option value="Seoul">서울</option>
						<option value="Paris">파리</option>
						<option value="Nice">니스</option>
						<option value="Lyon">리옹</option>
						<option value="Sanghi">상해</option>
						<option value="Hongkong">홍콩</option>
						<option value="Bangkok">방콕</option>
						<option value="Danang">다낭</option>
						<option value="Hanoi">하노이</option>
						<option value="Hawaii">하와이</option>
						<option value="Beijing">베이징</option>
					</select>
					<br>
					<ul class="list-group">
						<li id="title_hotPlace_List" class="list-group-item d-flex justify-content-between align-items-center" 
							data-toggle="collapse" data-target="#hotPlace_List">
						    <label>명소</label>
						    <span class="badge badge-light badge-pill" data-toggle="popover" title="올던트립 추천 명소" data-content="작성창에 드래그&드롭하여 정보를 입력 가능합니다.">?</span>
						</li>
						
						<li id="hotPlace_List" class="collapse bg-white list-group list-group-flush" style="overflow: scroll;">
							<!-- 맛집 정보 리스트 추가 -->
						</li>
						
						<li id="title_restaurant_List" class="list-group-item d-flex justify-content-between align-items-center"
							data-toggle="collapse" data-target="#restaurant_List">
						    <label>맛집</label>
						    <span class="badge badge-light badge-pill" data-toggle="popover" title="올던트립 추천 맛집" data-content="작성창에 드래그&드롭하여 정보를 입력 가능합니다.">?</span>
						</li>
												
						<li id="restaurant_List" class="collapse bg-white list-group list-group-flush" style="overflow: scroll;">
							<!-- 맛집 정보 리스트 추가 -->
						</li>
						
						<li id="title_shopping_List" class="list-group-item d-flex justify-content-between align-items-center"
							data-toggle="collapse" data-target="#shopping_List">
						    <label>쇼핑</label>
						    <span class="badge badge-light badge-pill" data-toggle="popover" title="올던트립 추천 쇼핑장소" data-content="작성창에 드래그&드롭하여 정보를 입력 가능합니다.">?</span>
						</li>
						
						<li id="shopping_List" class="collapse bg-white list-group list-group-flush" style="overflow: scroll;">
							<!-- 쇼핑 정보 리스트 추가 -->
						</li>
						
						<li id="title_weather_List" class="list-group-item d-flex justify-content-between align-items-center"
							data-toggle="collapse" data-target="#weather_List">
						    <label>날씨</label>
							<span class="badge badge-light badge-pill" data-toggle="popover" title="5일간의 날씨정보(현재일 포함)" data-content="작성창에 드래그&드롭하여 정보를 입력 가능합니다.">?</span>
						</li>
						
						<li id="weather_List" class="collapse bg-white list-group list-group-flush" style="overflow: scroll;">
							<!-- 날씨 정보 리스트 추가 -->
						</li>
					</ul>
					<br>
				</div> <!-- end of 도시정보 -->
				
				
				<!-- 계산기 -->
				<div id="title_Calculator" data-toggle="collapse" data-target="#calculator">
					<h5>계산기</h5>
					<hr>
				</div>
				
				<div id="calculator" class="collapse">
					<input type="text" name="inputNum" class="form-control" placeholder="0">
					<br>
					<div class="btn-group-vertical" id="button-wrapper">
						<button id="equal" type="button" class="btn btn-primary btn-bloc">=</button>
						<div class="btn-group btn-group-lg">
						  <button id="seven" type="button" class="btn btn-info number">7</button>
						  <button id="eight" type="button" class="btn btn-info number">8</button>
						  <button id="nine" type="button" class="btn btn-info number">9</button>
						  <button id="plus" type="button" class="btn btn-info operator">+</button>
						</div>
						<div class="btn-group btn-group-lg">
							<button id="four" type="button" class="btn btn-info number">4</button>
							<button id="five" type="button" class="btn btn-info number">5</button>
							<button id="six" type="button" class="btn btn-info number">6</button>
							<button id="minus" type="button" class="btn btn-info operator">-</button>
						</div>
						<div class="btn-group btn-group-lg">
							<button id="one" type="button" class="btn btn-info number">1</button>
							<button id="two" type="button" class="btn btn-info number">2</button>
							<button id="three" type="button" class="btn btn-info number">3</button>
							<button id="multiple" type="button" class="btn btn-info operator">*</button>
						</div>
						<div class="btn-group btn-group-lg">
							<button id="zero" type="button" class="btn btn-info number">0</button>
							<button id="openBracket" type="button" class="btn btn-info">(</button>
							<button id="closeBracket" type="button" class="btn btn-info">)</button>
							<button id="devide" type="button" class="btn btn-info operator">/</button>
						</div>
						<div class="btn-group btn-group-lg">
							<button id="point" type="button" class="btn btn-info number">.</button>
							<button id="back" type="button" class="btn btn-info">←</button>
							<button id="clear" type="button" class="btn btn-info" >C</button>
						</div>	
					</div>
					<div class="row" id="showResult" style="display:none;">
							<div class="col-md-5"> <hr> </div>
							<div class="col-md-2">
								<label class="small">∨</label>
							</div>
							<div class="col-md-5"> <hr> </div>
					</div>
					<div id="calculate_Result_List" class="small" style="background-color: white">
						<!-- 계산기 결과 출력 -->
					</div>
					<br>
				</div> <!-- end of 계산기 -->
			
			
				<!-- 환율 계산기 -->
				<div id="title_ExchangeRate" data-toggle="collapse" data-target="#ExchangeRate">
					<h5>환율계산</h5>
					<hr>
				</div>

				<div id="ExchangeRate" class="collapse">
					<select id="exchange_Country" class="form-control">
						<option value="USD">미국</option>
						<option value="HKD">홍콩</option>
						<option value="EUR">유럽</option>
						<option value="JPY">일본</option>
						<option value="KRW">한국</option>
					</select>
					
					<div class="input-group mb-3">
						<input name="InputMoney" type="text" class="form-control" style="text-align: right;">
						<div class="input-group-append">
							<label class="input-group-text currency1">달러</label>
						</div>
					</div>
				
					<div class="align-self-center">▼</div>
					
					<select id="exchange_Result_Country" class="form-control">
						<option value="KRW">한국</option>
						<option value="USD">미국</option>
						<option value="HKD">홍콩</option>
						<option value="EUR">유럽</option>
						<option value="JPY">일본</option>
					</select>
					<div class="input-group mb-3">
						<input name="ResultMoney" type="text" class="form-control" style="text-align: right;">
						<div class="input-group-append">
							<label class="input-group-text currency2">원</label>
						</div>
					</div>
				</div> <!-- end of 환율계산 -->
				<br>
			</div> <!-- end of 툴바 영역 -->
	
			
			<!-- 에디터 영역 -->
	 		<div id="editor_area" class="d-flex flex-column order-2">
	 			<div class="col_c" style="margin-bottom: 30px">
					<div class="input-group">
						<textarea id="p_content" class="form-control"></textarea>
					</div>
				</div>
				
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroupFileAddon01">썸네일</span>
					</div>
					<div class="custom-file">
						&nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile1">
					</div>
				</div>
	 		</div> <!-- end of 에디터 영역 -->
	
	
			<!-- 지도 영역 사이즈 조절바 -->
			<div id="map_area_resize" class="d-flex order-3" style="background-color: #E1E1E1;">
				<span class="align-self-center"> < </span>
			</div>


			<!-- 지도 영역 -->
			<div id="map_area" class="d-flex flex-column p-4 bg-light order-4">
				<div class="d-flex custom-control custom-switch justify-content-end">
			    	<input type="checkbox" id="switch1" class="custom-control-input">
			    	<label class="custom-control-label small" for="switch1"></label>
				</div>
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
					
					<form>
						<div class="custom-control custom-checkbox">
					   		<input type="checkbox" id="nearby_Restaurant" class="custom-control-input" name="nearby_Restaurant">
					    	<label class="custom-control-label" for="nearby_Restaurant">근처 식당</label>
						</div>
						<div class="custom-control custom-checkbox">
					   		<input type="checkbox" id="nearby_Hotplace" class="custom-control-input" name="nearby_Hotplace">
					    	<label class="custom-control-label" for="nearby_Hotplace">근처 명소</label>
						</div>
						<div class="custom-control custom-checkbox">
					   		<input type="checkbox" id="nearby_Shopping" class="custom-control-input" name="nearby_Shopping">
					    	<label class="custom-control-label" for="nearby_Shopping">근처 쇼핑</label>
						</div>
					</form>
					
					
					<div id="show_Map_Search_Result" class="row" style="display: none;">
						<div class="col-md-4"> <hr> </div>
						<div class="col-md-4">
							<label class="small" data-toggle="collapse" data-target="#Map_Search_List">핀 리스트</label>
						</div>
						<div class="col-md-4"> <hr> </div>
					</div>
					<div id="Map_Search_List">
						<!-- 핀 리스트 목록 출력 -->
					</div>
				</div>
			</div> <!-- end of 지도 영역 -->
		</div> <!-- end of 문서작성 영역 -->
		
	
	
	<!-- 에디터 가로 크기 지정을 위한 input 태그 -->
	<input type="hidden" name="width" id="width" value="${width}">

</body>
<!--=================================googleMap API======================================-->

<script src="https://maps.google.com/maps/api/js?key=AIzaSyBS2oAuYkl-89AZWRlo4UkUFVgWHLcN2qM&libraries=places"></script>
<script src="${contextPath}/resources/js/planner/plannerMap.js"></script>

<!--====================================================================================-->

<script src="${contextPath}/resources/js/planner/plannerWrite.js"></script>
<script src="${contextPath}/resources/js/planner/calculator.js"></script>
<script src="${contextPath}/resources/js/planner/exchange.js"></script>

<!--=================================CKeditor 설정=======================================-->

<script>
	CKEDITOR.replace('p_content', { height: 1000 });
	CKEDITOR.replace( 'editor', {
	    spreadsheet_licenseKey: '67Gn/ccajt8HqAe6ISOxvFLS3VuCdhWHiKWsSvBTtJgRVOqyoSnOBpwiVPfmdpn0CXKykieFQVsEcjCNj39tPDf6YmacQx277AZYwFIR4nHCDAU0ULqRnHecxzCTgEOQMRdqpk0ettsJSxUNe0OXzFAUKQ==',
	} );
</script>

<!--====================================================================================-->
</html>