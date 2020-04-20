
	var plan_No = document.getElementById("plan_No"); //플래너 번호
	var email = document.getElementById("email"); //이메일
	var nick_Name = document.getElementById("nick_Name"); //닉네임
	var p_Title = document.getElementById("plannerTitle"); //플래너 제목
	var city_Name = document.getElementById("mainCity"); //대표여행지
	var startDay = document.getElementById("startDay"); //여행 시작일
	var endDay = document.getElementById("endDay"); //여행 종료일
	var thumbnail = document.getElementById("thumbnailFile");
	
	var saveBtn = document.getElementById("save"); // 저장버튼
	var registerBtn = document.getElementById("register"); // 등록버튼
	
	
//=======================================================jQuery 영역==================================================	
	
$(document).ready(function(){
	
	//시작날짜 체크 함수
	function startDayCheck(){
		var start_Arr = startDay.value.split("-");
		var end_Arr = endDay.value.split("-");
		
		console.log(start_Arr);
		console.log(end_Arr);
		
		if(end_Arr != ""){
			for(var i=0; i<start_Arr.length; i++){
				if(start_Arr[i] > end_Arr[i]){
					alert("여행 시작일이 여행 종료일보다 나중일 수 없습니다.");
					startDay.value = "";
					return false;
				}
			}
		}
	}
	
	//종료날짜 체크 함수
	function endDayCheck(){
		var start_Arr = startDay.value.split("-");
		var end_Arr = endDay.value.split("-");
		
		console.log(start_Arr);
		console.log(end_Arr);
		
		if(start_Arr != ""){
			for(var i=0; i<start_Arr.length; i++){
				if(start_Arr[i] > end_Arr[i]){
					alert("여행 시작일이 여행 종료일보다 나중일 수 없습니다.");
					endDay.value = "";
					return false;
				}
			}
		}
	}
	
	
	//필수 요소값 비어있는지 체크
	function inputCheck(p_Content) {
		
		var status = true;
		var text = "";
		var arr = {	"제목" : p_Title.value,
					"대표 여행지" : city_Name.value,
					"여행 시작일" : startDay.value,
					"여행 종료일" : endDay.value,
					"본문" : p_Content
					};
			
		for(var key in arr) {
			if (!arr[key]) {
				text += key + ", "
				status = false;
			}
		}
		if(!status){
			text = text.substring(text.length - 2, -1);
			alert("필수요소가 비어있습니다.\n(" + text + ")");
		}

		return status;
	}
	
	
//=============================================이벤트======================================================	
	
	
	//시작날짜 체크 이벤트
	startDay.addEventListener("change", startDayCheck);

	//종료날짜 체크 이벤트
	endDay.addEventListener("change", endDayCheck);
	
	//저장버튼 클릭시 이벤트
	saveBtn.addEventListener("click", function() {

		if(!email.value){
			alert("로그인하셔야 저장이 가능합니다.");
			return false;
		}
		
		//작성한 문서 값 얻어오기
		var p_Content = CKEDITOR.instances.p_Content.getData();

		//여행기간 원하는 형식으로 다시 조정하기
		var date = "";
		var day1 = startDay.value.replace(/-/gi, ".");
		var day2 = endDay.value.replace(/-/gi, ".");
		
		//빈양식 없으면 DB에 저장
		if(inputCheck(p_Content)){
			var obj ={	"plan_No" : plan_No.value,
						"email" : email.value,
						"nick_Name" : nick_Name.value,
						"p_Title" : p_Title.value,
						"city_No" : city_Name.value,
						"trip_Period" : day1+"-"+day2,
						"p_Content" : p_Content
					};
		
			$.ajax({
	            url: "/planner/save",
	            data: obj,
	            type: 'post',
	            dataType: 'JSON',
	            success: function(map){
	            	if(map.list.plan_No){
	            		plan_No.value = map.list.plan_No;
	            		console.log("플래너 번호 = "+map.list.plan_No);
	            		alert(map.list.updateDate + "에 저장되었습니다.");
	            	}
	            },
	            error: function(xhr){
	            	console.log("실패", xhr); 
	            }
	        });
		}
	});

	
	$("#newPlanner").on("click",function(){
		var check = confirm("확인 시 저장되지 않은 내용은 모두 사라집니다.");
		if(check){
			$(location).attr('href','/planner/write');
		}
	});
	
	
	
	
	

	// ? 클릭 시 팝오버 
	$('[data-toggle="popover"]').popover();

	// ToolTip 띄우기
	$('[data-toggle="tooltip"]').tooltip({
	    html: true
	});

}); //end of ajax



//플래너 정보 셋팅
function getPlannerInfo(index){
	var check = confirm("확인 시 저장되지 않은 내용은 모두 사라집니다.");
	if(check){
		$.ajax({
	        url: "/planner/getPlannerInfo",
	        data: {"plan_No" : index},
	        type: 'post',
	        dataType: 'JSON',
	        success: function(map){
	        	document.getElementById("plan_No").value = map.data.plan_No;
	        	console.log(document.getElementById("plan_No").value);
	        	p_Title.value = map.data.p_Title;
	        	
	        	city_Name.value = map.data.city_No;
	        	
	        	var fullDay = map.data.trip_Period.split("-");
	        	var start = fullDay[0].split(".");
	        	var end = fullDay[1].split(".");
	        	var day1 = start[0]+"-"+start[1]+"-"+start[2];
	        	var day2 = end[0]+"-"+end[1]+"-"+end[2];
	        	
	        	startDay.value = day1;
	        	endDay.value = day2;
	        	
	        	CKEDITOR.instances.p_Content.setData(map.data.p_Content);
	        	
	        	
	        },
	        error: function(xhr){
	        	console.log("실패", xhr); 
	        }
	    });
	}
}









