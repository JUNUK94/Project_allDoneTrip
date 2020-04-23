$(document).ready(function(){
	
	
	var searchForm = $("#searchForm");
	var sessionForm = $("#sessionForm");
	var plan_No = sessionForm.find("input[name='plan_No']").val();
	var email = sessionForm.find("input[name='email']").val();
	
	// 좋아요 클릭시
	$("#likeBtn").on("click",function(){
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
					$(this).css("backgroundColor", "#fe5c24");	//주홍색으로 변경
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
	
	
	// 스크랩 버튼 클릭
	$("#scrapBtn").on("click", function(){
		var status;
		
		if($(this).css("backgroundColor") == "rgb(92, 209, 229)"){	//스크랩
			status = false;
		}else{		//스크랩 취소
			status = true;
		}
		
		$.ajax({
			url: '/planner/scrap',
			type: 'POST',
			data: {plan_No:plan_No, email:email, status:status},
			dataType: 'JSON',
			success: function(map){
				if(map.result == "insert"){
					$(this).css("backgroundColor", "#fe5c24");	//주홍색으로 변경
				}else if(map.result == "delete"){
					$(this).css("backgroundColor", "rgb(92, 209, 229)");	//하늘색으로 변경
				}
				location.reload();
			},
			error:function(){
			}
		});
	});
	
	
	// 플래너 수정버튼 클릭 -> 수정페이지로 이동
	$("#modify_Planner").on("click", function(e){
		e.preventDefault();
		$(location).attr("href","/planner/write?plan_No="+plan_No);
	});
	
	
	// 플래너 삭제버튼 클릭 -> 삭제
	$("#delete_Planner").on("click", function(e){
		
		$("#delete_Planner_Modal").modal("hide");
		
		$.ajax({
			url: '/planner/delete',
			type: 'post',
			dataType: 'JSON',
			data: {plan_No:plan_No},
			success: function(map){
				var result = "<br>정상적으로 삭제 완료되었습니다.<br><br>";
				
				$("#delete_Planner_Result").html(result);
				$("#delete_Planner_Result_Modal").modal("show");
			},
			error:function(){
				alert("삭제에 실패하였습니다.");
			}
		});//end of Ajax
	});
	
	
	// 플래서 삭제 확인 결과 모달 닫기버튼 클릭
	$(".modal-close").on("click", function(){
		$(location).attr("href","/planner/list");
	});
	
	
	
	
});
