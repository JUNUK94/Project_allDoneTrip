<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>	
	<script src="/resources/js/login/allDoneSignUp.js"></script>
<!--========================================jquery 링크=============================================-->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
			integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
			crossorigin="anonymous"></script>
<!--========================================카카오 js 링크=============================================-->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!--===============================================================================================-->
</head>

<body>


	<div class="row mt-2 text-center" >
			<div class="col "><h1>회원가입</h1></div>
		</div>
		<form id="signUpForm" >
		<div class="row mt-3 " >
			<div class="col-2 "><p class='divText'>Email*</p></div>
			<div class="col "><input type="text" class="form-control" placeholder="Email" id="email" name="email" value="${email }"></div>
		</div>
		<div class="row" >
			<div class="col-2"></div>
			<div class="col-8">
				<div class="emailCheckStatus" style="font-size:8pt;"></div>
			</div>
		</div>
		<div class="row mt-3" >
			<div class="col-2"><p class='divText'>Password*</p></div>
			<div class="col "><input type="password" class="form-control" placeholder="Password" id="pw" name="pw"></div>
		</div>
		<div class="row" >
			<div class="col-2"></div>
			<div class="col-8">
				<div class="passwordCheckStatus" style="font-size:8pt;"></div>
			</div>
		</div>
		<div class="row mt-3" >
			<div class="col-2"><p class='divText'>Name*</p></div>
			<div class="col "><input type="text" class="form-control" placeholder="Name" id="name" name="name"></div>
		</div>
		<div class="row mt-3" >
			<div class="col-2"><p class='divText'>Birthday*</p></div>
			<div class="col "><input type="text" class="form-control" placeholder="ex)19990101" id="birth" name="birth"></div>
		</div>
		<div class="row" >
			<div class="col-2"></div>
			<div class="col-8">
				<div class="birthdayCheckStatus" style="font-size:8pt;"></div>
			</div>
		</div>
		<div class="row mt-3" >
			<div class="col-2 " >
				<p class='divText'>SEX*</p>
			</div>
			<div class="col-2 text-center">
				<select class="form-control" id="gender" name="gender">
					<option value="">sex</option>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
				</select>
			</div>
			<div class="col " >
				<div class="genderSelect badge badge-light" id="genderSelect" style="position: relative; top: 10%; font-size:15pt;" ></div>
			</div>
		</div>
		<div class="row mt-3" >
			<div class="col-2"><p class='divText'>Nickname*</p></div>
			<div class="col "><input type="text" class="form-control" placeholder="nick_Name" id="nick_Name" name="nick_Name" value="${nickName}"></div>
		</div>
		<div class="row" >
			<div class="col-2"></div>
			<div class="col-8">
				<div class="nicknameCheckStatus" style="font-size:8pt;"></div>
			</div>
		</div>
		<div class="row mt-3" >
		<div class="col-2 middle">
			<select class="form-control" id="agency" name="mobile_Co">
				<option value="">agency</option>
				<option id="sk" value="SKT">SKT</option>
				<option id="kt" value="KT">KT</option>
				<option id="lg" value="LGU+">LGU+</option>
			</select>
		</div>
		<div class="col-10">
			<input type="text" class="form-control" placeholder="Phone Number(only number)" id="phone_Num" name="phone_Num">
		</div>
		</div>
		<div class="row mt-5 " >
		</div>
		<div class="row mt-3 " >
			<button type="button" class="btn btn-primary btn-block" id="join">회원가입</button>
		</div>
		</form>
		<div class="container-sm mt-3 " ></div>
	</div>	
</div>
</div>
</body>


</html>