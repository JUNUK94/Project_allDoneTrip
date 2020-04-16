<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>올던트립 회원가입</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script type="text/javascript">
	  Kakao.init('c830142e73bf6dbb2bac8a21583ca959');
	  console.log(Kakao.isInitialized());
  </script>
  <script src="/resources/js/login/signUpList.js"></script>
</head>
<body>
	<div class="container-sm mt-5 border" >
		<div class="row ">
			<div class="col text-center"><h1>회원가입</h1></div>
		</div>
		<div class="row">
			<div class="col border text-center middle">
				<br>
				<br>
				<br>
				<button type="button" class="btn btn-primary" id="allDoneSignUp">올던트립 회원가입</button>
				<br>
				<br>
				<br>
			</div>
    	<div class="col border text-center middle" >
		    	<br>
				<br>
				<br>
	    <a href="${kakao_url}">
	    		<button type="button" class="btn btn-warning" id="kakao_id_login">카카오로 회원가입</button>
	    </a>
			   	<br>
				<br>
				<br>
		</div>
		<div class="col border text-center middle" >
		    	<br>
				<br>
				<br>
	    		<button type="button" class="btn btn-success" id="naverSignUp">네이버로 회원가입</button>
		    	<br>
				<br>
				<br>
	    </div>
	</div>
</div>

</body>
	
</html>