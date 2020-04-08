
		$(document).ready(function () {
			//카카오로그인 이동
			$("#kakaoLogin").on("click", function(e){
				$(location).attr("href","/login/kakaoLogin");
			});
			
		});
		
		$(document).ready(function () {
			//네이버로그인 이동
			$("#naverLogin").on("click", function(e){
				$(location).attr("href","/login/naverLogin");
			});
								
		});
		
		$(document).ready(function () {
			//아이디/비밀번호 찾기
			$("#idSearch").on("click", function(e){
				$(location).attr("href","/login/idSearch");
			});
				
		});
		
		$(document).ready(function(){
			//회원가입 버튼 클릭시 회원가입 페이지 이동
			$("#signUp").on("click", function(e){
				$(location).attr("href","/login/signUpList");
			});
			
		});
		
		$(document).ready(function () {
			//로그인으로 이동
			$("#login").on("click", function(e){
				$(location).attr("href","/login/login");
			});
				
		});
