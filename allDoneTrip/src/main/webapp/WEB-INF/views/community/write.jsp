<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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
	<div class="container">
		<nav class="col-2 sidenav float-left">
			<h2 class="mt-3">커뮤니티</h2>
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link sideMenu paddingRemove mt-2" data-btype="2">여행후기</a></li>
				<li class="nav-item"><a class="nav-link sideMenu paddingRemove mt-2" data-btype="3">동행찾기</a></li>
				<li class="nav-item"><a class="nav-link sideMenu paddingRemove mt-2" data-btype="4">자유게시판</a></li>
			</ul>
		</nav>
		<div class="col-10 float-right">
			<div class="panel panel-default">
				<form action="/community/register" method="post">
					<div class="form-group float row">
						<label class="col-2" style="text-align: center; vertical-align: middle;">Title</label> <input class="form-control col-10" name='title'>


					</div>
					<!-- 에디터 영역 -->
					<div id="editor_area" class="d-flex flex-column order-2">
						<div class="col_c" style="margin-bottom: 30px">
							<div class="input-group">
								<textarea id="b_Content" class="form-control" name="b_content"></textarea>

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

					<button type="submit" class="btn btn-default">등록</button>
					<button type="reset" class="btn btn-default">다시 작성</button>

				</form>

			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
	</div>
	<!-- /.row -->
	</div>
</body>
<script src="${contextPath}/resources/CKEditor/ckeditor/ckeditor.js"></script>
<script>
	CKEDITOR.replace('b_Content', {
		height : 400,
		width : '100%',
		filebrowserImageUploadUrl : '/upload/imageInput', //이미지 업로드 시 저장경로 
		imageUploadUrl : '/upload/dragImage' //드래그&드롭 시 이미지저장 경로
	});
</script>
</html>