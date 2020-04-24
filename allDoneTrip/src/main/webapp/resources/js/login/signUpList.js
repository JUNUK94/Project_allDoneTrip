		
		$(document).ready(function(){
			//올던트립 회원가입 버튼 클릭시 회원가입 페이지 이동
			$("#allDoneSignUp").on("click", function(e){
				$(location).attr("href","/login/signUp/allDoneSignUp");
			});
			
		});
		
	/*	$(document).ready(function(){
			//카카오 회원가입 버튼 클릭시 회원가입 페이지 이동
			$("#kakaoSignUp").on("click", function(e){
				$(location).attr("href","/login/signUp/kakaoSignUp");
			});
			
		});*/
		
		$(document).ready(function(){
			//네이버 회원가입 버튼 클릭시 회원가입 페이지 이동
			$("#naverSignUp").on("click", function(e){
				$(location).attr("href","/login/signUp/naverSignUp");
			});
			
		});
		
		
		