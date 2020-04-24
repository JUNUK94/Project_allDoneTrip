<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="myBody">
<!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>마이 페이지</h2>
                            <p>MyPage</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
	<div class="row">
		<div class="col-2 border" >
			<br>
			<div class="badge" style="position: relative; font-size:15pt;">마이페이지 </div><br><br>
			<ul class="nav flex-column">
				<li class="nav-item">
					<a class="myBoard nav-link" id="">나의 게시글</a><br>
				</li>
				<li class="nav-item">
					<a class="myPlanner nav-link" id="">나의 플래너</a><br>
				</li>
				<li class="nav-item">
					<a class="myScrap nav-link" id="">스크랩</a><br>
				</li>
				<li class="nav-item">
					<a class="myInfo nav-link" href="/my/memberInfoModify">회원정보 수정/탈퇴</a>
				</li>
			</ul>		
		</div>
		<div class="col-10 border">

<c:forEach items="${mem}" var="mem">
	<form id="memberInfoUpdate" >
	<div class="container-sm mt-5">
		<div class="row mt-3"></div>
		<div class="row">
			<div class="col-3"></div>
			
			<div class="col-6 border">
				<div class="row">
					<div class="col-3 mt-3">
						<img src="${mem.profile}" id="profileImage" class="rounded-circle bg-primary" width=100px height=100px>
					</div>
					<div class="col-6 mt-3">
						<div class="row mt-5">
							<div class="col-6">
								<button type="button" id="openModal" class="btn btn-outline-secondary" style="font-weight: bold; margin-top: -10px" data-toggle="modal" data-target="#profileSet">
										프로필 변경
								</button><br>	<input type="hidden" placeholder="" name="profile" id="profile">
							</div>
							<div class="col"></div>
							
						</div><br>
						
						<div class="row mt-3"></div>
						<div class="row mt-4">
						
							<div class="col-4">이메일</div>
							<div class="col">
							<input type="text" class="form-control" value="${mem.email }" id="email" name="email" readonly="readonly">
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-4">이름</div>
							<div class="col">
								<input type="text" class="form-control" value="${mem.name }" id="name" name="name">
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-4">닉네임</div>
							<div class="col">
								<input type="text" class="form-control" value="${mem.nick_Name }" id="nick_Name" name="nick_Name">
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-4">비밀번호</div>
							<div class="col">
								<input type="password" class="form-control" value="${mem.pw }" id="pw" name="pw">
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-4">전화번호</div>
							<div class="col">
								<input type="text" class="form-control" value="${mem.phone_Num }" id="phone_Num" name="phone_Num">
							</div>
						</div>	
						<div class="row mt-4">
							<div class="col-4">한줄소개</div>
							<div class="col">
								<input type="text" class="form-control" maxlength="20" value="${mem.introduce }" placeholder="20자  제한" id="introduce" name="introduce">
							</div>
						</div>
					</div>
					
				</div>
				
				
				<br><br>
				<div class="row mt-5 justify-content-center">
					<button type="button" class="btn btn-primary" id="modify">수정</button>
					<button type="button" class="btn btn-link" id="cancel">취소</button>
				</div>
				
				<div class="row mt-3">
					<div class="col-3"></div>
					<div class="col text-right" style="font-size:10pt;">
						<a class="nav-link" href="#">회원탈퇴</a>
					</div>
				</div>
				
			</div>
			<div class="col-3"></div>
		</div>
		
		<input type="hidden" placeholder="" id="message" value="${message }">
		
	</div>
	</form>
</c:forEach>
	
	<br><br><br>
	
	
	</div>
</div>		
		<!--========================================================== 썸네일 생성 Modal =============================================-->
	<div id="profileSet" class="modal fade">
		<div class="modal-dialog modal-lg ">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">프로필사진 변경</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<!-- Modal body -->
				<div id="cropArea" class="modal-body d-flex flex-row">
					<div class="imageBox" style="width: 50%">
				        <div class="thumbBox rounded-circle" style="width:100px; height:100px; margin-top: -50px; margin-left: -50px;"></div>
				        <div class="spinner" style="display: none">Loading...</div>
					    <div class="btn-group justify-content-center">
							<input type="button" id="btnZoomIn" 	class="btn btn-primary"	value="+">
							<input type="button" id="btnZoomOut" 	class="btn btn-primary"	value="-">
							<input type="button" id="btnCrop" 		class="btn btn-primary"	value="Crop">
						</div>
				    </div>
				    <div class="action d-flex flex-column justify-content-center" style="width:50%">
					    <div class="cropped d-flex justify-content-center align-items-center" style="height: 250px">
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
	<!-- ===================================================프로필 모달 끝 ============================================================ -->
		
	
	<input type="hidden" name="email" id="email" value="${email}"/>
</body>
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="${contextPath}/resources/crop/cropbox.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/crop/style.css">
	<script src="/resources/js/login/allDoneSignUp.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
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
            $(".cropped").append("<img src='"+img+"' class='rounded-circle' style='width:100px; height:100px; border: 1px solid gray'>");
            $("#profile").val(real_Name);
        });
		//취소버튼 클릭
		$('#cancle_Thumbnail').on('click', function(){
			$(".cropped").empty();
			$("#profile").val("");
		});
		//등록버튼 클릭 -> 서버에 전송
		$('#submit_Thumbnail').on('click', function(){
			
			if(!$("#email").val()){
				alert("로그인 후 이용 가능합니다.");
				$("#profile").val("");
				return false;
			}
			
			//크롭한 섬네일 이미지를 blob데이터로 반환받음(png형식)
			var imgBlob = cropper.getBlob();
			//폼데이터 생성해서 데이터 append 
			var obj = new FormData();
			obj.append("fileName", $("#profile").val());
			obj.append("pData", imgBlob);
			console.log($("#profile").val());
			//폼데이터를 multipart로 인코딩하여 서버에 업로드하기 위해 통신
			$.ajax({
	            url: "/upload/profile",
	            data: obj,
	          	enctype : "multipart/form-data", 
	          	processData: false,
	          	contentType: false,
	            type: 'post',
	            dataType: 'JSON',
	            success: function(map){
	            	alert("프로필사진 변경 완료");
	            	alert(map.url);
	            	$("#profile").val(map.url);
	            	$("#profileImage").attr("src", map.url);
	            	alert(""+$("#profileImage").attr("src"));
	            	//$("#profile").modal("hide");
	            },
	            error: function(xhr){
	            	console.log("실패", xhr); 
	            }
	        });
			
		});
    });
});
</script>
	<script type="text/javascript">
		$("#modify").on("click",function(e){
			var profile = $("#profile").val();
			if(profile != null){
				var form = $("#memberInfoUpdate");
				form.attr("action","/my/memberInfoUpdate");
				form.attr("method","post");
				form.submit();

			}else {
				document.getElementById("profile").value = "alldonetrip.shop/resources/img/user/profile/9f83f30b-cc55-4e5e-8f4f-7eb257367ee1_스폰지밥.png"; // input값 변경
				alert("경로 변경 ");
				
				var form = $("#memberInfoUpdate");
				form.attr("action","/my/memberInfoUpdate");
				form.attr("method","post");
				form.submit();
			}
			
			
		});
		
		
	</script>
</html>