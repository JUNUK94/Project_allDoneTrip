<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>올던트립 로그인</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-sm mt-5 border" >
		<div class="row ">
			<div class="col text-center"><h1>로그인 쟝</h1></div>
		</div>
		<div class="row">
			<div class="col border">
				<br>
				<input type="text" class="form-control" value="아이디" id="usr">
				<br>
				<input type="text" class="form-control" value="비밀번호" id="pw">
				<br>
				<button type="button" class="btn btn-primary btn-block" id="">로그인</button>
				<br>
			</div>
    		<div class="col border text-center middle" >
    		
	    		<div class="container-sm mt-4">
	    			<button type="button" class="btn btn-warning" id="">카카오 로그인</button>
	    		</div>
	    		<div class="container-sm mt-4">
	    			<button type="button" class="btn btn-success" id="">네이버 로그인</button>
	    		</div>
    		</div>
		</div>
		<div class="row">
			<button type="button" class="btn btn-link col text-left" id="">아이디/비밀번호 찾기 </button>
			
			<button type="button" class="btn btn-link col text-right" id="signUp">회원가입 </button>
		</div>
	
</body>
<script type="text/javascript">	
		$(document).ready(function(){
			//회원가입 버튼 클릭시 회원가입 페이지 이동
			$("#signUp").on("click", function(e){
				$(location).attr("href","/login/signUpList");
			});
			
		});
		
		$(document).ready(function () {
			
					
		});
	</script>
</html>