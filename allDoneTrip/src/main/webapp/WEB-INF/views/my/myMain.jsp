<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			
		</div>
	</div>

</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="/resources/js/my/myMain.js"></script>
</html>