/*===========================================================================================*/
		//카카오로그인 이동
		$("#kakaoLogin").on("click", function(e){
			$(location).attr("href","/login/kakaoLogin");
		});
			

/*===========================================================================================*/
		//네이버로그인 이동
		$("#naverLogin").on("click", function(e){
			$(location).attr("href","/login/naverLogin");
		});
								

		
/*===========================================================================================*/	
		//아이디/비밀번호 찾기
		$("#idSearch").on("click", function(e){
			$(location).attr("href","/login/search");
		});
				
		
		
/*===========================================================================================*/		
		//회원가입 버튼 클릭시 회원가입 페이지 이동
		$("#signUp").on("click", function(e){
			$(location).attr("href","/login/signUpList");
		});
			
		
/*===========================================================================================*/		
		//로그인으로 이동
		$("#login").on("click", function(e){
			
		 
			if (document.loginForm.rememberID.checked == true) { // 아이디 저장을 체크 하였을때
				setCookie("email", document.loginForm.email.value, 7); //쿠키이름을 id로 아이디입력필드값을 7일동안 저장
			} else { // 아이디 저장을 체크 하지 않았을때
				setCookie("email", document.loginForm.email.value, 0); //날짜를 0으로 저장하여 쿠키삭제
			}
		 
			var email = $("#email").val();
			var pw = $("#pw").val();
			$.ajax({
				url: '/login/loginCheck',
				data: {email:email, pw:pw},
				type: 'post',
				datatype:'JSON',
				success: function(msg){
					console.log(msg);
					if(msg == "성공"){
						email
						$(location).attr("href","/login/login");
					}else{
						
						var frm = document.loginForm;
				        if (!frm.email.value) { //아이디를 입력하지 않으면.
				            alert("아이디를 입력 해주세요!");
				            frm.email.focus();
				            return;
				        }
				        if (!frm.pw.value) { //패스워드를 입력하지 않으면.
				            alert("패스워드를 제발 입력 해주세요!");
				            frm.pw.focus();
				            return;
				        }
						alert("아이디와 비밀번호를 확인해주세요.");
					}
				}	
			}); // end of ajax		
		});
/*===========================================================================================*/
		//쿠키 관련 함수
		window.onload = function() {
			 
		        if (getCookie("email")) { // getCookie함수로 id라는 이름의 쿠키를 불러와서 있을경우
		            document.loginForm.email.value = getCookie("email"); //input 이름이 id인곳에 getCookie("id")값을 넣어줌
		            document.loginForm.rememberID.checked = true; // 체크는 체크됨으로
		        }
		 
		    }
		 
		    function setCookie(name, value, expiredays) //쿠키 저장함수
		    {
		        var todayDate = new Date();
		        todayDate.setDate(todayDate.getDate() + expiredays);
		        document.cookie = name + "=" + escape(value) + "; path=/; expires="
		                + todayDate.toGMTString() + ";"
		    }
		 
		    function getCookie(Name) { // 쿠키 불러오는 함수
		        var search = Name + "=";
		        if (document.cookie.length > 0) { // if there are any cookies
		            offset = document.cookie.indexOf(search);
		            if (offset != -1) { // if cookie exists
		                offset += search.length; // set index of beginning of value
		                end = document.cookie.indexOf(";", offset); // set index of end of cookie value
		                if (end == -1)
		                    end = document.cookie.length;
		                return unescape(document.cookie.substring(offset, end));
		            }
		        }
		    }
		 
		    
/*===========================================================================================*/		    
			
		    
		
		
		
		
		
		
		
		
		
		
		