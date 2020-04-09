<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>플래너 작성</title>
	<style>
		#mapShow {
			width: 100%;
			height: 200px;
			border: solid 1px gray;
		}

		span.weather_info:hover{
			cursor: grab;
			background-color: darkturquoise;
		}

		#title_CityInfo:hover,
		#title_Calculator:hover,
		#title_ExchangeRate:hover{
			cursor: pointer;
			color: darkturquoise;
		}

		#title_hotPlace_List:hover, 
		#title_restaurant_List:hover, 
		#title_shopping_List:hover, 
		#title_weather_List:hover{
			cursor: pointer;
			color: darkturquoise;
		}
	
		.remove_Cal_Result:hover{
			cursor: pointer;
			color: darkturquoise;
		}

	</style>
	<!--=====================================jquery=========================================-->

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

	<!--====================================CKeditor========================================-->

	<script src="${contextPath}/resources/CKEditor/ckeditor/ckeditor.js"></script>

	<!--===================================bootstrap========================================-->

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>

	<!--====================================================================================-->
</head>

<body>
	<br><br>
	<div class="row">
		<div class="col-md-3">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">제목</label>
				</div>
				<input type="text" class="form-control">
			</div>
		</div>
		<div class="col-md-2">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">대표 여행도시</label>
				</div>
				<select class="custom-select" id="mainCity">
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
		</div>
		<div class="col-md-5">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">여행시작</label>
				</div>
				<input type="date" class="form-control">-<input type="date" class="form-control">
				<div class="input-group-append">
					<label class="input-group-text">여행종료</label>
				</div>
			</div>
		</div>
		<div class="col-md-2 justify-content-md-right">
			<button type="submit" class="btn btn-outline-secondary" style="font-weight: bold">저장</button>
			<button type="submit" class="btn btn-outline-secondary" style="font-weight: bold">등록</button>
		</div>
	</div>



	<div class="row">
		<!-- 왼쪽 툴바 -->
		<div class="col-md-2 bg-light">
			<!-- 드래그&드롭 테스트 -->
			<br>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10" id="title_CityInfo">
					<h4>도시정보</h4>
				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<hr>
				</div>
			</div>
			<div class="row" id="wrapper_CityInfo_List" style="display: none;">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<select class="form-control" id="selector_City_List">
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
								<option value="ChiangMai">치앙마이</option>
								<option value="Beijing">베이징</option>
							</select>
						</div>
						<div class="col-md-1"></div>
						<br>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-1"></div>
								<div class="col-md-10" id="title_hotPlace_List">
									<label>명소 ∨</label>
								</div>
								<div class="col-md-1"></div>
							</div>
							<div class="row" id="wrapper_hotPlace_List" style="display:none;">
								<div class="col-md-1"></div>
								<div class="col-md-10 bg-white" style="overflow: scroll;width:350px; height:200px;">
									<ul id="hotPlace_List">
										<li>ccccccccccc</li>
										<li>ccccccccccc</li>
										<li>ccccccccccc</li>
										<li>ccccccccccc</li>
										<li>ccccccccccc</li>
									</ul>
								</div>
								<div class="col-md-1"></div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-1"></div>
								<div class="col-md-10" id="title_restaurant_List">
									<label>맛집 ∨</label>
								</div>
								<div class="col-md-1"></div>
							</div>
							<div class="row" id="wrapper_restaurant_List" style="display:none;">
								<div class="col-md-1"></div>
								<div class="col-md-10 bg-white" style="overflow: scroll;width:350px; height:200px;">
									<ul id="restaurant_List">
										<li>kkkkkkkkkkk</li>
										<li>kkkkkkkkkkk</li>
										<li>kkkkkkkkkkk</li>
										<li>kkkkkkkkkkk</li>
										<li>kkkkkkkkkkk</li>
									</ul>
								</div>
								<div class="col-md-1"></div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-1"></div>
								<div class="col-md-10" id="title_shopping_List">
									<label>쇼핑 ∨</label>
								</div>
								<div class="col-md-1"></div>
							</div>
							<div class="row" id="wrapper_shopping_List" style="display:none;">
								<div class="col-md-1"></div>
								<div class="col-md-10 bg-white" style="overflow: scroll;width:350px; height:200px;">
									<ul id="shopping_List">
										<li>bbbbbbbbbbb</li>
										<li>bbbbbbbbbbb</li>
										<li>bbbbbbbbbbb</li>
										<li>bbbbbbbbbbb</li>
										<li>bbbbbbbbbbb</li>
									</ul>
								</div>
								<div class="col-md-1"></div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-1"></div>
								<div class="col-md-10" id="title_weather_List">
									<label>날씨 ∨</label>
								</div>
								<div class="col-md-1"></div>
							</div>
							<div class="row" id="wrapper_weather_List" style="display:none;">
								<div class="col-md-1"></div>
								<div class="col-md-10 bg-white" id="weather_List" style="overflow: scroll; width:100%;">
								</div>
								<div class="col-md-1"></div>
							</div>
							<br>
						</div>
					</div>
				</div>
				<br>
			</div>

			<!-- 계산기 -->
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10" id="title_Calculator">
					<h4>계산기</h4>
				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<hr>
				</div>
			</div>
			<div class="row" id="calculator" style="display:none;">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-12">
						<input type="text" name="inputNum" class="form-control" placeholder="0">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12">
							<div class="btn-group-vertical" id="button-wrapper">
								<button id="equal" type="button" class="btn btn-primary btn-block">=</button>
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
						</div>
					</div>
					<div class="row" id="showResult" style="display:none;">
						<div class="col-md-5"> <hr> </div>
						<div class="col-md-2">
							<label class="small">∨</label>
						</div>
						<div class="col-md-5"> <hr> </div>
					</div>
					<div class="row small" style="background-color: white">
						<div class="col-md-12">
							<div id="calculate_Result_List"></div>
						</div>
					</div>
				</div>
				<div class="col-md-1"></div>
				<br>
			</div>

			<!-- 환율 계산기 -->
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10" id="title_ExchangeRate">
					<h4>환율계산</h4>
				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div id="wrapper_ExchangeRate" style="display: none">
						<div class="row">
							<div class="col-md-12">
								<select class="form-control exchange_Country">
									<option value="USD">미국</option>
									<option value="HKD">홍콩</option>
									<option value="EUR">유럽</option>
									<option value="JPY">일본</option>
									<option value="KRW">한국</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="input-group mb-3">
									<input name="InputMoney" type="text" class="form-control" style="text-align: right;">
									<div class="input-group-append">
										<label class="input-group-text currency1">달러</label>
									</div>
								</div>
							</div>
						</div>
						<div class="row text-center">
							<div class="col-md-12 align-self-center">▼</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<select class="form-control exchange_Result_Country">
									<option value="KRW">한국</option>
									<option value="USD">미국</option>
									<option value="HKD">홍콩</option>
									<option value="EUR">유럽</option>
									<option value="JPY">일본</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="input-group mb-3">
									<input name="ResultMoney" type="text" class="form-control" style="text-align: right;">
									<div class="input-group-append">
										<label class="input-group-text currency2">원</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div><!-- end of col-md-2 -->



		<!-- 에디터 시작 -->
		<div class="col-md-8">
			<div class="content">
				<div class="row justify-content-md-center">
					<div class="col-md-12">
						<div class="col_c" style="margin-bottom: 30px">
							<div class="input-group">
								<textarea class="form-control" id="p_content"></textarea>
								<script type="text/javascript">
									CKEDITOR.replace('p_content', { height: 1000 });
								</script>
							</div>
						</div>
					</div>
				</div>

				<div class="row justify-content-md-center">
					<div class="col-md-12">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroupFileAddon01">썸네일</span>
							</div>
							<div class="custom-file">
								&nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile1">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- end of <div class="col-md-8"> -->

		<!-- 지도영역 시작 -->
		<div class="col-md-2 bg-light">
			<div class="row">
				<div class="col-md-12">
					<div id="mapShow"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<a href="#" id="showMyPositon" class="text-primary small">내 위치로 이동</a>
				</div>
				<div class="col-md-12">
					<div class="input-group mb-3">
						<!--  <form id="searchPlace_Form" action="https://www.google.com/maps/search/?api=1&query=" method="get">-->
						<input type="text" id="query" name="query" class="form-control SearchBox">
						<div class="input-group-append">
							<button id="searchPlaceBtn" class="input-group-text">검색</button>
						</div>
						<!--</form>-->
					</div>
				</div>
			</div>
		</div>
	</div> <!-- end of row -->



	<input type="hidden" name="width" id="width" value="${width}">


</body>
<!--=================================googleMap API======================================-->
<script src="${contextPath}/resources/js/planner/plannerMap.js"></script>
<script src="http://maps.google.com/maps/api/js?key=AIzaSyBS2oAuYkl-89AZWRlo4UkUFVgWHLcN2qM&libraries=places"></script>
<!--====================================================================================-->
<script src="${contextPath}/resources/js/planner/plannerWrite.js"></script>
<script src="${contextPath}/resources/js/planner/weather.js"></script>
<script src="${contextPath}/resources/js/planner/calculator.js"></script>
<script src="${contextPath}/resources/js/planner/exchange.js"></script>
<!--====================================================================================-->




</html>