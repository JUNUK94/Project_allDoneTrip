<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <style>
  .span {
    display: inline-block;
    width: 70px;
    height: 70px;
    margin: 6px;
    background-color: #555;
  }
  .textcentered{
   height:25px; top: 0; bottom:0; margin-top:auto; margin-bottom:auto;
  }
  </style>
</head>

<body>
<div class="wrapper">
	<div class="container">
		<div class="row bg-primary">
			<div class="col-md-4">
			</div>
			<div class="col-md-4">
			<img src="../../resources/img/header/alldone.PNG"></div>
			<div class="col-md-4" align="right"> 
				<img src="../../resources/img/planner/Non_User_Photo.JPG" class="rounded-circle span"> 
				<h4>최나애님</h4>
				<p>마이페이지/로그아웃</p>
			</div>
		</div>
	</div>
	
	<div class = "container">
		<div class="row bg-dark text-center" style="height:50px">
			<div class="col-md-3 textcentered">
				<a href="#">여행정보</a>
			</div>
			<div class="col-md-3 textcentered">
				<a href="#">여행플래너</a>
			</div>
			<div class="col-md-3 textcentered">
				<a href="#">커뮤니티</a>
			</div>
			<div class="col-md-3 textcentered">		
				<a href="#">마이페이지</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>