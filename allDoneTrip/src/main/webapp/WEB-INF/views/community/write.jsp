<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	session.setAttribute("email", "herbing@naver.com");
	session.setAttribute("nick_Name", "wowgarcon");
	//session.invalidate();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--=====================================jquery=========================================-->

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="http://maps.google.com/maps/api/js?key=AIzaSyBS2oAuYkl-89AZWRlo4UkUFVgWHLcN2qM"></script>
<!--===================================bootstrap========================================-->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="/resources/css/community.css" rel="stylesheet">
<!-- <script src="/resources/js/ajaxCrossOrigin/jquery.ajax-cross-origin.min.js"></script> -->

<script src="${contextPath}/resources/js/planner/plannerWrite.js"></script>

</head>
<body>
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>커뮤니티</h2>
							<p>Share your Story</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container">
		<div class="col-12">
			<div class="panel panel-default">
				<form id="regForm" action="/community/register" method="post">
					<div class="form-group float row">
						<select class="selectWriterType col-2 b_TypeSet" >
						    <option value="" selected disabled hidden >게시판 종류</option>
						    <option value="2" >여행 후기</option>
						    <option value="3" >동행 찾기</option>
						    <option value="4" >자유게시판</option>
						</select >
						<label class="col-2" style="text-align: center; vertical-align: middle;">글 작성</label> 
						<input class="form-control col-8" name='title'>
					</div>
					<!-- 에디터 영역 -->
					<div id="editor_area" class="d-flex flex-column order-2">
						<div class="col_c" style="margin-bottom: 30px">
							<div class="input-group">
								<textarea id="b_content" class="form-control" name="b_content"></textarea>
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
					</div>
					<!-- end of 에디터 영역 -->
					
					
					<input type='hidden' name='b_Type' value=''> 
					<button class="btn btn-default regBtn">등록</button>
					<button type="reset" class="btn btn-default">다시 작성</button>

				</form>

			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->

</body>
<script src="${contextPath}/resources/CKEditor/ckeditor/ckeditor.js"></script>
<script>
	CKEDITOR.replace('b_content', {
		height : 400,
		width : '100%',
		filebrowserImageUploadUrl : '/upload/imageInput', //이미지 업로드 시 저장경로 
		imageUploadUrl : '/upload/dragImage' //드래그&드롭 시 이미지저장 경로
	});
</script>
<script>
$(document).ready(function() {

	var regForm = $("#regForm");
	
	$('.b_TypeSet').on("click", function (e) {
		e.preventDefault();

		regForm.find("input[name='b_Type']").val($(this).val());
	});
	
	$('.regBtn').on("click", function (e) {
		e.preventDefault();
		
		regForm.submit();		
	});
	
});
</script>
</html>