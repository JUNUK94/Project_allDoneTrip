<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-sm mt-5 border" >
		<div class="row mt-5"></div>
		<div class="row">
		
		<form id="idSearchForm">
			<div class="col border text-center">
				<div class="row badge badge-primary" id="idSearch" style="position: relative; font-size:14pt;">아  이  디    찾  기</div><br>
					<div class="row">
						<div class="col-3"></div>
						<div class="col mt-2">이름과 전화번호를 입력해주세요.</div>
						<div class="col-3"></div>
					</div>
					<div class="row">
						<div class="col-3"></div>
						<div class="col mt-2">
							<input type="text" class="form-control" placeholder="이름" name="name"><br>
							<input type="text" class="form-control" placeholder="전화번호" name="phone_Num">
						</div>
						<div class="col-3"></div>
					</div>
				<div class="row mt-4">
					<div class="col-3"></div>
					<div class="col">
						<button type="button" class="btn btn-link btn-sm" id="idButton">아이디찾기</button>
					</div>
					<div class="col-3"></div>
				</div>
			</div>
		</form>
		
		<form id="pwSearchForm">
			<div class="col border text-center">
				<div class="row badge badge-primary" id="pwSearch" style="position: relative; font-size:14pt;">비 밀 번 호  찾 기</div><br>
					<div class="row">
						<div class="col-3"></div>
						<div class="col mt-2">아이디와 전화번호를 입력해주세요.</div>
						<div class="col-3"></div>
					</div>
					<div class="row"> 
						<div class="col-3"></div>
						<div class="col mt-2">
							<input type="text" class="form-control" placeholder="이메일" name="email"><br>
							<input type="text" class="form-control" placeholder="전화번호" name="phone_Num">
						</div>
						<div class="col-3"></div>
					</div>
				<div class="row mt-4">
					<div class="col-3"></div>
					<div class="col">
						<button type="button" class="btn btn-link btn-sm" id="pwButton">비밀번호찾기</button>
					</div>
					<div class="col-3"></div>
				</div>
			</div>
		</form>
		
		</div>
		<div class="row mt-5"></div>
	</div>
</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="/resources/js/login/idSearch.js"></script>
</html>