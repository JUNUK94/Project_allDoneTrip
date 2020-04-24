<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
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

	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js" 
			integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E=" crossorigin="anonymous"></script>
	
<!--================================Ajax Cross Origin===================================-->

	<script src="${contextPath}/resources/js/ajaxCrossOrigin/jquery.ajax-cross-origin.min.js"></script>

<!--====================================CKeditor========================================-->

	<script src="${contextPath}/resources/CKEditor/ckeditor/ckeditor.js"></script>


<!--====================================cropbox========================================-->

	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="${contextPath}/resources/crop/cropbox.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/crop/style.css">
	
<!--===================================bootstrap========================================-->

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>

<!--====================================================================================-->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>

</head>
<body>

	<!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>플래너 작성</h2>
                            <p>Plan your trip</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->


		<!-- 상단 설정 정보 입력 영역 -->
		<div id="button_area" class="d-flex flex-row p-3 bg-light justify-content-end align-items-center">
			<div>
				<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
					열기
				</button>
				<div class="dropdown-menu">
					<c:if test="${list != null}">
						<c:forEach items="${list}" var="pvo">
							<div class="dropdown-item" onclick="getPlannerInfo(${pvo.plan_No})" style="cursor: pointer">
								<div class="small font-weight-light font-italic">
								${pvo.updateDate}
								</div>
								${pvo.p_Title}
							</div>
							<hr>
						</c:forEach>
					</c:if>
				</div>
				<button type="button" id="newPlanner" class="btn btn-primary">
					새글쓰기
				</button>
				
			</div>
			<button type="button" id="savePDF_Btn1" class="btn btn-outline-secondary" style="font-weight: bold">
				pdf 다운로드
			</button>
			<button type="button" id="save" class="btn btn-outline-secondary" style="font-weight: bold" data-toggle="tooltip" title="나만이 확인할 수 있도록 저장합니다. 저장한 플래너는 마이페이지에서 확인하실 수 있습니다.">
					저장
			</button>
			&nbsp;
			<button type="button" id="register" class="btn btn-outline-secondary" style="font-weight: bold" data-toggle="tooltip" title="플래너 게시판에 등록하여 모두에게 공유합니다.">
				게시
			</button>
		</div>
		
		<!-- 상단 플래너 정보 입력 영역 -->
		<div id="title_area" class="d-flex flex-row flex-wrap justify-content-start align-items-center">
			<div class="input-group p-3" style="width:25%">
				<div class="input-group-prepend">
					<label class="input-group-text">제목</label>
				</div>
				<input id="plannerTitle" name="plannerTitle" type="text" class="form-control">
			</div>
	 		<div class="input-group p-3" style="width:20%">
				<div class="input-group-prepend">
					<label class="input-group-text">대표 여행지</label>
				</div>
				<select id="mainCity" class="form-control">
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
				<input id="startDay" name="startDay" type="date" class="form-control">
			</div>
			<div class="input-group p-3" style="width:20%">	
				<input id="endDay" name="endDay" type="date" class="form-control">
				<div class="input-group-append">
					<label class="input-group-text">여행종료</label>
				</div>
			</div>
			<div class="input-group p-3" style="width:15%">
				<div class="input-group-append">
					<button id="openModal" class="btn btn-outline-secondary" style="font-weight: bold" data-toggle="modal" data-target="#thumbnailModal">
						썸네일
					</button>
				</div>
				<input type="text" id="ThumbnailName" name="ThumbnailName"  class="form-control" readonly="readonly" value="">
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
						<option value="Shanghai">상하이</option>
						<option value="Hongkong">홍콩</option>
						<option value="Beijing">베이징</option>
						<option value="Bangkok">방콕</option>
						<option value="Danang">다낭</option>
						<option value="Hanoi">하노이</option>
						<option value="Hawaii">하와이</option>
					</select>
					<br>
					<ul class="list-group">
						<li id="title_hotPlace_List" class="list-group-item d-flex justify-content-between align-items-center" 
							data-toggle="collapse" data-target="#hotPlace_List">
						    <label>명소</label>
						    <span class="badge badge-light badge-pill" data-toggle="tooltip" title="작성창에 드래그&드롭하여 정보를 입력 가능합니다.">?</span>
						</li>
						
						<li id="hotPlace_List" class="collapse bg-white list-group list-group-flush" style="overflow: scroll;">
							<!-- 명소 정보 리스트 추가 -->
						</li>
						
						<li id="title_restaurant_List" class="list-group-item d-flex justify-content-between align-items-center"
							data-toggle="collapse" data-target="#restaurant_List">
						    <label>맛집</label>
						    <span class="badge badge-light badge-pill" data-toggle="tooltip" title="작성창에 드래그&드롭하여 정보를 입력 가능합니다.">?</span>
						</li>
												
						<li id="restaurant_List" class="collapse bg-white list-group list-group-flush" style="overflow: scroll;">
							<!-- 맛집 정보 리스트 추가 -->
						</li>
						
						<li id="title_shopping_List" class="list-group-item d-flex justify-content-between align-items-center"
							data-toggle="collapse" data-target="#shopping_List">
						    <label>쇼핑</label>
						    <span class="badge badge-light badge-pill" data-toggle="tooltip" title="작성창에 드래그&드롭하여 정보를 입력 가능합니다.">?</span>
						</li>
						
						<li id="shopping_List" class="collapse bg-white list-group list-group-flush" style="overflow: scroll;">
							<!-- 쇼핑 정보 리스트 추가 -->
						</li>
						
						<li id="title_weather_List" class="list-group-item d-flex justify-content-between align-items-center"
							data-toggle="collapse" data-target="#weather_List">
						    <label>날씨</label>
							<span class="badge badge-light badge-pill" data-toggle="tooltip" title="현재일 포함 5일간의 날씨정보입니다. 작성창에 드래그&드롭하여 정보를 입력 가능합니다.">?</span>
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
	 		<div id="editor_area" class="d-flex flex-column justify-content-center align-self-start order-2">
	 			<div class="col_c" style="margin-bottom: 30px">
					<div class="input-group pdfDiv">
						<textarea id="p_Content" class="form-control">
								<c:if test="${data ne null}">
									${data.p_Content}
								</c:if>
						</textarea>
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
		
	
	
	
	<!-- 썸네일 생성 Modal -->
	<div id="thumbnailModal" class="modal fade">
		<div class="modal-dialog modal-lg ">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">썸네일 첨부</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
			
				<!-- Modal body -->
				<div id="cropArea" class="modal-body d-flex flex-row">
					<div class="imageBox" style="width: 50%">
				        <div class="thumbBox"></div>
				        <div class="spinner" style="display: none">Loading...</div>
					    <div class="btn-group justify-content-center">
							<input type="button" id="btnZoomIn" 	class="btn btn-primary"	value="+">
							<input type="button" id="btnZoomOut" 	class="btn btn-primary"	value="-">
							<input type="button" id="btnCrop" 		class="btn btn-primary"	value="Crop">
						</div>
				    </div>
				    <div class="action d-flex flex-column justify-content-center" style="width:50%">
					    <div class="cropped d-flex justify-content-center" style="height: 250px">
					    	<!-- 크롭된 이미지 보여주는 곳 -->
					    </div>
					    <div class="d-flex flex-column p-3 justify-content-center" style="width:100%">
					        <label class="btn btn-block btn-outline-primary" for="thumbnailFile">파일 선택</label>
							<input type="file" id="thumbnailFile" class="form-control-file" accept="image/*" style="display: none">
					        <button type="button" id="submit_Thumbnail" class="btn btn-primary" style="margin-bottom: 8px">등록</button>
					    	<button type="button" id="cancle_Thumbnail" class="btn btn-secondary">취소</button>
				        </div>
				    </div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 불러온 정보 셋팅을 위한 input 창 -->
	<form id="setDataForm" name="setDataForm" action="" method="">	
		<input type="hidden" name="email" id="email" value="${email}"/>
		<input type="hidden" name="nick_Name" id="nick_Name" value="${nick_Name}"/>
		<c:if test="${data != null}">
			<input type="hidden" name="plan_No" id="plan_No" value="${data.plan_No}"/>
			<input type="hidden" name="title" value="${data.p_Title}"/>
			<input type="hidden" name="city_Number" value="${data.city_No}"/>
			<input type="hidden" name="day1" value="${data.startDay}"/>
			<input type="hidden" name="day2" value="${data.endDay}"/>
			<input type="hidden" name="thumbImg" value="${data.p_Thumbnail}"/>
		</c:if>
		<c:if test="${data == null}">
			<input type="hidden" name="plan_No" id="plan_No" value=""/>
			<input type="hidden" name="title" value=""/>
			<input type="hidden" name="city_Number" value=""/>
			<input type="hidden" name="day1" value=""/>
			<input type="hidden" name="day2" value=""/>
			<input type="hidden" name="thumbImg" value=""/>
		</c:if>
	</form>
