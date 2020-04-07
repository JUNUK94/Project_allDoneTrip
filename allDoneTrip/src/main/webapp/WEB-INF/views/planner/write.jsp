<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
	body {
		position: relative; 
  	}
</style>
<!--=====================================jquery=========================================-->

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	
<!--====================================CKeditor========================================-->

	<script src="${contextPath}/resources/CKEditor/ckeditor/ckeditor.js"></script>

<!--===================================bootstrap========================================-->

	<link rel="stylesheet" 
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
		crossorigin="anonymous">
		
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" 
		crossorigin="anonymous"></script>
		
<!--====================================================================================-->
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="50">
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
					<input type="date">~<input type="date">
					<div class="input-group-append">
						<label class="input-group-text">여행종료</label>
					</div>
				</div>
			</div>
			<div class="col-md-2 justify-content-md-right">
					<button type="submit" class="btn btn-outline-secondary"
						style="font-weight: bold">저장</button>
					<button type="submit" class="btn btn-outline-secondary"
						style="font-weight: bold">등록</button>
				</div>
		</div>


		
		<div class="row">
			<!-- 왼쪽 툴바 -->
			<div class="col-md-2 bg-light">
				<!-- 드래그&드롭 테스트 -->
				<div class="row">
					<div class="col-md-12" id="title_CityInfo">
						<h4>도시정보</h4>
						<hr>
					</div>
				</div>
					<div class="row" id="wrapper_CitInfoSelector" style="display: none;">
						<div class="col-md-12">
							<select class="form-control" id="CitInfoSelector">
								<option value="" selected>도시 선택</option>
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
					<br>
					<div class="containor" id="CitInfo" style="display: none">
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-10">
										명소 ∨
										<hr>
									</div>
									<div class="col-md-1"></div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<ul id="hotPlace">
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-10">
										맛집 ∨
										<hr>
									</div>
									<div class="col-md-1"></div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<ul id="restaurant">
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-10">
										쇼핑 ∨
										<hr>
									</div>
									<div class="col-md-1"></div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<ul id="shopping">
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-10">
										날씨 ∨
										<hr>
									</div>
									<div class="col-md-1"></div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<ul id="weather">
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
									
							<ul>
								<li id="pensu" draggable="true">펭수</li>
							</ul>
				
				
				<br> <br>
				
				<!-- 계산기 -->
				<div class="row">
					<div class="col-md-12">
						<h4>계산기</h4>
						<hr>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<input type="text" name="inputNum" placeholder="0">
						<button class="clear">C</button>
						<div>
							<div class="row">
								<div class="col-md-12">
									<button class="seven">7</button>
									<button class="eight">8</button>
									<button class="nine">9</button>
									<button class="plus">+</button>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<button class="four">4</button>
									<button class="five">5</button>
									<button class="six">6</button>
									<button class="minus">-</button>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<button class="one">1</button>
									<button class="tow">2</button>
									<button class="three">3</button>
									<button class="multiple">x</button>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<button class="zero">0</button>
									<button class="openBracket">(</button>
									<button class="closeBracket">)</button>
									<button class="devide">/</button>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<button class="point">.</button>
									<button class="back">back</button>
									<button class="calculator">=</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<br>					
				<div class="row">
					<div class="col-md-12">
						<input type="text" class="showProcess" placeholder="결과">
						<div class="showResult"></div>
					</div>
				</div>	
				
				<br> <br>
				
				<!-- 환율 계산기 -->
				<div class="row">
					<div class="col-md-12">
						<h4>환율계산</h4>
						<hr>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<select class="exchange_Country">
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
							<input name="InputMoney" type="text" style="width:70%; text-align: right;">
							<div class="input-group-append">
								<label class="input-group-text currency1">달러</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-12">▼</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<select class="exchange_Result_Country" style="width: 100px;">
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
							<input name="ResultMoney" type="text" style="width: 70%; text-align: right;">
							<div class="input-group-append">
								<label class="input-group-text currency2">원</label>
							</div>
						</div>
					</div>
				</div>
			</div> <!-- end of col-md-2 -->
			
			
			<!-- 에디터 시작 -->
			<div class="col-md-8">
				<div class="content">
					<div class="row justify-content-md-center">
						<div class="col-md-12">
							<div class="col_c" style="margin-bottom: 30px">
								<div class="input-group">
									<textarea class="form-control" id="p_content"></textarea>
									<script type="text/javascript">
		                  				CKEDITOR.replace('p_content', {height: 1000});
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
		
		<div id="weather"></div>
		
		
</body>
<!--=================================googleMap API======================================-->
	<script src="${contextPath}/resources/js/planner/plannerMap.js"></script>
	<script src="http://maps.google.com/maps/api/js?key=AIzaSyBS2oAuYkl-89AZWRlo4UkUFVgWHLcN2qM&libraries=places"></script>
<!--====================================================================================-->
	<script src="${contextPath}/resources/js/planner/drag&drop.js"></script>
	<script src="${contextPath}/resources/js/planner/calculator.js"></script>
	<script src="${contextPath}/resources/js/planner/exchange.js"></script>
	<script src="${contextPath}/resources/js/planner/weather.js"></script>
	<script src="${contextPath}/resources/js/planner/plannerWrite.js"></script>
<!--====================================================================================-->
</html>
