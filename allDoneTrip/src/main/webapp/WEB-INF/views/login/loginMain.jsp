<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>올던트립 로그인</title>
</head>
<body>
<!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>올던트립 로그인</h2>
                            <p>allDone login</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    
    <br><br><br>
	<div class="container-sm mt-5 border" >
		<div class="row ">
		</div>
		<form action="/login/loginCheck" method="post" name="loginForm" id="loginForm">
			<div class="row">
				<div class="col border">
					<br>
					<input type="text" class="form-control" placeholder="이메일" id="email" name="email">
					<br>
					<input type="password" class="form-control" placeholder="비밀번호" id="pw" name="pw"><br>
					<input class="rememberID" id="rememberID" name="rememberID" type="checkbox">아이디 기억하기
					<br>
					<button type="button" class="btn btn-primary btn-block" id="login">로그인</button>
					<br>
				</div>
				
		    	<div class="col border text-center middle">
			    	<div class="container-sm mt-4">
			    		<a href="https://kauth.kakao.com/oauth/authorize?client_id=c830142e73bf6dbb2bac8a21583ca959&redirect_uri=http://localhost:8080/login/kakaoLogin&response_type=code">
			    		<button type="button" class="btn btn-warning" id="kakaoLogin">카카오 로그인</button></a>
				   	</div>
				  	
			    	<div class="container-sm mt-4">
			    		<a href=" ${naver_url}"><button type="button" class="btn btn-success" id="naverLogin">네이버 로그인</button></a>
			   		</div>
		    	</div>
			</div>
		</form>
		<div class="row">
			<div class="col-4">
				<button type="button" class="btn btn-link btn-sm col text-left" id="idSearch">아이디/비밀번호 찾기 </button>
			</div>
			<div class="col-5"></div>
			<div class="col-3">
				<button type="button" class="btn btn-link btn-sm col text-right" id="signUp">회원가입 </button>
			</div>
		</div>
	</div>
	<div class="container-sm mt-4">
	<br><br><br><br>
	</div>

</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
		Kakao.init('c830142e73bf6dbb2bac8a21583ca959');
		console.log(Kakao.isInitialized());
	</script>
	<script src="/resources/js/login/loginMain.js"></script>
</html>