</body>

<!--=================================googleMap API======================================-->

	<!-- <script src="${contextPath}/resources/js/planner/plannerMap.js"></script> -->

<!--====================================================================================-->

	<script src="${contextPath}/resources/js/planner/plannerWrite.js"></script>
	<script src="${contextPath}/resources/js/planner/plannerCityInfo.js"></script>
	<script src="${contextPath}/resources/js/planner/calculator.js"></script>
	<script src="${contextPath}/resources/js/planner/exchange.js"></script>

<!--=================================CKeditor 설정=======================================-->

	<script>
		CKEDITOR.replace( 'p_Content', {
			height: 500,
			width: '100%',
			filebrowserImageUploadUrl : '/upload/imageInput',	//이미지 업로드 시 저장경로 
			imageUploadUrl : '/upload/dragImage'				//드래그&드롭 시 이미지저장 경로
		} );
	</script>

<!--===========================================================================================================-->
	<script>
	    $(document).ready(function() {
	    	//=================================불러온 플래너 데이터 setting하기=====================================
	    	if($("input[name='plan_No']").val()){
	    		console.log("here");
	    		document.getElementById("plan_No").value = $("#plan_No").val();
	    		document.getElementById("plannerTitle").value = $("input[name='title']").val();
	    		document.getElementById("mainCity").value = $("input[name='city_Number']").val();
	    		document.getElementById("startDay").value = $("input[name='day1']").val();
	    		document.getElementById("endDay").value = $("input[name='day2']").val();
	        	document.getElementById("ThumbnailName").value = $("input[name='thumbImg']").val();
	    	}
	    	
	    	//=================================썸네일 crop=====================================
	    	var options = {
							thumbBox: '.thumbBox',
							spinner: '.spinner',
							imgSrc: ''
							}
	        var cropper = $('.imageBox').cropbox(options);
	       
	    	$('#thumbnailFile').on('change', function(){
	    		
	    		var ori_Path = ($(this).val()).split('\\'); //원래 파일명 찾기위해 split
	    		var Name = ori_Path[ori_Path.length-1]; //원래 파일명 찾기
	    		var real_Name = Name.split(".")[0] + ".png"; //확장자를 png로 변경
	    		
	    		console.log("realname = " + real_Name);
	    		
	            var reader = new FileReader();
	            reader.onload = function(e) {
	                options.imgSrc = e.target.result;
	                cropper = $('.imageBox').cropbox(options);
	            }
	            reader.readAsDataURL(this.files[0]);
	            
	            //줌인 버튼 클릭
	            $('#btnZoomIn').on('click', function(){
		            cropper.zoomIn();
		        });
		        //줌아웃 버튼 클릭
		        $('#btnZoomOut').on('click', function(){
		            cropper.zoomOut();
		        });
		        //크롭버튼 클릭 -> 이미지 잘라서 반환
				$('#btnCrop').on('click', function(){
		            var img = cropper.getDataURL();
		            $(".cropped").empty();
		            $(".cropped").append("<img src='"+img+"' style='border: 1px solid gray'>");
		            $("#ThumbnailName").val(real_Name);
		        });
				//취소버튼 클릭
				$('#cancle_Thumbnail').on('click', function(){
					$(".cropped").empty();
					$("#ThumbnailName").val("");
				});
				//등록버튼 클릭 -> 서버에 전송
				$('#submit_Thumbnail').on('click', function(){
					
					if(!$("#email").val()){
						alert("썸네일은 로그인 후 이용 가능합니다.");
						$("#ThumbnailName").val("");
						return false;
					}
					
					//크롭한 섬네일 이미지를 blob데이터로 반환받음(png형식)
					var imgBlob = cropper.getBlob();
					//폼데이터 생성해서 데이터 append 
					var obj = new FormData();
					obj.append("fileName", $("#ThumbnailName").val());
					obj.append("pData", imgBlob);
					
					//폼데이터를 multipart로 인코딩하여 서버에 업로드하기 위해 통신
					$.ajax({
			            url: "/upload/thumbnail",
			            data: obj,
			          	enctype : "multipart/form-data", 
			          	processData: false,
			          	contentType: false,
			            type: 'post',
			            dataType: 'JSON',
			            success: function(map){
			            	alert("섬네일 등록 완료");
			            	$("#ThumbnailName").val(map.url);
			            },
			            error: function(xhr){
			            	console.log("실패", xhr); 
			            }
			        });
					
				});
	        });
	        
	    	//=================================pdf로 저장=====================================
	    	$('#savePDF_Btn1').on("click", function() {
				
	    		function pdfPrint(){
	    	        // 현재 document.body의 html을 A4 크기에 맞춰 PDF로 변환
	    	        html2canvas(document.getElementById('p_Content'), {
	    	        	proxy: "https://alldonetrip.shop",
	    	        	letterRendering: 1,
	    	        	allowTaint : false,
	    	        	useCORS :  true,
	    	            onrendered: function (canvas) {
	    					
	    	                // 캔버스를 이미지로 변환
	    	                var imgData = canvas.toDataURL('image/png');
	    	
	    	                var margin = 10;	
	    	                var imgWidth = 190; // 210-(margin*10) = 190mm
	    	                var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
	    	                var imgHeight = canvas.height * imgWidth / canvas.width;
	    	                var heightLeft = imgHeight;
	    					var position = 0;
	    					
	    	                var doc = new jsPDF('p', 'mm');
	    	
	    	                // 첫 페이지 출력
	    	                doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
	    	                heightLeft -= pageHeight;
	    	
	    	                // 한 페이지 이상일 경우 루프 돌면서 출력
	    	                while (heightLeft >= 20) {
	    	                    position = heightLeft - imgHeight;
	    	                    doc.addPage();
	    	                    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
	    	                    heightLeft -= pageHeight;
	    	                }
	    	
	    	                // 파일 저장
	    	                doc.save(document.getElementById("plannerTitle").value+'.pdf');
	    	
	    	                //이미지로 표현
	    	                //document.write('<img src="'+imgData+'" />');
	    	            }
	    	        });
	    	    }
	    	});
	    	
	    	
			//=================================마우스로 지도영역 너비 조절=====================================
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
			
			// 함수 실행
			mouseInit();
			
		});
	</script>
<!--====================================================================================-->
</html>