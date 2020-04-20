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
</head>
<body>
	<div class="container">
		<div class=" row">
			<nav class="col-2 sidenav">
				<ul class="nav flex-column">
					<li class="nav-item sideMenu"><a class="nav-link" data-bType="2">여행후기</a></li>
					<li class="nav-item sideMenu"><a class="nav-link" data-bType="3">동행찾기</a></li>
					<li class="nav-item sideMenu"><a class="nav-link" data-bType="4">자유게시판</a></li>
				</ul>
			</nav>
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">글 작성</h1>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">

						<div class="panel-heading">Board Register</div>
						<!-- /.panel-heading -->
						<div class="panel-body">

							<form role="form" action="/board/register" method="post">
								<div class="form-group">
									<label>Title</label> <input class="form-control" name='title'>
								</div>

								<div class="form-group">
									<label>Text area</label>
									<textarea class="form-control" rows="3" name='content'></textarea>
								</div>

								<div class="form-group">
									<label>Writer</label> <input class="form-control" name='writer'>
								</div>
								<button type="submit" class="btn btn-default">Submit Button</button>
								<button type="reset" class="btn btn-default">Reset Button</button>
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
	</div>
</body>
</html>