/*===========================================================================================*/
	//email 체크 이벤트
	$("#email").on("keyup",function(e){
		var email = $(this).val();
		console.log(email);
		
		$.ajax({
			url: '/login/inputCheck',
			data: {email:email},
			type: 'get',
			datatype: 'json',
			success: function(message){
				console.log(message);
				
				var div = $("div.emailCheckStatus");
				if(message != "사용하실 수 있는 이메일입니다."){
					div.css("color","red");
				} else{
					div.css("color","#00C6ED");
				}
				div.html(message);
			}	
		}); // end of ajax
	});

	
/*===========================================================================================*/
	//비밀번호 채크
	$("#pw").on("keyup",function(e){//비밀번호 8자 이상 & 문자 포함
		
		var password = $(this).val();
		var onlyNumber = isNaN(password);	//숫자여부 판단 (숫자면 false, 문자가 섞이면 true)
		var passwordDiv = $("div.passwordCheckStatus");
		var str ="";
		
		console.log(password);
		console.log(onlyNumber);
		
		if(password.length >= 8){   //글자수 8자리 이상 여부 판단
			if(password.length > 20){ //글자수 20자리 이상 여부 판단
				passwordDiv.css("color","red");
				str = "비밀번호가 너무 길어요";
			}else{
				if(!onlyNumber){ //숫자만 있는지 여부 판단
					passwordDiv.css("color","red");
					str = "문자를 최소 1글자 이상 포함해주세요";	
				}else{
					passwordDiv.css("color","#00C6ED");
					str = "OK";
				}
			}
		}else{
				passwordDiv.css("color","red");
				str = "최소 8자리 이상으로 입력해주세요";
		}
		passwordDiv.html(str);
	});
	
	
/*===========================================================================================*/
	//성별 선택하면 띄워주는 함수
	$("#gender").on("change",function () {
		var genderSelect = $("div.genderSelect");
		var obj_id = $("#gender").val();
		genderSelect.html("<strong>"+obj_id+"</strong>");
	 
	});
	
	
/*===========================================================================================*/
	//통신사 선택시 얼러트
	$("#agency").on("change",function () {
		var agency = $("#agency").val();
		alert(agency);
	 
	});
	
	
/*===========================================================================================*/
	// 생년월일 체크 이벤트
	$("#birth").on("keyup",function(e){
		
		var birthday = $(this).val();
		var onlyNumber = isNaN(birthday);	//숫자여부 판단 (숫자면 false, 문자가 섞이면 true)
		var birthdayDiv = $("div.birthdayCheckStatus");
		
		console.log(birthday);
		console.log(onlyNumber);
		
		if(birthday.length == 8){   //글자수 8자리 판단
			if(!onlyNumber){ //숫자여부 판단
				birthdayDiv.css("color","#00C6ED");
				birthdayDiv.html("OK");
			}else{
				birthdayDiv.css("color","red");
				birthdayDiv.html("숫자만 입력해주세요");
			}
		}else{
			if(!onlyNumber){ //숫자여부 판단
				birthdayDiv.css("color","red");
				birthdayDiv.html("8자리 숫자로 입력해주세요");
			}else{
				birthdayDiv.css("color","red");
				birthdayDiv.html("숫자만 입력해주세요");
			}
		}
	});
	
	
/*===========================================================================================*/
	//nickname 체크 이벤트
	$("#nick_Name").on("keyup",function(e){
		var nick_Name = $(this).val();
		console.log(nick_Name);
		
		$.ajax({
			url: '/login/nick_NameCheck',
			data: {nick_Name:nick_Name},
			type: 'get',
			datatype: 'json',
			success: function(message){
				console.log(message);
				
				var div = $("div.nicknameCheckStatus");
				if(message != "사용하실 수 있는 닉네임입니다."){
					div.css("color","red");
				} else{
					div.css("color","#00C6ED");
				}
				div.html(message);
			}	
		}); // end of ajax
	});
	
	
/*===========================================================================================*/
	//회원가입 버튼 클릭시 회원가입 페이지 이동
	$("#join").on("click", function(){
		var form = $("#signUpForm");
		form.attr("action","/login/insertMember");
		form.attr("method","post");
		form.submit();
	});
	
	
/*===========================================================================================*/	
	
	
	
	
	
	
	