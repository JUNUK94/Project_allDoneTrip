<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html>

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>ALLDONE TRIP</title>
</head>

<body>
	<header class="main_menu">
		<div class="sub_menu">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-sm-12 col-md-6"></div>
					<div class="col-lg-6 col-sm-12 col-md-6">
						<div class="sub_menu_social_icon">
							<a href="#">
								<i class="flaticon-facebook"></i>
							</a> 
							<a href="#">
								<i class="flaticon-twitter"></i>
							</a> 
							<a href="#">
								<i class="flaticon-skype"></i>
							</a> 
							<a href="#">
								<i class="flaticon-instagram"></i>
							</a>
							<span>
								<i class="flaticon-phone-call"></i>
								+81 2-2153-3245
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="main_menu_iner">
			<div class="container">
				<div class="row align-items-center ">
					<div class="col-lg-12">
						<nav class="navbar navbar-expand-lg navbar-light justify-content-between">
							<a class="navbar-brand" href="/"> 
								<img src="http://alldonetrip.shop/resources/img/basic/logo/logo2.png" width="130px" alt="logo">
							</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>

							<div
								class="collapse navbar-collapse main-menu-item justify-content-center"
								id="navbarSupportedContent">
								<ul class="navbar-nav">
									<li class="nav-item">
										<a class="nav-link" href="/">Home</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="/about">Tour Info</a></li>
									<li class="nav-item dropdown">
										<a 	class="nav-link dropdown-toggle" href="/planner/list"
											id="navbarDropdown" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">
											planner
										</a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="/planner/write">
												나만의 플래너 작성하기
											</a>
											<a class="dropdown-item" href="/planner/list">
												모두의 플래너
											</a>
										</div></li>
									<li class="nav-item dropdown">
										<a 	class="nav-link dropdown-toggle" href="blog.html"
											id="navbarDropdown_1" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> 
											Community
										</a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
											<a class="dropdown-item" href="/community/">전체</a> 
											<a class="dropdown-item" href="/community/list?b_Type=2">여행 후기</a> 
											<a class="dropdown-item" href="/community/list?b_Type=3">동행 찾기</a>
											<a class="dropdown-item" href="/community/list?b_Type=4">서로서로 답해요</a>
										</div>
									</li>
									<li class="nav-item dropdown">
										<a 	class="nav-link dropdown-toggle" href="blog.html"
											id="navbarDropdown_1" role="button" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> 
											MyPage
										</a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
											<a class="dropdown-item" href="tour_details.html">나의 플래너</a> 
											<a class="dropdown-item" href="top_place.html">나의 게시글</a> 
											<a class="dropdown-item" href="tour_details.html">스크랩</a>
											<a class="dropdown-item" href="elements.html">회원정보수정</a>
										</div>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="contact.html">Contact</a>
									</li>
								</ul>
							</div>
							<ul class="navbar-nav">
								<li class="nav-item">
									<a class="nav-link text-primary" href="/">Log in</a>
								</li>
								<li class="nav-item">
									<a class="nav-link text-primary" href="/">Sign up</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
</body>

</html>