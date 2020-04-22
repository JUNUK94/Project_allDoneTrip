$(document).ready(function(){
	
	
	var searchForm = $("#searchForm");
	
	
	checked="checked"
	
	
	// 좋아요 클릭시
	$("#likeBtn").on("click",function(){
		var email = $("input[name='email']").val();
		var plan_No = $("input[name='plan_No']").val();
		var origin_LikeCnt = $("label[name='likeCnt']").html();
		
		console.log(email);
		console.log(plan_No);
		console.log(origin_LikeCnt);
		
		if(email != null && email != ""){
			$.ajax({
				url: '/planner/like',
				type: 'post',
				dataType: 'json',
				data: {email:email, plan_No:plan_No},
				success: function(map){
					alert(map.message);
					window.location.reload();
				}
			});//end of Ajax
		}else{
			alert("먼저 로그인이 필요합니다.");
		}
	});
	
	
	// 키워드 입력하여 검색
	$("#keyword").on("keydown", function(key){
		if(key.keyCode == 13){
			searchForm.find("input[name='pageNum']").val("1");
			searchForm.find("input[name='amount']").val("10");
			searchForm.find("input[name='sortType']").val("regdate");
			searchForm.submit();
		}
	});
	
	// 검색버튼 클릭해서 검색
	$("#search_Submit").on("click", function(key){
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.find("input[name='amount']").val("10");
		searchForm.find("input[name='sortType']").val("regdate");
		searchForm.submit();
	});
	
});
